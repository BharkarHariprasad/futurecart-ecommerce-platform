<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String adminName = (String) session.getAttribute("adminName");

    if (adminName == null) {
        response.sendRedirect("AdminLogin.html");
        return;
    }
%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.futurecart.model.Category" %>
<%@ page import="com.futurecart.model.Brand" %>

<%
    ArrayList<Category> categories =
        (ArrayList<Category>) request.getAttribute("categories");

	ArrayList<Brand> brands =
		(ArrayList<Brand>) request.getAttribute("brands");
%>

<%@ page import="com.futurecart.model.Product" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - FutureCart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
    background: #f4f6f9;
}

/* ===== HEADER ===== */
.admin-header {
    height: 64px;
    background: #ffffff;
    border-bottom: 1px solid #e0e0e0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 24px;
}

.admin-logo {
    font-size: 18px;
    font-weight: 800;
    color: #ff3f6c;
}

.admin-user {
    font-size: 14px;
    font-weight: 600;
    color: #282c3f;
}

/* ===== LAYOUT ===== */
.admin-container {
    display: flex;
    min-height: calc(100vh - 64px);
}

/* ===== SIDEBAR ===== */
.admin-sidebar {
    width: 220px;
    background: #ffffff;
    border-right: 1px solid #e0e0e0;
    padding: 20px;
}

.admin-sidebar a {
    display: block;
    padding: 10px 14px;
    margin-bottom: 8px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    color: #282c3f;
    text-decoration: none;
}

.admin-sidebar a:hover {
    background: #fff0f4;
    color: #ff3f6c;
}

.logout-form {
    margin-top: 12px;
}

.logout-btn {
    width: 100%;
    padding: 10px 14px;
    border-radius: 6px;
    border: none;
    background: transparent;
    font-size: 14px;
    font-weight: 600;
    color: #282c3f;
    text-align: left;
    cursor: pointer;
}

.logout-btn:hover {
    background: #fff0f4;
    color: #ff3f6c;
}

/* ===== MAIN ===== */
.admin-main {
    flex: 1;
    padding: 24px;
}

.admin-title {
    font-size: 22px;
    font-weight: 800;
    margin-bottom: 16px;
}

.admin-cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 20px;
}

.admin-card {
    background: #ffffff;
    padding: 20px;
    border-radius: 12px;
    border: 1px solid #e0e0e0;
}

.admin-card h3 {
    font-size: 16px;
    margin-bottom: 6px;
}

.admin-card p {
    font-size: 14px;
    color: #757575;
}

/* ===== POPUP OVERLAY ===== */
.popup-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.4);
    display: none;
    align-items: center;
    justify-content: center;
    z-index: 999;
}

/* Show popup when target */
.popup-overlay:target {
    display: flex;
}

/* ===== POPUP BOX ===== */
.popup-box {
    width: 100%;
    max-width: 420px;
    background: #ffffff;
    padding: 24px;
    border-radius: 12px;
    box-shadow: 0 14px 30px rgba(0,0,0,0.2);
}

.popup-box h3 {
    margin-bottom: 16px;
    font-size: 20px;
    font-weight: 800;
}

/* ===== FORM ===== */
.popup-box form {
    display: flex;
    flex-direction: column;
}

.popup-box label {
    font-size: 13px;
    font-weight: 600;
    margin-top: 10px;
}

.popup-box input,
.popup-box textarea {
    margin-top: 4px;
    padding: 8px 10px;
    border-radius: 6px;
    border: 1px solid #dcdcdc;
    font-size: 14px;
}

.popup-box textarea {
    resize: none;
    height: 70px;
}

.popup-box select {
    margin-top: 4px;
    padding: 8px 10px;
    border-radius: 6px;
    border: 1px solid #dcdcdc;
    font-size: 14px;
    background: #ffffff;
}

/* ===== ACTIONS ===== */
.popup-actions {
    display: flex;
    gap: 10px;
    margin-top: 16px;
}

.popup-actions button {
    flex: 1;
    padding: 10px;
    border-radius: 999px;
    border: none;
    background: #ff3f6c;
    color: white;
    font-weight: 700;
    cursor: pointer;
}

.popup-actions .close-btn {
    flex: 1;
    text-align: center;
    padding: 10px;
    border-radius: 999px;
    border: 1px solid #ccc;
    color: #282c3f;
    text-decoration: none;
}


.fc-products {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
    gap: 20px;
}

.fc-product-card {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    padding: 12px;
}

