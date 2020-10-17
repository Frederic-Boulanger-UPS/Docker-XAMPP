docker-xampp
===================

Docker image to run [XAMPP](https://www.apachefriends.org/).

Available on [Docker hub](https://hub.docker.com/r/fredblgr/ubuntu-xampp)

The source files are available on [GitHub](https://github.com/Frederic-Boulanger-UPS/docker-xampp)

The XAMPP installer for Linux (xampp-linux-x64-7.4.11-0-installer.run) is not included in this repository, you should download it from <https://www.apachefriends.org/download.html> if you want to build the image.


Typical usage is:

```
docker run --rm -d -p 80:80 -o 443:443 -v $PWD:/opt/lampp/htdocs:rw --name ubuntu-xampp fredblgr/ubuntu-xampp:2020
```

Very Quick Start
----------------
Run ```xampp start <directory>``` to start the container and have XAMPP serve the contents of <directory> as its htdocs directory.

Run ```xampp stop``` to stop the container and XAMPP.

Quick Start
-------------------------
Run the docker container and open your browser on localhost.

```
docker run -p 80:80 -p 443:443 fredblgr/ubuntu-xampp:2020
```

Browse http://localhost/


License
==================

Apache License Version 2.0, January 2004 http://www.apache.org/licenses/LICENSE-2.0

[Frédéric Boulanger](https://github.com/Frederic-Boulanger-UPS)
