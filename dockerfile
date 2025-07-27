FROM node:20-alpine

# Install dumb-init for proper signal handling
RUN apk add --no-cache dumb-init

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production && npm cache clean --force
COPY . .

EXPOSE 5678

ENTRYPOINT ["dumb-init", "--"]

CMD ["npm", "start"]
