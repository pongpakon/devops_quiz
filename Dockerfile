# เลือก Node.js เป็น base image
FROM node:16
 
# ตั้ง working directory เป็น /usr/src/app
WORKDIR /usr/src/app
 
# คัดลอกไฟล์ package.json และ package-lock.json
COPY package*.json ./
 
# ติดตั้ง dependencies
RUN npm install
 
# คัดลอกไฟล์แอปทั้งหมด
COPY . .
 
# เปิด port 3000
EXPOSE 3000
 
# รันแอป
CMD ["node", "app.js"]