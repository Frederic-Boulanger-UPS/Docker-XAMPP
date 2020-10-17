FROM ubuntu:20.04

COPY xampp-linux-x64-7.4.11-0-installer.run .

RUN chmod 755 xampp-linux-x64-7.4.11-0-installer.run
RUN yes | ./xampp-linux-x64-7.4.11-0-installer.run
RUN rm xampp-linux-x64-7.4.11-0-installer.run

COPY startxampp /opt/lampp/
RUN chmod a+x /opt/lampp/startxampp

EXPOSE 80 443
ENTRYPOINT ["/opt/lampp/startxampp"]

