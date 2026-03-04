# 🛒 FutureCart – Full Stack E-Commerce Web Application

FutureCart is a full-stack e-commerce web application developed using **Java Servlets, JSP, JDBC, and MySQL**.  
The system allows users to browse products, manage shopping carts, and place orders through a session-based authentication system.

The application follows a **layered architecture** separating request handling, business logic, data access, and persistence layers for maintainable and scalable backend development.

---

# 🚀 Tech Stack

Java | Servlet | JSP | JDBC | MySQL | HTML | CSS | Apache Tomcat | Maven | Git | Eclipse

---

# 🏗 Architecture

The application follows a multi-layer architecture.

```
Client (Browser)
       ↓
Servlet Layer
       ↓
Business Layer
       ↓
Data Access Layer
       ↓
Persistence Layer (JDBC)
       ↓
MySQL Database
```

---

# ✨ Features

## User Features

- User Registration
- Login Authentication
- Session Management using HttpSession
- Product Listing
- Category Filtering
- Product Details Page
- Add to Cart
- Remove from Cart
- Address Management
- Saved Card System
- Order Placement
- Mock Payment Simulation
- Order History

---

## Admin Features

- Admin Login
- Add Products
- Edit Products
- Delete Products
- View Users
- Manage Orders
- Update Order Status

---

# 🗄 Database Design

Main entities used in the system:

- User
- Product
- Category
- Cart
- Order
- Address
- SavedCard
- Brand

The database is designed with **proper relational integrity and normalized schema**.

---

# 📂 Project Structure

```
src/main/java/com/futurecart

├── servlet        → Handles HTTP requests and responses
├── business       → Business logic layer
├── data_access    → Data service layer
├── persistence    → JDBC database operations
└── model          → Entity classes
```

```
src/main/webapp

├── JSP pages
├── HTML pages
├── Images
└── UI components
```

---

# 🖥 Application Screenshots

## Login Page

![Login Page](screenshots/login.png)

---

## Home Page

![Home Page](screenshots/home.png)

---

## Product Listing

![Product Listing](screenshots/product-list.png)

---

## Product Details

![Product Details](screenshots/product-details.png)

---

## Cart Page

![Cart Page](screenshots/cart.png)

---

## Admin Dashboard

![Admin Dashboard](screenshots/admin-dashboard.png)

---

# ⚙️ How to Run the Project

### 1️⃣ Clone Repository

```
git clone https://github.com/BharkarHariprasad/futurecart-ecommerce-platform.git
```

---

### 2️⃣ Import Project

Open **Eclipse IDE**

```
File → Import → Existing Project
```

Select the project folder.

---

### 3️⃣ Configure Server

Add **Apache Tomcat Server** inside Eclipse.

```
Servers → Add → Apache Tomcat
```

---

### 4️⃣ Create Database

Create a database in MySQL:

```
CREATE DATABASE futurecart;
```

---

### 5️⃣ Configure Database Connection

Update database credentials in the project:

```
DB URL
Username
Password
```

---

### 6️⃣ Run Application

Deploy project on **Apache Tomcat** and start server.

Open in browser:

```
http://localhost:8080/FutureCart
```

---

# 📌 Key Learning Outcomes

- Servlet based web application development
- HTTP request-response lifecycle
- Session management using HttpSession
- JDBC database integration
- Layered architecture design
- Full stack Java web development without frameworks

---

# 👨‍💻 Author

Hariprasad Bharkar

Java Full Stack Developer
