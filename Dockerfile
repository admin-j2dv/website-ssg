# Phase 1: เลือก Base Image ที่เหมาะสม
# เราเลือก node:20-alpine เพราะเป็นเวอร์ชัน LTS ที่ทันสมัยและมีขนาดเล็กมาก (alpine)
FROM node:20-alpine

# Phase 2: กำหนด Working Directory ภายใน Container
# คำสั่งทั้งหมดหลังจากนี้จะทำงานใน path /app
WORKDIR /app

# Phase 3: Copy เฉพาะไฟล์ที่จำเป็นต่อการติดตั้ง Dependencies
# Docker จะ cache layer นี้ไว้ ถ้าไฟล์ package*.json ไม่เปลี่ยนแปลง การ npm install จะไม่เกิดขึ้นใหม่ ทำให้ build เร็วขึ้น
COPY package*.json ./

# Phase 4: รัน npm install เพื่อติดตั้ง Dependencies ทั้งหมด
RUN npm install

# Phase 5: Copy โค้ดส่วนที่เหลือทั้งหมดเข้ามาใน Image
COPY . .

# Phase 6: Expose Port 3000 เพื่อให้สามารถเข้าถึงจากภายนอก Container ได้
EXPOSE 3000

# Phase 7: กำหนดคำสั่งเริ่มต้นเมื่อ Container ถูกรัน
# ในโหมด Development เราจะใช้คำสั่ง npm run dev
CMD [ "npm", "run", "dev" ]