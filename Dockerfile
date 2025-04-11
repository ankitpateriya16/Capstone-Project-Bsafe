FROM ubuntu

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
RUN apt-get install maven -y
RUN mvn --version

# Install NGINX
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Copy NGINX config (optional)
COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/html
COPY index.html /var/www/html/index.html

# Set working directory
WORKDIR /app

# Expose ports
EXPOSE 8080 80

# Start both Java app and NGINX
CMD bash -c "nginx -g 'daemon off;'"
