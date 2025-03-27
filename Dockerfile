echo 'FROM nginx:latest
COPY index.html /usr/share/nginx/html/
# If you have other assets (CSS/JS/images):
# COPY assets/ /usr/share/nginx/html/assets/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]' > Newrep/Dockerfile
