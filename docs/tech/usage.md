## Usage

### Operating Systems

Since this project uses [Docker](https://www.docker.com/) you can run it on a range of operating systems; Windows, Linux, Mac, etc.

This document will provide details for users of Windows (Docker Desktop) and Linux (Docker CE).



### Windows Requirements

#### WSL 2

To run Docker Desktop on a Windows machine it is recommended that you use the [WSL 2 backend](https://docs.docker.com/desktop/windows/wsl/).

Prerequisites:

1. Windows 10, version 1903 or higher or Windows 11.
2. Enable WSL 2 feature on Windows. For detailed instructions, refer to the [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
3. Download and install the [Linux kernel update package](https://docs.microsoft.com/windows/wsl/wsl2-kernel).



#### Linux Distribution

[WSL 2](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux) is the recommended backend for Docker Desktop but it also allows Linux commands to be run natively:

- Useful commands such as find, grep, sed and awk.
- Packages such as git, jq and csvkit.
- Entire shell scripts.

WSL 2 is incredibly useful and brings the power of the Linux command line to Windows.

To gain the full benefits of WSL 2 you will will need to install a Linux distribution on your Windows machine.

The installation can be done via the Microsoft store; Ubuntu is the distribution of choice for this project.



#### Docker Desktop

To run Docker on a Windows machine you need [Docker Desktop](https://www.docker.com/products/docker-desktop), included in the free subscription plan [Docker Personal](https://www.docker.com/products/personal).

To install Docker Desktop, simply follow the installation [instructions](https://docs.docker.com/desktop/windows/install/) provided by Docker.



### Ubuntu Requirements

#### Docker CE

To run Docker on a Ubuntu machine you need Docker installed; typically Docker CE (Community Edition).

Simply follow the installation [instructions](https://docs.docker.com/engine/install/ubuntu/) provided by Docker. Installing using the Docker [repository](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) is the recommended approach.

Once Docker is installed and the "hello-world" example runs via "sudo", follow the described [steps](https://docs.docker.com/engine/install/linux-postinstall/) to manage Docker as a non-root user.

Once Docker is installed and can be managed as a non-root user, Ubuntu is ready for the WSW application.



### Application Installation

#### Docker Base Images

Although Docker will automatically "pull" the required base images when building the application image it is preferable to pull them manually, prior to the build.

```shell
$ docker pull jupyter/base-notebook:notebook-6.4.6
$ docker pull python:3.10-slim-bullseye
```

Note: These are the Docker base images on 26 Jan 2022 but the version tags can be confirmed in the project [Dockerfile](https://docs.docker.com/engine/reference/builder/).



#### Clone the WSW Repository

You may need to install git:

```shell
$ sudo apt-get update
$ sudo apt-get install git-all
```

Clone the project repository to create a local copy:

```shell
$ git clone git@github.com:Logiqx/wsw-results.git
```

If the git command fails, you may not have set up a password protected SSH key. You may therefore prefer to use HTTPS instead:

```shell
$ git clone https://github.com/Logiqx/wsw-results.git
```

Note: The project repository contains numerous large files and was approximately 370MB in size on 26 Jan 2022.



#### Build the Docker Image

The Docker image for the project is created by running a shell script from within the project root:

```shell
$ cd wsw-results
$ bin/docker_build.sh
```

The build script will convert the Jupyter Notebooks to regular Python scripts, build a Docker image, run all of the unit tests and run the actual reports. If all of these steps are successful then the Docker image will be tagged as the "latest" and will be available for re-use.

Note: The very first build will take a lot longer to complete because it has to build image layers for Python and Jupyter; bundling up all of the required third party libraries, etc.



### Running the Reports

The reports can be refreshed by running a shell script from within the project root:

```shell
$ cd wsw-results
$ bin/results.sh
```

To gain an insight into what occurs during the processing, reading the [diagnostics](diagnostics.md) section is highly recommended.

Note: It usually takes around 10 seconds in total to run all of the reports for 1998 to 2021.



### Publishing the Reports

Changes to the web pages can be identified using git commands from within the project root:

```shell
$ git status
$ git diff
```

The safest way to commit changes is to specifically "add" files, prior to the "commit":

```shell
$ git add docs/results
$ git status
```

After reviewing the status, changes can be committed to git:

```shell
$ git commit -m "Meaningful message about the update" docs/results
$ git status
```

Pushing the local changes to GitHub will cause the website to automatically refresh, approximately a minute or so later:

```shell
$ git push
```

The GitHub Pages deployment history can be [reviewed](https://github.com/Logiqx/wsw-results/deployments/activity_log?environment=github-pages) if there are any issues or delays.