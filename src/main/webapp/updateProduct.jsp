<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("AdminLogin.html");
        return;
    }
%>

<%@ page import="com.futurecart.model.Product" %>

<%
    Product product = (Product) request.getAttribute("product");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Product - Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
    background: #f4f6f9;
}

/* HEADER */
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
}

/* FORM WRAPPER */
.update-container {
    max-width: 560px;
    margin: 40px auto;
    background: #ffffff;
    padding: 30px;
    border-radius: 14px;
    border: 1px solid #e0e0e0;
    box-shadow: 0 10px 30px rgba(0,0,0,0.08);
}

.update-title {
    font-size: 22px;
    font-weight: 800;
    margin-bottom: 20px;
    color: #282c3f;
}

/* FORM */
.update-form {
    display: flex;
    flex-direction: column;
}

.update-form label {
    font-size: 13px;
    font-weight: 600;
    margin-top: 14px;
    margin-bottom: 6px;
    color: #282c3f;
}

.update-form input,
.update-form textarea,
.update-form select {
    padding: 10px 12px;
    font-size: 14px;
    border-radius: 8px;
    border: 1px solid #dcdcdc;
    outline: none;
}

.update-form textarea {
    resize: none;
    height: 90px;
}

.update-form input:focus,
.update-form textarea:focus,
.update-form select:focus {
    border-color: #ff3f6c;
    box-shadow: 0 0 0 2px rgba(255,63,108,0.15);
}

/* IMAGE PREVIEW */
.image-preview {
    margin-top: 12px;
    height: 160px;
    border-radius: 10px;
    border: 1px dashed #ccc;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #fafafa;
}

.image-preview img {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
}

/* BUTTONS */
.form-actions {
    display: flex;
    gap: 12px;
    margin-top: 24px;
}

.btn {
    flex: 1;
    height: 42px;
    border-radius: 999px;
    font-size: 14px;
    font-weight: 700;
    cursor: pointer;
    border: none;
}

/* SAVE */
.save-btn {
    background: #ff3f6c;
    color: white;
}

/* CANCEL */
.cancel-btn {
    background: white;
    color: #282c3f;
    border: 1px solid #ccc;
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

<!-- UPDATE FORM -->
<div class="update-container">

    <div class="update-title">Update Product</div>

    <form class="update-form" action="updateProduct" method="post">

        <!-- HIDDEN ID -->
        <input type="hidden" name="productId"
               value="<%= product.getProductId() %>">

        <label>Product Name</label>
        <input type="text" name="product_name"
               value="<%= product.getName() %>" required>

        <label>Price</label>
        <input type="number" step="0.01" name="price"
               value="<%= product.getPrice() %>" required>

        <label>Description</label>
        <textarea name="description"><%= product.getDescription() %></textarea>

        <label>Image URL</label>
        <input type="text" name="product_image"
               value="<%= product.getImageUrl() %>">

        <!-- IMAGE PREVIEW -->
        <div class="image-preview">
            <img src="<%= product.getImageUrl() %>" alt="Product Image">
        </div>

        <label>Featured Product</label>
        <select name="featuredProduct">
            <option value="YES"
                <%= "YES".equals(product.getFeaturedProduct()) ? "selected" : "" %>>
                YES
            </option>
            <option value="NO"
                <%= "NO".equals(product.getFeaturedProduct()) ? "selected" : "" %>>
                NO
            </option>
        </select>

        <!-- ACTIONS -->
        <div class="form-actions">
            <button type="submit" class="btn save-btn">
                Save Changes
            </button>

            <button type="button" class="btn cancel-btn"
                onclick="location.href='adminDashboard'">
                Cancel
            </button>
        </div>

    </form>

</div>

</body>
</html>