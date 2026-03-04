<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.futurecart.model.Product" %>
<%@ page import="com.futurecart.model.Brand" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<%
    ArrayList<Product> mobiles = (ArrayList<Product>) request.getAttribute("mobiles");
%>

<%
    Integer categoryId = (Integer) request.getAttribute("categoryId");
%>

<%
    String categoryName = (String) request.getAttribute("categoryName");
    if (categoryName == null) categoryName = "Products";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FutureCart - Products</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
/* ===== BASE ===== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
    background: #f5f5f5;
    color: #282c3f;
}

a {
    text-decoration: none;
    color: inherit;
}

/* ===== PAGE WRAPPER ===== */
.fc-container {
    max-width: 1300px;
    margin: 24px auto 40px;
    padding: 0 16px;
}

/* ===== PAGE HEADER ===== */
.fc-page-head {
    margin-bottom: 20px;
}

.fc-page-title {
    font-size: 24px;
    font-weight: 800;
    margin-bottom: 4px;
}

.fc-page-sub {
    font-size: 14px;
    color: #757575;
}

/* ===== FILTER BAR ===== */
.fc-filter-bar {
    background: #ffffff;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    padding: 14px 16px;
    margin-bottom: 22px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 10px;
}

.fc-filter-left {
    display: flex;
    gap: 12px;
    flex-wrap: wrap;
}

.fc-filter-item {
    font-size: 13px;
    font-weight: 600;
    padding: 6px 12px;
    border: 1px solid #e0e0e0;
    border-radius: 999px;
    cursor: pointer;
    background: #fff;
}

.fc-filter-item:hover {
    border-color: #ff3f6c;
    color: #ff3f6c;
}

.fc-sort {
    font-size: 13px;
    padding: 6px 10px;
    border-radius: 6px;
    border: 1px solid #e0e0e0;
}

/* ===== PRODUCT GRID ===== */
.fc-products {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
    gap: 20px;
}

/* ===== PRODUCT CARD ===== */
.fc-product-card {
    background: #ffffff;
    border-radius: 12px;
    border: 1px solid #e0e0e0;
    box-shadow: 0 8px 18px rgba(0,0,0,0.05);
    padding: 14px;
    display: flex;
    flex-direction: column;
    height: 100%;              /* ✅ IMPORTANT */
}

.fc-product-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 14px 26px rgba(0,0,0,0.1);
}

/* Image area */
.fc-product-img {
    height: 200px;
    background: #f9f9f9;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 10px;
}

/* Info */
.fc-product-name {
    font-size: 14px;
    font-weight: 700;
    line-height: 1.3;
    margin-bottom: 6px;

    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.fc-product-desc {
    font-size: 13px;
    color: #757575;
    margin-bottom: 6px;

    display: -webkit-box;
    -webkit-line-clamp: 3;     /* ✅ SAME HEIGHT FOR ALL */
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.fc-product-price {
    font-size: 18px;
    font-weight: 800;
    margin-top: auto;
    color: #212121;
    margin-bottom: 10px;
}

.fc-product-price span {
    font-size: 12px;
    color: #9e9e9e;
    text-decoration: line-through;
    margin-left: 6px;
}

/* /* Button */
/* .fc-product-btn {
    margin-top: auto;
    width: 100%;
    padding: 10px;
    border-radius: 999px;
    border: 1px solid #ff3f6c;
    background: #ffffff;
    color: #ff3f6c;
    font-size: 13px;
    font-weight: 700;
    cursor: pointer;
}

.fc-product-btn:hover {
    background: #fff0f4;
} */

/* ===== PRODUCT ACTIONS ===== */
.fc-product-actions {
    display: flex;
    gap: 10px;
    margin-top: auto;
}

/* COMMON BUTTON STYLE */
.fc-product-actions button {
    flex: 1;
    height: 42px;                 /* ✅ SAME HEIGHT */
    border-radius: 999px;
    font-size: 13px;
    font-weight: 700;
    cursor: pointer;
    display: flex;
    align-items: center;          /* ✅ VERTICAL CENTER */
    justify-content: center;      /* ✅ HORIZONTAL CENTER */
}

/* ADD TO CART */
.fc-add-cart-btn {
    background: #ff3f6c;
    border: none;
    color: #ffffff;
}

.fc-add-cart-btn:hover {
    background: #e7335d;
}

/* VIEW DETAILS */
.fc-product-btn {
    background: #ffffff;
    border: 1px solid #ff3f6c;
    color: #ff3f6c;
}

.fc-product-btn:hover {
    background: #fff0f4;
}

/* ===== RESPONSIVE ===== */
@media (max-width: 600px) {
    .fc-page-title {
        font-size: 20px;
    }
}
</style>
</head>

<body>

<jsp:include page="Header.jsp"></jsp:include>

<div class="fc-container">

    <!-- Page Heading -->
    <div class="fc-page-head">
        <h1 class="fc-page-title"><%= categoryName %></h1>
<p class="fc-page-sub">
    Explore latest <%= categoryName.toLowerCase() %> from top brands
</p>
    </div>

    <!-- Filter / Sort -->
    <div class="fc-filter-bar">
        <div class="fc-filter-left">

        <%
            ArrayList<Brand> brands =
                (ArrayList<Brand>) request.getAttribute("brands");

            if (brands != null) {
                for (Brand b : brands) {
        %>
            <div class="fc-filter-item"
     onclick="location.href='productList?categoryId=<%= categoryId %>&brandId=<%= b.getBrandId() %>'">
    <%= b.getBrandName() %>
</div>
        <%
                }
            }
        %>

    </div>

        <!-- <select class="fc-sort">
            <option>Sort by</option>
            <option>Price: Low to High</option>
            <option>Price: High to Low</option>
            <option>Newest First</option>
        </select> -->
    </div>

    <!-- Product Grid -->
   <!-- Product Grid -->
<div class="fc-products">

    <%-- JSP LOOP START --%>
    <%
    if (mobiles != null && mobiles.size() > 0) {
        for (Product p : mobiles) {
    %>
            <div class="fc-product-card">
                <div class="fc-product-img">
                    <img src="<%= p.getImageUrl() %>" 
     style="max-width:100%;max-height:100%;object-fit:contain;">
                </div>

                <div class="fc-product-name"><%= p.getName() %></div>
                <div class="fc-product-desc">
    <%= p.getDescription().replace("\n", "<br>") %>
</div>
                <%
    NumberFormat nf = NumberFormat.getInstance(new Locale("en", "IN"));
%>

<div class="fc-product-price">
    ₹<%= nf.format(p.getPrice()) %>
</div>

                <div class="fc-product-actions">

    <button class="fc-add-cart-btn"
    onclick="location.href='addToCart?productId=<%= p.getProductId() %>'">
    Add to BAG
</button>

    <button class="fc-product-btn"
        onclick="location.href='productDetails?productId=<%= p.getProductId() %>'">
        View Details
    </button>

</div>
            </div>
    <%
        }
    } else {
    %>
        <p>No <%= categoryName.toLowerCase() %> available</p>
    <%
    }
    %>
    <%-- JSP LOOP END --%>

</div>
</div>

<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>