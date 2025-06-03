# 🏠 Digital Hostel Management Platform

This is a mobile-first digital solution to streamline hostel-related operations such as student registration, attendance, complaint tracking, food scheduling, and fee management. It offers a centralized platform for both students and administrators to interact seamlessly and manage hostel life efficiently.

---

## 🚀 Features

### 👨‍🎓 Student View

* **📋 Registration:**

  * Upload Photo
  * Phone Number Verification (via OTP)

* **📊 Dashboard:**

  * Attendance tracking
  * Pending payments (hostel, water, electricity)
  * Complaints (Add/view with image upload & optional personal info)

* **📆 Attendance:**

  * Toggle In/Out to mark hostel presence
  * View attendance history by date

* **🍽️ Food Scheduling:**

  * Pre-schedule food availability
  * Overview of student meal preferences by date

---

### 🛠️ Admin Dashboard

* **👥 Student Management:**

  * Add/Update student details
  * Move students between rooms
  * Remove students

* **🧾 Fee Management:**

  * View and approve fee payments
  * Bill photo uploads
  * Split utility charges among roommates

* **🗳️ Complaint Management:**

  * View list of complaints (sorted by urgency)
  * Mark as resolved or delete

* **📈 Attendance Overview:**

  * View individual student attendance records

---

## 🧰 Tools & Technologies

| Component          | Technology                       |
| ------------------ | -------------------------------- |
| **Planning**       | Google Docs                      |
| **Design**         | Figma                            |
| **Frontend**       | Flutter (Mobile)                 |
| **Backend**        | Express.js (Node.js)             |
| **Database**       | MongoDB Atlas                    |
| **Authentication** | OTP-based login                  |
| **Hosting**        | Vercel                           |
| **File Storage**   | Cloud storage (for bills/images) |

---

## 🔐 Authentication

* OTP-based login flow ensures security and ease of access.
* No passwords required — quick and verified access via phone number.

---

## 📦 Project Structure (Coming Soon)

```bash
.
├── frontend/         # Flutter mobile app
├── backend/          # Node.js Express API
├── docs/             # Planning & architecture
└── README.md
```

---

## 🛣️ Roadmap

* ⏳ Food scheduling
* ⏳ Monthly attendance analysis
* ⏳ OTP-based login & registration
* ⏳ Basic admin dashboard
* ⏳ Attendance toggle and overview
* ⏳ Complaint submission with image
* ⏳ Fee management with photo upload
* ⏳ Admin room allocation flow
* ⏳ UI polish & mobile responsiveness

---

## 👥 Target Users

* **Students:** Register, mark attendance, submit complaints, view and pay fees.
* **Administrators:** Manage students, monitor attendance, resolve complaints, and process payments.

---

## 🤝 Contribution

Pull requests are welcome. For major changes, please open an issue first to discuss what you'd like to change.

---
