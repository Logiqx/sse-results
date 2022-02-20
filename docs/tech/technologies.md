## Technologies

### Docker

[Docker](https://en.wikipedia.org/wiki/Docker_(software)) allows this project to be developed, tested and maintained on a variety of operating systems without modification.

Docker runs the reporting in a [container](https://www.docker.com/resources/what-container), automatically handling pre-requisites such as Python and third-party libraries.

There is no need to install specific pre-requisites on the host machine, aside from Docker itself to run the application within a container.

It doesn't matter whether you use Windows, Mac or Linux as your OS. The reporting will run fine thanks to the magic of containers!



### Windows Subsystem for Linux (WSL)

[WSL 2](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux) is the recommended backend for Docker Desktop on Windows but it also allows Linux commands to be run natively:

- Useful commands such as find, grep, sed and awk.
- Packages such as git, jq and csvkit.
- Entire shell scripts.

WSL is incredibly useful and brings the power of the Linux command line to Windows.



### Python

The application code has been written entirely in [Python](https://www.python.org/) due to its high productivity and wide choice of third-party libraries.

This project used [Jupyter Notebook](https://jupyter.org/) as the [IDE](https://en.wikipedia.org/wiki/Integrated_development_environment). This is a popular choice for data scientists but less so for software developers.

The project will probably migrate over to Microsoft's [Visual Studio Code](https://code.visualstudio.com/) at some time in the future.



### Git

[Git](https://git-scm.com/) is the most popular version control system in use today, suitable for small and large projects alike.

This [project](https://github.com/Logiqx/sse-results) is entirely open source and the repository (source code, data and documentation) is stored on [GitHub](https://en.wikipedia.org/wiki/GitHub).

The web pages for Weymouth Speed Week [results](https://logiqx.github.io/wsw-results/results/index.html) are hosted on [GitHub Pages](https://pages.github.com/) due to it's native integration with GitHub.

