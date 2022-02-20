## Diagnostics

### Introduction

The application is capable of providing diagnostics whilst processing results; info/warning/error messages.

This document provides insight into what the application can handle and the significance of various messages.

There are 3 classes of message written to the console:

- "INFO" messages are shown for the current year by default. They can be enabled for previous years in the app configuration.
- "WARNING "messages are shown for the all years by default. They can be disabled for previous years in the app configuration.
- "ERROR" messages will only be output in the event of a critical failure, usually accompanied by a stack trace to aid diagnostics.



### Info Messages

Info messages are purely for informational purposes and by default they are suppressed for previous years.

The current list of info messages is relatively short:

- INFO: N runs by N participants down course XX on YYYY-MM-DD - HH:MM:SS to HH:MM:SS
  - This simply shows the number of runs for each course, after the time limits have been applied.
- INFO: N duplicate runs removed for NAME (CRAFT) on YYYY-MM-DD - N% dupes
  - This shows how many "duplicate" GT-31 runs have been automatically removed by the processing.
- INFO: Entry type exceeded by NAME (CRAFT, ENTRY TYPE) in YYYY - N sessions
  - This will show people exceeding their 2-day entry and /or youths competing in additional sessions.
- INFO: Possible middle name for NAME - remove if not needed
  - This will report people who provide multiple first names. This may be desirable for some entrants.

Note: Info messages are purely for informational purposes and do not require any follow up activity.



### Warning Messages

Since there are so many different warning messages they have been split into "Entrant Details" and "Session Results".

When a warning is issued it may be important for the details to be corrected in the entrants list, followed by a re-run of the reports.



#### Entrant Details

There are a number of messages that can be generated when the event contains invalid entrant details.

The event config contains a list of possible values for each attribute, enabling automatic validation and an appropriate fix:

- WARNING: NAME had a craft type of "XXX" - changed to TBC
- WARNING: NAME had a status of "XXX" - changed to TBC
- WARNING: NAME had an entry type of "XXX" - changed to TBC
- WARNING: NAME had a grouping of "XXX" - changed to TBC
- WARNING: NAME had a gender of "XXX" - changed to ?
- WARNING: NAME had a first timer flag of "XXX" - changed to ?
- WARNING: NAME had a novice flag of "XXX" - changed to ?
- WARNING: NAME had a master flag of "XXX" - changed to ?
- WARNING: NAME had a UKWA flag of "XXX" - changed to ?
- WARNING: NAME had a ISWC flag of "XXX" - changed to ?

Note: It may be important for the appropriate details to be corrected in the entrants list, followed by a re-run of the reports.



Gold Fleet and Pro Fleet competitors cannot be entered as a "first timer", formerly known as a "novice":

- WARNING: NAME was entered as a first timer but is STATUS - changed first timer flag to N
  - The status of the entrant means they are excluded from being a first timer.
- WARNING: NAME was entered as a novice but is STATUS - changed novice flag to N
  - The status of the entrant means they are excluded from being a novice.

Note: It may be desirable for the appropriate details to be corrected in the entrants list, thus eliminating these warnings.



Checks for duplicate entrants or possible errors in the name; similar but not identical to previous years:

- WARNING: Duplicate name NAME (CRAFT TYPE) in YEAR
  - This may be important as it indicates something is wrong in the entrants list
- WARNING: Similar names - NAME_1 vs NAME_2 YEARS
  - This may be important if the profile pages require identical names across all years.

Note: It may be required for the appropriate details to be corrected in the entrants list, followed by a re-run of the reports.



An unrecognised nationality will result in the following warning:

- WARNING: Unrecognised nationality for NAME - NATIONALITY
  - This may be important if the presence of a national flag is desirable on the results pages.

Note: It may be desirable for the appropriate details to be corrected in the entrants list, followed by a re-run of the reports.



#### Session Results

When processing session results the following warnings may be generated:

- WARNING: Runs found before course XX opened on YYYY-MM-DD - earliest was HH:MM:SS
  - This will be important and you should check / fix the "start time" defined in the course configuration file.
- WARNING: Runs found after course XX closed on YYYY-MM-DD - latest was HH:MM:SS
  - This will be important and you should check / fix the "end time" defined in the course configuration file.

If the reporting engine encounters results for an unknown craft type it may generate the following warnings:

- WARNING: "Craft Type TBC" report on YYYY-MM-DD generated results
  - This may be important and the craft type needs to be correctly specified in the entrants list.
- WARNING: "Craft Type TBC" report generated results
  - This may be important and the craft type needs to be correctly specified in the entrants list.

When processing GPS results the following warnings may be generated:

- WARNING: Unrecognised GT-31 ID XXX on YYYY-MM-DD
  - This will be important as it occurs when a GT-31 cannot be matched to an existing entrant; craft type=TBC, status=TBC, etc.
- WARNING: Auto-matched GT-31 ID XXX to NAME (CRAFT TYPE)
  - This may be important as it occurs after auto-matching the ID of a GT-31 such as "GEORG8MICHA" to "Michael George".
- WARNING: Unrecognised GT-31 SN for NAME (CRAFT TYPE) on YYYY-MM-DD - NNN vs NNN
  - This may be important as it occurs when a GT-31 ID is re-used on a second GT-31 device.

Note: These warning messages listed above will not prevent results from being generated / published but they should be carefully considered. It may be important for the appropriate details to be corrected in the entrants list, followed by a re-run of the reports.



A number of warnings may be generated for years prior to 2010 but will not occur unless somebody changes the data:

- WARNING: Auto-matched sail number NNN to NAME (CRAFT TYPE)
  - This occurs after auto-matching the name of a result to an existing entrant, despite the sail number being unrecognised.
- WARNING: Name mismatch for sail NUMBER - NAME_1 vs NAME_2
  - This occurs if the name on the result does not match the name of the entrant who has registered the sail number.
- WARNING: Unrecognised sail number NNN (CRAFT TYPE) on YYYY-MM-DD
  - This happens if the sail number is not recognised and the name could not be matched to an existing entrant.
- WARNING: Unrecognised sail number NNN on YYYY-MM-DD
  - This also happens if the sail number is not recognised and there is the name could not be matched to an existing entrant.

Note: It is not anticipated that warnings relating to sail numbers will occur in the future since all such issues have been fixed.



### Error Messages

Editing the application, event or session configuration files may result in a damaged JSON file.

- ERROR: Could not parse FILENAME
  - This will occur if one of the JSON files is invalid / badly structured. It will cause processing to halt, until remedied.

Editing the GPSDATA or RUNDATA files may result in a damaged CSV file.

- ERROR: Problem parsing GT-31 details in run data - XXXXXX
  - The second column in the file should look something like GEORG8MICHA_123201112_20211011_000000.SBN
- ERROR: Problem parsing run data - XXXXX
  - The only time this has been encountered (so far) is when editing a CSV in Excel resulted in blank lines at the end of the file.

If an error message is generated then the application will also output the full stack trace to assist in diagnosis of the problem.

The processing will stop if an error occurs but once the issue has been resolved, reporting can re-attempted.

