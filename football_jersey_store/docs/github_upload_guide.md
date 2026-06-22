# 🐙 GitHub Upload Guide

## STEP 1: สร้าง Repository
1. ไปที่ https://github.com/new
2. Repository name: **`football-jersey-store-itcs424`**
3. Description: `ITCS424 Mobile Application Development - Football Jersey Store (Flutter)`
4. เลือก **Public**
5. ⛔ **อย่าติ๊ก** "Add a README" (เราจะ push เอง)
6. คลิก **Create repository**

## STEP 2: Push โค้ดขึ้น GitHub
เปิด Terminal ใน VS Code (Ctrl+` หรือ Cmd+`):

```bash
cd Documents/FlutterProjects/football_jersey_store

git init
git add .
git commit -m "Initial commit - ITCS424 Football Jersey Store"

git remote add origin https://github.com/YOUR_USERNAME/football-jersey-store-itcs424.git
git branch -M main
git push -u origin main
```

> ✏️ แทน `YOUR_USERNAME` ด้วย username ของคุณ
> ครั้งแรก Git จะถามให้ login GitHub — กรอกตามที่ขึ้น

## STEP 3: Add อาจารย์เป็น Collaborator
1. ไปที่หน้า repo บน github.com
2. คลิก **Settings** (มุมขวาบนของ repo)
3. ในเมนูซ้าย คลิก **Collaborators**
4. ป้อน password ยืนยันตัวตน
5. คลิก **Add people**
6. พิมพ์: **`siripenp`**
7. คลิก **Add siripenp to this repository**

## STEP 4: ตรวจสอบ
- เปิด repo บน browser → เห็น README ขึ้น preview สวย
- เห็นไฟล์ครบ: `lib/`, `docs/`, `pubspec.yaml`, `.gitignore`
- เห็น diagram ในส่วน "Class Diagram" ของ README

## ⚠️ ถ้า push ไม่ได้
- ถ้า error "remote contains work that you do not have" → `git pull --rebase origin main`
- ถ้า authentication ล้มเหลว → ใช้ **Personal Access Token** แทน password
  → GitHub → Settings → Developer settings → Personal access tokens → Generate new token (classic)
