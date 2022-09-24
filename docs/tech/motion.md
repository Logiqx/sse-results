## Motion Server

### Threads

A number of threads will be running within a single process throughout the day.

Threading will ensure that track downloads can be completed as quickly as possible, without being blocked by network searches.

Likewise, network searches (detection of connections / disconnections) will be possible without being blocked by track downloads.

Simple dashboards (essentially HTML files, auto-refreshing every 5 seconds) will show the status of downloads in real-time.



#### Thread 1 - Detect Motions

Create a list of motions without any known address information (i.e. new connections or software startup).

Use a dedicated thread pool (typically 4 workers) to search for motions in the aforementioned list:

- Try to determine the address information using socket.getaddrinfo.
  - If address information is available then try connecting to the IP address on port 80.
    - If the connection attempt fails, discard the address information. This will allow for an auto-retry.
    - If the connection attempt succeeds, close the connection and trigger onwards processing:
      - Set the motion status to "connected".
      - Add the motion to the "connections" queue.
      - Add the motion to the "history" list, removing any earlier entries (if present).
        - The history list will be used to order the motions on the dashboard(s).
        - n.b. The history list will require a mutex to avoid race conditions.
      - Record the connection in the log file.

Sleep for 5 seconds before repeating this process.



#### Thread 2 - Inspect Metadata

A number of worker threads (typically 4) will be reading from the "connections" queue.

For each item retrieved from the queue (corresponding to a single motion), inspect the metadata:

- Retrieve info.json and settings.json from the motion and save in the local cache.
- Retrieve logs.json and save in the local cache.
- Determine if any tracks need to be downloaded by checking if they are already present locally.
  - If downloads are required then trigger the onwards processing:
    - Set the motion status to "pending".
    - Add the motion to the "downloads" queue.
    - Record the presence of files due for download in the log file.
  - If no downloads are required then there is no further processing:
    - Set the motion status to "completed".
    - Record the absence of files due for download in the log file.
- If either of the above steps encounters an error then do the following:
  - Set the motion status to "failed".
  - Discard the address information. This will invoke an auto-retry, via the motion detection thread.
  - Record the nature of the error in the log file.

Note: There is no need for a "sleep" because the worker threads are waiting on the "connections" queue.



#### Thread 3 - Download Tracks

A number of worker threads (typically 4) will be reading from the "downloads" queue.

For each item retrieved from the queue (corresponding to a single motion), download the tracks:

- A single thread will download all of the required tracks for a single motion:
  - Set the motion status to "downloading" prior to the first download.
  - For each track requiring download:
    - Download the track, giving it the appropriate local filename.
    - Record the download in the log file.
  - Set the motion status to "completed" once all tracks have been downloaded.
- If the download process results in an error then do the following:
  - Set the motion status to "failed".
  - Discard the address information. This will invoke an auto-retry, via the motion detection thread.
  - Record the nature of the error in the log file.

Note: There is no need for a "sleep" because the threads are waiting on the "downloads" queue.



#### Thread 4 - Handle Disconnections

Create a list of motions where the status is "completed".

A number of worker threads (typically 4) will determine when motions in the "completed" list disconnect from the network:

- Try connecting to the IP address on port 80.
  - If the connection attempt succeeds, do nothing because the motion is still on the network.
  - If the connection attempt fails then the motion has almost certainly been disconnected from the network:
    - Set the motion status to "disconnected".
    - Discard the address information. Re-connection will automatically be handled by the motion detection thread.
    - Record the disconnection in the log file.

Sleep for 5 seconds before repeating this process.



#### Thread 5 - Dashboards

A single thread will be responsible for updating HTML files every 5 seconds.

The "history list" (maintained by the motion detection thread) will be used to order the motions on the dashboard(s).

n.b. It is almost certain that the motion objects will require a mutex to avoid race conditions with the other 4 threads.



### Startup and Shutdown

It will be important to exit gracefully when the software is terminated to avoid partial HTML files.

Log files might also be malformed if threads are not allowed to exist gracefully.

Clean shutdown can be performed using Python events.

