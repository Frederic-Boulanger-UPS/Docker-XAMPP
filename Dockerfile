FROM ubuntu:24.04

# ENV xampp_vers=x64-7.4.11-0
# ENV xampp_vers=x64-7.4.27-2
ENV xampp_vers=x64-8.2.12-0

COPY xampp-linux-${xampp_vers}-installer.run .

RUN chmod 755 xampp-linux-${xampp_vers}-installer.run
RUN yes | ./xampp-linux-${xampp_vers}-installer.run
RUN rm xampp-linux-${xampp_vers}-installer.run

COPY startxampp /opt/lampp/
RUN chmod a+x /opt/lampp/startxampp

EXPOSE 80 443
ENTRYPOINT ["/opt/lampp/startxampp"]

