<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.ArrayList" %>
<%@ page import="com.futurecart.model.Product" %>

<%
ArrayList<Product> featuredProducts =
    (ArrayList<Product>) request.getAttribute("featuredProducts");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Future Cart</title>

<style>
/* ========== RESET & BASE ========== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
    background: linear-gradient(135deg, #f5f7fb 0%, #e8ecf1 100%);
    min-height: 100vh;
    line-height: 1.6;
}

a { 
    text-decoration: none; 
    color: inherit; 
    transition: all 0.3s ease;
}

/* ========== MAIN CONTENT ========== */
.fc-main {
    max-width: 1300px;
    margin: 32px auto 60px;
    padding: 0 24px;
    animation: fadeIn 0.6s ease-out;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ===== FEATURED PRODUCTS ===== */
.fc-section {
    margin-top: 64px;
}

.fc-section:first-child {
    margin-top: 40px;
}

.fc-section-header {
    margin-bottom: 32px;
    padding-bottom: 16px;
    border-bottom: 2px solid #e5e7eb;
    position: relative;
}

.fc-section-header::after {
    content: '';
    position: absolute;
    bottom: -2px;
    left: 0;
    width: 80px;
    height: 2px;
    background: linear-gradient(90deg, #ff3f6c, #ff6b9d);
    border-radius: 2px;
    animation: expandUnderline 0.8s ease-out;
}

@keyframes expandUnderline {
    from {
        width: 0;
    }
    to {
        width: 80px;
    }
}

.fc-section-title {
    font-size: 28px;
    font-weight: 800;
    color: #1f2937;
    margin-bottom: 8px;
    letter-spacing: -0.5px;
}

.fc-section-subtitle {
    margin-top: 0;
    font-size: 15px;
    color: #6b7280;
    font-weight: 500;
}

/* product cards */
.fc-products {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 28px;
    padding: 8px 0;
}

.fc-product-card {
    background: #ffffff;
    border-radius: 16px;
    border: 2px solid transparent;
    padding: 20px;
    box-shadow: 0 4px 16px rgba(0,0,0,0.08);
    display: flex;
    flex-direction: column;
    gap: 12px;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;
    cursor: pointer;
    animation: slideInUp 0.5s ease-out both;
    animation-delay: calc(var(--index, 0) * 0.1s);
}

@keyframes slideInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.fc-product-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 63, 108, 0.08), transparent);
    transition: left 0.6s ease;
}

.fc-product-card:hover::before {
    left: 100%;
}

.fc-product-card:hover {
    transform: translateY(-8px) scale(1.02);
    box-shadow: 0 12px 32px rgba(0,0,0,0.12);
    border-color: #ff3f6c;
    background: linear-gradient(135deg, #ffffff 0%, #fff5f7 100%);
}

.fc-product-card:active {
    transform: translateY(-4px) scale(1);
    transition: transform 0.1s ease;
}

.fc-product-image {
    height: 240px;
    border-radius: 12px;
    background: linear-gradient(135deg, #e0f2ff, #fce4ff);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 13px;
    color: #555;
    margin-bottom: 16px;
    overflow: hidden;
    position: relative;
    transition: all 0.4s ease;
}

.fc-product-image img {
    transition: transform 0.5s ease;
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.fc-product-card:hover .fc-product-image {
    border-radius: 16px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

.fc-product-card:hover .fc-product-image img {
    transform: scale(1.1);
}

.fc-product-name {
    font-size: 16px;
    font-weight: 700;
    color: #1f2937;
    line-height: 1.4;
    min-height: 44px;
    transition: color 0.3s ease;
}

.fc-product-card:hover .fc-product-name {
    color: #ff3f6c;
}

.fc-product-desc {
    font-size: 13px;
    color: #6b7280;
    line-height: 1.6;
    margin-top: 4px;
    transition: color 0.3s ease;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
}

.fc-product-card:hover .fc-product-desc {
    color: #4b5563;
}

.fc-product-price {
    font-size: 20px;
    font-weight: 800;
    color: #1f2937;
    margin-top: auto;
    transition: all 0.3s ease;
}

.fc-product-card:hover .fc-product-price {
    color: #ff3f6c;
    transform: scale(1.05);
}

.fc-product-price span {
    font-size: 14px;
    text-decoration: line-through;
    color: #9ca3af;
    margin-left: 8px;
    font-weight: 500;
}

.fc-product-btn {
    margin-top: 12px;
    align-self: flex-start;
    padding: 10px 20px;
    border-radius: 8px;
    border: 2px solid #ff3f6c;
    background: #ffffff;
    color: #ff3f6c;
    font-size: 13px;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    isolation: isolate;
}

.fc-product-btn::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 63, 108, 0.15);
    transform: translate(-50%, -50%);
    transition: width 0.4s, height 0.4s;
    z-index: 0;
    pointer-events: none;
}

.fc-product-btn:hover::before {
    width: 300px;
    height: 300px;
}

.fc-product-btn:hover {
    background: #ff3f6c;
    color: #ffffff;
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(255, 63, 108, 0.3);
    border-color: #ff3f6c;
}

.fc-product-btn:hover::before {
    background: rgba(255, 255, 255, 0.2);
}

.fc-product-btn:active {
    transform: translateY(0);
}

.fc-product-btn span {
    position: relative;
    z-index: 1;
}

/* ===== CATEGORY HIGHLIGHTS ===== */
.fc-category-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    gap: 28px;
    padding: 8px 0;
}

.fc-category-card {
    background: #ffffff;
    border: 2px solid transparent;
    border-radius: 16px;
    padding: 24px;
    box-shadow: 0 4px 16px rgba(0,0,0,0.08);
    text-align: center;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    cursor: pointer;
    position: relative;
    overflow: hidden;
}

.fc-category-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 63, 108, 0.08), transparent);
    transition: left 0.6s ease;
}

