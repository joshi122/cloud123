# Use official lightweight Nginx image
FROM nginx:alpine

# Set working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy all HTML and other static files to the container
COPY . /usr/share/nginx/html

# Set permissions (optional, useful for Linux-based images)
RUN chmod -R 755 /usr/share/nginx/html

# Expose port 80 (default for Nginx)
EXPOSE 80

# Show a message when the container starts (optional)
CMD ["sh", "-c", "echo 'Starting Nginx server for my project...' && nginx -g 'daemon off;'"]

