# Use an official lightweight image as a parent image
FROM alpine:latest

# Install necessary packages
RUN apk --no-cache add bash ncurses cowsay fortune-mod netcat-openbsd

# Set environment variables
ENV SRVPORT=4499
ENV RSPFILE=response

# Copy the application script to the image
COPY wisecow.sh /wisecow.sh

# Make the script executable
RUN chmod +x /wisecow.sh

# Run the script
CMD ["/wisecow.sh"]
