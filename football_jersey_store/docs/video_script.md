# 🎥 Video Demo Script — Football Jersey Store
**ความยาว: 3–5 นาที | Platform: YouTube (Unlisted)**

---

## 🎬 อุปกรณ์ที่ต้องเตรียม
- เปิด Chrome รันแอปไว้แล้ว (`flutter run -d chrome`)
- เปิด VS Code ไว้พร้อม
- เปิด `docs/model_diagram.png` ไว้ใน tab แยก
- เปิดเว็บ GitHub repo ของตัวเองไว้

## 🎙️ เครื่องมือถ่าย
- **Loom** (ง่ายสุด) — https://www.loom.com/
- **OBS Studio** (ฟรี, control เองได้)
- **QuickTime** (Mac) / **Game Bar Win+G** (Windows)

---

## 📜 SCRIPT (พูดตามเลย)

### [0:00 – 0:25] 🎯 Intro
> "สวัสดีครับ/ค่ะ อาจารย์ Siripen ผมชื่อ Kunach Samutvanit รหัส 6488188
> วันนี้จะมา demo project Football Jersey Store สำหรับวิชา ITCS424 Mobile Application Development ครับ
> โปรเจกต์นี้พัฒนาด้วย Flutter framework รันได้ทั้ง web, iOS และ Android"

### [0:25 – 0:55] 🏗️ แสดง Class Diagram
> "เริ่มจากภาพรวมโครงสร้างโปรแกรม"
> [เปิดภาพ model_diagram.png]
> "มี 4 class หลัก:
> 1. **Product** — model เก็บข้อมูลเสื้อ มี 13 attributes
> 2. **ProductCard** — StatefulWidget แสดงเป็นการ์ด มีปุ่มกดถูกใจ
> 3. **ProductListScreen** — StatelessWidget แสดง grid รายการเสื้อ
> 4. **FootballJerseyApp** — root widget ของแอป"

### [0:55 – 1:15] 📁 แสดง Project Structure ใน VS Code
> [เปิด VS Code, คลิก folder lib]
> "ในโฟลเดอร์ lib แยกเป็น 3 sub-folders ตาม layer:
> models, widgets, screens — ทำให้โค้ดอ่านง่ายและ maintain ได้ดี"

### [1:15 – 1:45] 💻 อ่านโค้ด Product Model
> [เปิด lib/models/product.dart]
> "Product class เป็น data class — มี constructor ที่ใช้ named parameters พร้อม required keyword
> field `isFavorite` ไม่ final เพราะต้องเปลี่ยนค่าได้
> และมี method `toggleFavorite()` สำหรับสลับสถานะ"

### [1:45 – 2:15] 🃏 อ่านโค้ด ProductCard
> [เปิด lib/widgets/product_card.dart]
> "ProductCard เป็น StatefulWidget เพราะ heart icon ต้อง re-render เมื่อกด
> ใช้ Stack ซ้อน image กับ AUTHENTIC badge และ overlay 'สินค้าหมด'
> เมื่อกดหัวใจจะเรียก `setState` เพื่อ refresh UI"

### [2:15 – 3:30] 📱 LIVE DEMO บน Chrome
> [สลับไปหน้า Chrome ที่รัน app]
> "นี่คือหน้าจอแอปจริง — แสดง 6 ทีม:"
> - "Manchester United, Real Madrid, Barcelona, Liverpool, Bayern Munich, PSG"
>
> [กดหัวใจที่ 3 ตัว]
> "พอกดหัวใจ ไอคอนเปลี่ยนจากโครงเป็นแดงทึบ — นี่คือ stateful behavior"
>
> [scroll ลงไปที่ PSG ที่ stockQuantity = 0]
> "เสื้อ PSG สต็อกหมด เห็น overlay สีดำคำว่า 'สินค้าหมด' ทับอยู่"
>
> [กด FloatingActionButton 'รายการโปรด']
> "กดปุ่มรายการโปรดด้านล่าง จะ pop dialog บอกจำนวนที่เลือกไว้ — ตอนนี้เลือก 3 ตัว"
>
> [ปิด dialog]

### [3:30 – 4:00] 🛠️ Tech & Concepts
> "concept ที่ใช้ในโปรเจกต์:
> - StatelessWidget vs StatefulWidget
> - GridView.builder สำหรับ list ขนาดใหญ่
> - Network Image พร้อม errorBuilder
> - Conditional rendering ด้วย if statement ใน widget tree
> - showDialog navigation"

### [4:00 – 4:30] 🔚 Outro
> "GitHub repo อยู่ในลิงก์ใต้วิดีโอ
> ผมได้ add username `siripenp` เป็น collaborator แล้ว
> ขอบคุณอาจารย์ที่ให้โอกาสครับ — รอสอบ oral exam ครับ"

---

## ✅ Checklist ก่อนถ่าย
- [ ] รัน `flutter run -d chrome` ให้แอปขึ้นเรียบร้อย
- [ ] ปิด notification ทุกตัว (Slack, Line, etc.)
- [ ] ตั้ง Chrome zoom = 100%
- [ ] ทดสอบไมค์ (เสียงดัง ชัดเจน)
- [ ] เตรียม diagram + GitHub + VS Code ใน tab แยก
- [ ] ซ้อมพูดสคริปต์ 1 รอบก่อนถ่ายจริง

## 📤 Upload ขึ้น YouTube (Unlisted)
1. ไปที่ https://studio.youtube.com/
2. กดปุ่ม **Create → Upload Video**
3. เลือกไฟล์ video
4. กรอก Title: `ITCS424 Football Jersey Store - Kunach 6488188`
5. Description: ใส่ลิงก์ GitHub
6. Visibility: เลือก **Unlisted** (สำคัญมาก — ห้าม Public)
7. กด Publish → Copy ลิงก์
