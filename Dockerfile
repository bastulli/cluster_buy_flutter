FROM node:18-alpine
WORKDIR /app

# Copy the entire web build directory
COPY build/web/ ./build/web/

# Install serve
RUN npm install -g serve

# Specify the port explicitly if needed (optional)
ENV PORT=8080

# Start the server
CMD ["serve", "-s", "build/web", "-p", "$PORT"]