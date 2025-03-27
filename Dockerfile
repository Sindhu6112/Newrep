# Use official Nginx image
FROM nginx:latest

# Copy index.html or app files (if applicable)
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
