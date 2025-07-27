FROM n8nio/n8n:1.103.1

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY . .

EXPOSE 5678

CMD ["npm", "start"]