.fc-product-image {
    height: 180px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.fc-product-btn {
    padding: 6px 12px;
    border-radius: 20px;
    border: 1px solid #ff3f6c;
    background: white;
    cursor: pointer;
}

.fc-product-card {
    background: #ffffff;
    border-radius: 18px;
    padding: 16px;
    border: 1px solid #e5e5e5;

    display: flex;
    flex-direction: column;
    height: 100%;

    box-shadow: 0 2px 8px rgba(0,0,0,0.04);
}

/* FEATURED BADGE */
.fc-featured-badge {
    position: absolute;
    top: 12px;
    left: 12px;
    background: #2e7d32;
    color: white;
    font-size: 11px;
    font-weight: 700;
    padding: 4px 8px;
    border-radius: 6px;
}

/* IMAGE */
.fc-product-image {
    height: 180px;
    background: #f7f7f7;
    border-radius: 12px;
    margin-bottom: 12px;

    display: flex;
    align-items: center;
    justify-content: center;
}

.fc-product-image img {
    max-width: 90%;
    max-height: 90%;
    object-fit: contain;
}

/* PRODUCT NAME */
.fc-product-name {
    font-size: 15px;
    font-weight: 600;
    color: #212121;
    line-height: 1.4;
    margin-bottom: 8px;

    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

/* PRICE */
.fc-product-price {
    font-size: 16px;
    font-weight: 700;
    color: #000;
    margin-bottom: 14px;
}

/* BUTTON AREA */
.fc-admin-actions {
    display: flex;
    gap: 12px;
    margin-top: auto; /* 🔥 pushes buttons to bottom */
}

/* BUTTON AREA */
.fc-admin-actions {
    display: flex;
    gap: 12px;
    margin-top: auto; /* 🔥 pushes buttons to bottom */
}

/* BUTTONS */
.fc-btn {
    flex: 1;
    height: 40px;
    border-radius: 999px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
}

/* UPDATE */
.update-btn {
    background: white;
    border: 1.5px solid #ff3f6c;
    color: #ff3f6c;
}

/* DELETE */
.delete-btn {
    background: white;
    border: 1.5px solid #ff1744;
    color: #ff1744;
}

.fc-product-name {
    font-size: 14px;
    font-weight: 700;
    color: #282c3f;
}

.fc-featured {
    font-size: 11px;
    font-weight: 700;
    color: green;
}

.fc-product-price {
    font-size: 15px;
    font-weight: 700;
    color: #ff3f6c;
}

.fc-admin-actions {
    display: flex;
    gap: 10px;
    margin-top: auto;
}

.fc-btn {
    flex: 1;
    padding: 8px;
    border-radius: 20px;
    font-size: 13px;
    cursor: pointer;
    border: 1px solid #ff3f6c;
    background: white;
}

.update-btn {
    color: #ff3f6c;
}

.delete-btn {
    color: red;
    border-color: red;
}





.fc-product-card {
    position: relative;
}

.fc-featured-badge {
    position: absolute;
    top: 10px;
    left: 10px;
    background: green;
    color: white;
    font-size: 11px;
    font-weight: 700;
    padding: 4px 8px;
    border-radius: 6px;
}




</style>
</head>

<body>

<!-- HEADER -->
<div class="admin-header">
    <div class="admin-logo">FutureCart Admin</div>
    <div class="admin-user">
        Welcome, <strong><%= adminName %></strong>
    </div>
</div>

<!-- BODY -->

<!-- ADD PRODUCT POPUP -->
<div id="addProductPopup" class="popup-overlay">

    <div class="popup-box">

        <h3>Add New Product</h3>

        <form action="addProduct" method="post">

    <label>Product Name</label>
    <input type="text" name="product_name" required>

    <label>Brand</label>
<select name="brand_id" required>
    <option value="">-- Select Brand --</option>

    <%
        if (brands != null) {
            for (Brand b : brands) {
    %>
        <option value="<%= b.getBrandId() %>">
            <%= b.getBrandName() %>
        </option>
    <%
            }
        }
    %>
</select>

    <label>Category</label>
<select name="category_id" required>
    <option value="">-- Select Category --</option>

    <%
        if (categories != null) {
            for (Category c : categories) {
    %>
        <option value="<%= c.getCategoryId() %>">
            <%= c.getCategoryName() %>
        </option>
    <%
            }
        }
    %>
</select>

	<label>Featured Product</label>
<select name="featuredProduct">
    <option value="NO" selected>NO</option>
    <option value="YES">YES</option>
</select>

    <label>Price</label>
    <input type="number" step="0.01" name="price">

    <label>Description</label>
    <textarea name="description"></textarea>

    <label>Image URL</label>
    <input type="text" name="product_image">

<!--     <label>Stock</label>
    <input type="number" name="stock"> -->

    <div class="popup-actions">
        <button type="submit">Save Product</button>
        <a href="#" class="close-btn">Cancel</a>
    </div>

</form>

    </div>

</div>

<div id="addBrandPopup" class="popup-overlay">

    <div class="popup-box">
        <h3>Add Brand</h3>

        <form action="addBrand" method="post">

            <label>Brand Name</label>
            <input type="text" name="brand_name" required>

            <label>Category</label>
            <select name="category_id" required>
                <option value="">-- Select Category --</option>

                <%
                    if (categories != null) {
                        for (Category c : categories) {
                %>
                    <option value="<%= c.getCategoryId() %>">
                        <%= c.getCategoryName() %>
                    </option>
                <%
                        }
                    }
                %>
            </select>

            <div class="popup-actions">
                <button type="submit">Save Brand</button>
                <a href="#" class="close-btn">Cancel</a>
            </div>

        </form>
    </div>
</div>


<div class="admin-container">

    <!-- SIDEBAR -->
    <div class="admin-sidebar">
        <!-- <a href="#">Dashboard</a> -->
        <a href="#addProductPopup">Add Product</a>
        <!-- <a href="#">Manage Products</a> -->
        <!-- <a href="#">Orders</a>
        <a href="#">Users</a> -->

<!--     <a href="#addCategoryPopup">Add Category</a> -->
    <a href="#addBrandPopup">Add Brand</a>
    <a href="adminOrders">Orders</a>
    <a href="adminUsers">View Users</a>
    <%-- <a href="deleteProduct?productId=<%= p.getProductId() %>"
   onclick="return confirm('Are you sure you want to delete this product?')">
   Delete
</a> --%>
    
        <form action="adminLogout" method="post" class="logout-form">
    		<button type="submit" class="logout-btn">Logout</button>
		</form>
    </div>

    <!-- MAIN -->
    <div class="admin-main">
        <div class="admin-title">Dashboard Overview</div>
        
        <!-- ADD CATEGORY POPUP -->
       

<%
ArrayList<Product> products =
    (ArrayList<Product>) request.getAttribute("products");
%>

<div class="fc-products">

<% if (products != null && !products.isEmpty()) {
    for (Product p : products) {
%>

   <article class="fc-product-card">

    <% if ("YES".equals(p.getFeaturedProduct())) { %>
        <span class="fc-featured-badge">FEATURED</span>
    <% } %>

    <div class="fc-product-image">
        <img src="<%= p.getImageUrl() %>" alt="<%= p.getName() %>">
    </div>

    <div class="fc-product-name">
        <%= p.getName() %>
    </div>

    <div class="fc-product-price">
        ₹<%= p.getPrice() %>
    </div>

    <div class="fc-admin-actions">
        <button class="fc-btn update-btn"
    onclick="location.href='editProduct?productId=<%= p.getProductId() %>'">
    Update
</button>
        <button class="fc-btn delete-btn"
    onclick="if(confirm('Delete this product?'))
    location.href='adminDeleteProduct?productId=<%= p.getProductId() %>'">
    Delete
</button>
    </div>

</article>

<% } } else { %>
    <p>No products found</p>
<% } %>

</div>
        
        
<div id="addCategoryPopup" class="popup-overlay">

    <div class="popup-box">
        <h3>Add Category</h3>

        <form action="addCategory" method="post">

            <label>Category Name</label>
            <input type="text" name="category_name" placeholder="Enter category name" required>

            <div class="popup-actions">
                <button type="submit">Save Category</button>
                <a href="#" class="close-btn">Cancel</a>
            </div>

        </form>
    </div>
</div>

        <!-- <div class="admin-cards">
            <div class="admin-card">
                <h3>Total Products</h3>
                <p>Manage all products</p>
            </div>

            <div class="admin-card">
                <h3>Total Orders</h3>
                <p>Track customer orders</p>
            </div>

            <div class="admin-card">
                <h3>Total Users</h3>
                <p>Registered customers</p>
            </div>
        </div> -->
        
        
        <%-- <form action="updateProduct" method="post">

    <input type="hidden" name="productId"
           value="<%= product.getProductId() %>">

    <label>Product Name</label>
    <input type="text" name="product_name"
           value="<%= product.getName() %>">

    <label>Price</label>
    <input type="number" name="price"
           value="<%= product.getPrice() %>">

    <label>Description</label>
    <textarea name="description"><%= product.getDescription() %></textarea>

    <label>Featured</label>
    <select name="featuredProduct">
        <option value="YES" <%= "YES".equals(product.getFeaturedProduct()) ? "selected" : "" %>>YES</option>
        <option value="NO"  <%= "NO".equals(product.getFeaturedProduct()) ? "selected" : "" %>>NO</option>
    </select>

    <button type="submit">Update Product</button>
</form> --%>


    </div>

</div>

</body>
</html>