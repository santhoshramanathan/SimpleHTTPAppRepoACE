FROM ibmcom/ace/ace:latest

ENV BAR1=SimpleHTTPApp.bar

# Copy in the bar file to a temporary directory
COPY --chown=aceuser ./simplehttp/binary/$BAR1 /tmp

# Unzip the BAR file; need to use bash to make the profile work
RUN bash -c 'mqsibar -w /home/aceuser/ace-server -a /tmp/$BAR1 -c'

# Switch off the admin REST API for the server run if required
#DA RUN sed -i 's/adminRestApiPort/#adminRestApiPort/g' /home/aceuser/ace-server/server.conf.yaml 

# We inherit the command from the base layer

# Expose ports
EXPOSE 7800