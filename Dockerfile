# Stage 1: Builder - เวทีสำหรับ Build โดยเฉพาะ
FROM node:20-alpine AS builder
WORKDIR /app

# Copy package.json และ lock file
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy โค้ดที่เหลือทั้งหมด
COPY . .

# Build โปรเจกต์ (ขั้นตอนนี้จะใช้ RAM เยอะ)
RUN npm run build

# Stage 2: Runner - เวทีสำหรับใช้งานจริง (เล็กและเบา)
FROM node:20-alpine AS runner
WORKDIR /app

# ตั้งค่า Environment เป็น Production
ENV NODE_ENV=production

# Copy ผลลัพธ์ที่จำเป็นจาก Stage 'builder'
# standalone output จะรวมทุกอย่างที่จำเป็นไว้ให้แล้ว
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static

EXPOSE 3000

# คำสั่งสำหรับรันเซิร์ฟเวอร์
CMD ["node", "server.js"]