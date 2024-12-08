FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy the build output of your Flutter web app into the container
COPY build/web /app/build/web

# Install serve
RUN npm install -g serve

# Expose the default port
EXPOSE 8080

# Start the server, ensuring the PORT variable is substituted by the shell
ENTRYPOINT ["sh", "-c", "serve -s build/web -l tcp://0.0.0.0:${PORT:-8080}"]
