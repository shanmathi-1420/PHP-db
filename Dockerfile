# Use an official PHP 8.0 image as the base image
FROM php:8.0-apache

# Copy the application files into the appropriate directory within the Docker image
COPY . /var/www/html

# Set the default index file to index.php
RUN sed -i 's#AllowOverride None#AllowOverride All#' /etc/apache2/apache2.conf && \
    echo "DirectoryIndex index.php" >> /etc/apache2/mods-available/dir.conf

# Expose port 80 to the host machine
EXPOSE 80

# Start the Apache service when the container is run
CMD ["apache2-foreground"]
