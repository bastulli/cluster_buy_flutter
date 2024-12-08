FROM node:18-alpine
WORKDIR /app
COPY build/web ./build/web
RUN npm install -g serve
CMD serve -s build/web -p $PORT