.fc-category-card:hover::before {
    left: 100%;
}

.fc-category-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 32px rgba(0,0,0,0.12);
    border-color: #ff3f6c;
    background: linear-gradient(135deg, #ffffff 0%, #fff5f7 100%);
}

.fc-category-img {
    height: 180px;
    border-radius: 12px;
    background: linear-gradient(135deg, #e0f2ff, #fce4ff);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 13px;
    color: #555;
    margin-bottom: 16px;
    overflow: hidden;
    transition: all 0.4s ease;
}

.fc-category-card:hover .fc-category-img {
    border-radius: 16px;
    transform: scale(1.05);
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

.fc-category-title {
    font-size: 18px;
    font-weight: 800;
    color: #1f2937;
    margin-bottom: 10px;
    transition: color 0.3s ease;
}

.fc-category-card:hover .fc-category-title {
    color: #ff3f6c;
}

.fc-category-desc {
    font-size: 14px;
    color: #6b7280;
    margin-bottom: 16px;
    line-height: 1.6;
    transition: color 0.3s ease;
}

.fc-category-card:hover .fc-category-desc {
    color: #4b5563;
}

.fc-category-btn {
    display: inline-block;
    padding: 10px 20px;
    border-radius: 8px;
    border: 2px solid #ff3f6c;
    color: #ff3f6c;
    font-size: 13px;
    font-weight: 700;
    transition: all 0.3s ease;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    position: relative;
    overflow: hidden;
}

.fc-category-btn::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: #ff3f6c;
    transform: translate(-50%, -50%);
    transition: width 0.4s, height 0.4s;
    z-index: 0;
}

.fc-category-btn:hover::before {
    width: 300px;
    height: 300px;
}

.fc-category-btn:hover {
    background: #ff3f6c;
    color: #ffffff;
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(255, 63, 108, 0.3);
}

.fc-category-btn span {
    position: relative;
    z-index: 1;
}

/* ===== FOOTER ===== */
.fc-footer {
    background: #ffffff;
    border-top: 2px solid #e5e7eb;
    margin-top: 80px;
    padding-top: 0;
}

.fc-footer-inner {
    max-width: 1300px;
    margin: 0 auto;
    padding: 48px 24px 32px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 40px;
}

.fc-footer-col {
    font-size: 14px;
    color: #555;
}

.fc-footer-title {
    font-size: 16px;
    font-weight: 800;
    color: #1f2937;
    margin-bottom: 16px;
    letter-spacing: -0.3px;
}

.fc-footer-text {
    font-size: 14px;
    color: #6b7280;
    line-height: 1.8;
    max-width: 280px;
}

.fc-footer-links {
    list-style: none;
    padding: 0;
    margin: 0;
}

.fc-footer-links li {
    margin-bottom: 12px;
}

.fc-footer-links a {
    font-size: 14px;
    color: #6b7280;
    text-decoration: none;
    transition: all 0.3s ease;
    display: inline-block;
    padding: 4px 0;
}

.fc-footer-links a:hover {
    color: #ff3f6c;
    transform: translateX(4px);
    font-weight: 600;
}

.fc-footer-bottom {
    border-top: 1px solid #e5e7eb;
    padding: 20px 24px;
    background: #f9fafb;
}

.fc-footer-bottom-inner {
    max-width: 1300px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 13px;
    color: #6b7280;
}

/* Empty State */
.fc-products p {
    grid-column: 1 / -1;
    text-align: center;
    padding: 60px 20px;
    color: #9ca3af;
    font-size: 16px;
    background: white;
    border-radius: 16px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
}

/* Responsive Design */
@media (max-width: 1024px) {
    .fc-products {
        grid-template-columns: repeat(3, 1fr);
        gap: 24px;
    }
    
    .fc-category-grid {
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 24px;
    }
}

@media (max-width: 768px) {
    .fc-main {
        margin: 24px auto 40px;
        padding: 0 16px;
    }
    
    .fc-section {
        margin-top: 48px;
    }
    
    .fc-section-header {
        margin-bottom: 24px;
    }
    
    .fc-section-title {
        font-size: 24px;
    }
    
    .fc-products {
        grid-template-columns: repeat(2, 1fr);
        gap: 16px;
    }
    
    .fc-product-card {
        padding: 16px;
    }
    
    .fc-product-image {
        height: 200px;
    }
    
    .fc-category-grid {
        grid-template-columns: repeat(2, 1fr);
        gap: 16px;
    }
    
    .fc-footer-inner {
        padding: 32px 16px 24px;
        gap: 32px;
    }
}

@media (max-width: 600px) {
    .fc-main {
        margin: 20px auto 32px;
        padding: 0 12px;
    }
    
    .fc-section {
        margin-top: 40px;
    }
    
    .fc-section-title {
        font-size: 22px;
    }
    
    .fc-section-subtitle {
        font-size: 14px;
    }
    
    .fc-products {
        grid-template-columns: 1fr;
        gap: 20px;
    }
    
    .fc-category-grid {
        grid-template-columns: 1fr;
    }
    
    .fc-footer-bottom-inner {
        flex-direction: column;
        gap: 12px;
        text-align: center;
    }
    
    .fc-footer-inner {
        grid-template-columns: 1fr;
        gap: 24px;
    }
}

/* Stagger animation for product cards */
.fc-product-card:nth-child(1) { --index: 0; }
.fc-product-card:nth-child(2) { --index: 1; }
.fc-product-card:nth-child(3) { --index: 2; }
.fc-product-card:nth-child(4) { --index: 3; }
.fc-product-card:nth-child(5) { --index: 4; }
.fc-product-card:nth-child(6) { --index: 5; }
.fc-product-card:nth-child(7) { --index: 6; }
.fc-product-card:nth-child(8) { --index: 7; }
.fc-product-card:nth-child(9) { --index: 8; }
.fc-product-card:nth-child(10) { --index: 9; }
</style>
    
    
</head>
<body>

<jsp:include page="Header.jsp" />

<main class="fc-main">

    <!-- FEATURED PRODUCTS SECTION -->
    <section class="fc-section">
        <div class="fc-section-header">
            <h2 class="fc-section-title">Featured Deals</h2>
            <p class="fc-section-subtitle">Handpicked offers on top categories.</p>
        </div>

        <div class="fc-products">

<% if (featuredProducts != null && !featuredProducts.isEmpty()) {
    for (Product p : featuredProducts) {
%>

    <article class="fc-product-card">
        <div class="fc-product-image">
            <img src="<%= p.getImageUrl() %>"
                 style="max-width:100%;max-height:100%;object-fit:contain;">
        </div>

        <div class="fc-product-name"><%= p.getName() %></div>

        <div class="fc-product-desc">
            <%= p.getDescription() %>
        </div>

        <div class="fc-product-price">
            ₹<%= p.getPrice() %>
        </div>

        <button class="fc-product-btn"
            onclick="location.href='productDetails?productId=<%= p.getProductId() %>'">
            View Details
        </button>
    </article>

<% } } else { %>
    <p>No featured products available</p>
<% } %>

</div>
    </section>
    
     <!-- ===== CATEGORY HIGHLIGHTS ===== -->
<!-- <section class="fc-section">
    <div class="fc-section-header">
        <h2 class="fc-section-title">Top Picks by Category</h2>
        <p class="fc-section-subtitle">
            Best product from each category
        </p>
    </div>

    <div class="fc-category-grid">

        Mobile
        <div class="fc-category-card">
            <div class="fc-category-img">Mobile Image</div>
            <h3 class="fc-category-title">Mobiles</h3>
            <p class="fc-category-desc">
                Samsung Galaxy S23 Â· Powerful camera Â· Smooth performance
            </p>
            <a href="#" class="fc-category-btn">View Mobiles</a>
        </div>

        Laptop
        <div class="fc-category-card">
            <div class="fc-category-img">Laptop Image</div>
            <h3 class="fc-category-title">Laptops</h3>
            <p class="fc-category-desc">
                HP Pavilion Â· Ryzen 5 Â· Ideal for work & study
            </p>
            <a href="#" class="fc-category-btn">View Laptops</a>
        </div>

        TV
        <div class="fc-category-card">
            <div class="fc-category-img">TV Image</div>
            <h3 class="fc-category-title">Smart TVs</h3>
            <p class="fc-category-desc">
                Samsung 4K UHD Â· Smart features Â· Crisp display
            </p>
            <a href="#" class="fc-category-btn">View TVs</a>
        </div>

        Speakers
        <div class="fc-category-card">
            <div class="fc-category-img">Speaker Image</div>
            <h3 class="fc-category-title">Speakers</h3>
            <p class="fc-category-desc">
                JBL Bluetooth Speaker Â· Deep bass Â· Long battery
            </p>
            <a href="#" class="fc-category-btn">View Speakers</a>
        </div>

        Home Appliances
        <div class="fc-category-card">
            <div class="fc-category-img">Appliance Image</div>
            <h3 class="fc-category-title">Home Appliances</h3>
            <p class="fc-category-desc">
                LG Washing Machine Â· Energy efficient Â· Silent wash
            </p>
            <a href="#" class="fc-category-btn">View Appliances</a>
        </div>

    </div>
</section> -->

</main>

<jsp:include page="Footer.jsp"></jsp:include>


</body>
</html>