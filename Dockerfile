# Use OpenJDK 11 as the base image
FROM openjdk:11-jdk

# Set environment variables
ENV NIFI_VERSION=1.27.0
ENV NIFI_HOME=/opt/nifi

# Install Vim and required dependencies
RUN apt-get update && \
    apt-get install -y vim unzip && \
    apt-get clean

# Copy the NiFi installation file from the host to the container
COPY nifi-${NIFI_VERSION}-bin.zip /tmp/nifi-${NIFI_VERSION}-bin.zip

# Install NiFi
RUN unzip /tmp/nifi-${NIFI_VERSION}-bin.zip && \
    mv nifi-${NIFI_VERSION} $NIFI_HOME && \
    rm /tmp/nifi-${NIFI_VERSION}-bin.zip

# Set the HTTP host to 0.0.0.0 for external access
RUN sed -i 's/nifi.web.http.host=127.0.0.1/nifi.web.http.host=0.0.0.0/' $NIFI_HOME/conf/nifi.properties
RUN sed -i 's/nifi.web.https.host=127.0.0.1/nifi.web.https.host=0.0.0.0/' $NIFI_HOME/conf/nifi.properties
# Set single-user credentials for NiFi

#RUN $NIFI_HOME/bin/nifi.sh set-single-user-credentials admin Tpb@123456789
# RUN $NIFI_HOME/bin/nifi.sh set-single-user-credentials buuhq Tpb@123456789
# RUN $NIFI_HOME/bin/nifi.sh set-single-user-credentials trinhtt7 Tpb@123456789

# Expose NiFi ports
EXPOSE 8080 8443

CMD ["/opt/nifi/bin/nifi.sh", "run"]
