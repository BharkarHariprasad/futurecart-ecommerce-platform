# 🛒 FutureCart – Servlet-Based E-Commerce Web Application

FutureCart is a full-stack e-commerce web application developed using **Java Servlets, JSP, JDBC, and MySQL**.

The system enables users to browse products, manage shopping carts, and place orders through a session-based authentication system.

The backend follows a **layered architecture**, separating request handling, business logic, data access, and persistence layers to maintain clean separation of concerns and improve maintainability.

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

## ⚙️ Backend Considerations

- Implemented session-based authentication using **HttpSession** to maintain user state across requests.

- Designed database queries to efficiently retrieve product listings and related entities.

- Structured the application using a **DAO-style data access layer** to abstract database operations from business logic.

- Implemented input validation for user registration, login, and order processing workflows.

- Designed the system to support scalable product listings that can be extended with pagination in future improvements.

---

## 🖥 Application Screenshots

### Login Page
![Login Page](screenshots/login.png)

### Home Page
![Home Page](screenshots/home.png)

### Product Listing
![Product Listing](screenshots/product-list.png)

### Product Details
![Product Details](screenshots/product-details.png)

### Cart Page
![Cart Page](screenshots/cart.png)

### Admin Dashboard
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

## 📌 Key Engineering Outcomes

- Designed a layered backend architecture separating request handling, business logic, data access, and persistence layers.

- Implemented session-based authentication and user state management using HttpSession.

- Developed a relational database schema supporting product catalog, cart management, order processing, and user accounts.

- Built modular data access components using JDBC to handle database communication and CRUD operations.

- Implemented the complete HTTP request–response lifecycle using Java Servlets for server-side processing.

- Structured the application using reusable JSP components to separate presentation from backend logic.

- Developed an admin module to manage products, users, and order status within the system.

---

# 👨‍💻 Author

Hariprasad Bharkar

Java Backend Developer
