# Hostel Management System API Documentation

## Table of Contents
1. [Database Models](#database-models)
   - [User](#user-model)
   - [Meal](#meal-model)
   - [Complaint](#complaint-model) - Placeholder
   - [Payment](#payment-model) - Placeholder
2. [API Routes](#api-routes)
   - [Authentication](#authentication-routes)
   - [Meal Management](#meal-management-routes)
   - [Complaint Management](#complaint-management-routes) - Placeholder
   - [Payment Management](#payment-management-routes) - Placeholder
   - [Admin Management](#admin-management-routes) - Placeholder

---

## How to test?

Use yaak - The API client for modern developers

![Yaak Interface](../docs/yaak-interface.png)

### Steps to setup Yaak

Visit [Yaak Docs](https://feedback.yaak.app/help/collections/8721561-getting-started)

Workspace data is available in `api-client/` folder

<details>
    <summary>Database Structure</summary>


## Database Models

### User Model
**File:** `models/User.ts`
**Description:** Stores user information including authentication details and student-specific data.

#### Fields:
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `username` | String | Yes | Unique identifier for login |
| `password` | String | Yes | Hashed password |
| `role` | String | Yes | Either 'student' or 'admin' |
| `studentDetails` | Object | No | Student-specific information (nested) |

#### StudentDetails Sub-fields:
| Field | Type | Description |
|-------|------|-------------|
| `name` | String | Full name of student |
| `phone` | String | Contact number |
| `parentPhone` | String | Parent/guardian contact |
| `address` | String | Residential address |
| `branch` | String | Academic department |
| `hostel` | String | Hostel name/block |
| `roomNo` | String | Room number |
| `photo` | String | Path to profile photo |

---

### Meal Model
**File:** `models/Meal.ts`
**Description:** Tracks daily meal plans and student participation.

#### Fields:
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `date` | Date | Yes | Date of meal plan |
| `breakfast` | String | No | Breakfast menu item |
| `lunch` | String | No | Lunch menu item |
| `teaSnacks` | String | No | Tea/Snacks menu item |
| `dinner` | String | No | Dinner menu item |
| `status` | Object | Yes | Participation status (nested) |
| `student` | ObjectId | Yes | Reference to User |

#### Status Sub-fields:
| Field | Type | Default | Description |
|-------|------|---------|-------------|
| `breakfast` | Boolean | false | Whether student attended breakfast |
| `lunch` | Boolean | false | Whether student attended lunch |
| `teaSnacks` | Boolean | false | Whether student attended tea/snacks |
| `dinner` | Boolean | false | Whether student attended dinner |

---

</details>

## API Routes

### Authentication Routes
**Base Path:** `/api/auth`

| Endpoint | Method | Description | Request | Response |
|----------|--------|-------------|---------|----------|
| `/register` | POST | Register new user | `{ username, password, role, studentDetails? }` | Success message or error |
| `/login` | POST | Authenticate user | `{ username, password }` | `{ token, role }` or error |
| `/profile` | GET | Get user data | None | `{name, }` or error |

---

### Meal Management Routes
**Base Path:** `/api/meals`
**Authentication Required:** Yes

| Endpoint | Method | Description | Parameters | Response |
|----------|--------|-------------|------------|----------|
| `/today` | GET | Get today's meal plan | None | Meal object or 404 |
| `/status` | PATCH | Update meal participation | `{ mealType, status }` | Updated meal object |
| `/stats` | GET | Monthly meal statistics | None | `{ breakfast, lunch, teaSnacks, dinner }` stats |

---

### Admin Management Routes
**Base Path:** `/api/admin`
**Authentication Required:** Yes (Admin only)

| Endpoint | Method | Description | Parameters | Response |
|----------|--------|-------------|------------|----------|
| `/students` | GET | List all students | None | Array of users |
| `/students/:id` | PUT | Update student details | StudentDetails object | Updated user |

---

## Sample Requests

### 1. User Registration
```http
POST /api/auth/register
Content-Type: application/json

{
  "username": "student123",
  "password": "securepassword",
  "role": "student",
  "studentDetails": {
    "name": "Alice Johnson",
    "phone": "9876543210",
    "parentPhone": "0123456789",
    "address": "Hostel B, Room 205",
    "branch": "Electrical Engineering",
    "hostel": "B",
    "roomNo": "205"
  }
}
```

### 2. Update Meal Status
```http
PATCH /api/meals/status
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: application/json

{
  "mealType": "dinner",
  "status": true
}
```

### 3. Submit Complaint (with image)
```http
POST /api/complaints
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: multipart/form-data

[
  ["title", "Broken Window"],
  ["description", "Window in room 205 is broken and needs repair"],
  ["image", <FILE_DATA>]
]
```

This documentation provides a comprehensive reference for developers implementing or consuming the Hostel Management System API. The structure follows RESTful conventions with clear authentication requirements and response expectations for each endpoint.
