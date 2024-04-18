FROM ubuntu:latest

# Install Supervisord
RUN apt-get update && apt-get install -y supervisor

# Copy the Supervisord configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Set environment variables
ENV SUPERVISOR_USERNAME=user
ENV SUPERVISOR_PASSWORD=pass

# Copy scripts
COPY script1.sh /usr/local/bin/
COPY script2.sh /usr/local/bin/

# Expose the Supervisord web interface port
EXPOSE 9001

# Run Supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
