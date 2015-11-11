FROM phxdevops/phxjug-ctr-base-play:2.4.3

# Microservice-specific settings
# ------------------------------
ENV MICROSERVICE_NAME demo
ENV PORT 9001
# ------------------------------

# Copy all our microservice's source code into the container
COPY . /tmp/
WORKDIR /tmp

# Build the Play Framework binary
RUN ./activator dist &&\
    cd /tmp/target/universal &&\
    unzip /tmp/target/universal/${MICROSERVICE_NAME}-1.0-SNAPSHOT.zip &&\
    rm /tmp/target/universal/${MICROSERVICE_NAME}-1.0-SNAPSHOT.zip &&\
    mv /tmp/target/universal /app &&\

    # Clean up all our files
    rm -Rf /tmp/* &&\
    rm -Rf /root/.ivy2 &&\
    rm -Rf /app/tmp

# Expose the port from this container
EXPOSE ${PORT}

# The container's job in life is to run this command
CMD /app/${MICROSERVICE_NAME}-1.0-SNAPSHOT/bin/${MICROSERVICE_NAME} -Dhttp.port=${PORT}
