FROM ubuntu:20.04

# Update and install required packages
RUN apt-get update \
    && apt-get install -y netcat fortune \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy application script
COPY wisecow.sh /usr/local/bin/wisecow.sh
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose port
EXPOSE 4499

# Command to run the application
CMD ["/usr/local/bin/wisecow.sh"]
