FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y zip unzip wget

# Set the working directory
WORKDIR /var/www/html

# Download and extract the template
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip
RUN unzip oxer.zip
RUN mv -rvf oxer-html/* .
RUN rm -rf oxer.zip

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
