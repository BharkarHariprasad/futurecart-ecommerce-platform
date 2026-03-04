<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.futurecart.model.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>



<%
    Product p = (Product) request.getAttribute("product");
    NumberFormat nf = NumberFormat.getInstance(new Locale("en", "IN"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= p.getName() %> | FutureCart</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
    background: linear-gradient(135deg, #f5f7fb 0%, #e8ecf1 100%);
    min-height: 100vh;
    padding: 0;
    line-height: 1.6;
    animation: fadeIn 0.6s ease-out;
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

.pd-container {
    max-width: 1200px;
    margin: 40px auto;
    background: #ffffff;
    padding: 48px;
    display: flex;
    gap: 48px;
    border-radius: 24px;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
    animation: slideUp 0.6s ease-out;
    border: 1px solid #e5e7eb;
    transition: all 0.3s ease;
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.pd-container:hover {
    box-shadow: 0 15px 50px rgba(0, 0, 0, 0.15);
    transform: translateY(-4px);
}

.pd-image {
    flex: 1;
    position: relative;
    border-radius: 16px;
    overflow: hidden;
    background: linear-gradient(135deg, #f9fafb, #f3f4f6);
    padding: 24px;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.4s ease;
    border: 2px solid transparent;
}

.pd-image::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 63, 108, 0.05), transparent);
    transition: left 0.6s ease;
}

.pd-container:hover .pd-image::before {
    left: 100%;
}

.pd-container:hover .pd-image {
    border-color: #ff3f6c;
    box-shadow: 0 8px 24px rgba(255, 63, 108, 0.15);
}

.pd-image img {
    width: 100%;
    max-height: 500px;
    object-fit: contain;
    transition: transform 0.5s ease;
    position: relative;
    z-index: 1;
}

.pd-container:hover .pd-image img {
    transform: scale(1.05);
}

.pd-info {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 12px 0;
}

.pd-name {
    font-size: 32px;
    font-weight: 800;
    color: #1f2937;
    margin-bottom: 16px;
    line-height: 1.3;
    letter-spacing: -0.5px;
    transition: color 0.3s ease;
    animation: fadeInLeft 0.6s ease-out 0.2s both;
}

@keyframes fadeInLeft {
    from {
        opacity: 0;
        transform: translateX(-20px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

.pd-container:hover .pd-name {
    color: #ff3f6c;
}

.pd-price {
    font-size: 36px;
    font-weight: 900;
    margin: 20px 0 24px;
    color: #1f2937;
    animation: fadeInLeft 0.6s ease-out 0.3s both;
    transition: all 0.3s ease;
}

.pd-container:hover .pd-price {
    color: #ff3f6c;
    transform: scale(1.05);
}

.pd-desc {
    font-size: 16px;
    color: #6b7280;
    line-height: 1.8;
    margin-bottom: 32px;
    padding: 24px;
    background: #f9fafb;
    border-radius: 12px;
    border-left: 4px solid #ff3f6c;
    animation: fadeInLeft 0.6s ease-out 0.4s both;
    transition: all 0.3s ease;
}

.pd-container:hover .pd-desc {
    background: #fff5f7;
    border-left-color: #ff3f6c;
    color: #4b5563;
    transform: translateX(4px);
}

.pd-actions {
    margin-top: auto;
    display: flex;
    gap: 16px;
    animation: fadeInLeft 0.6s ease-out 0.5s both;
}

.pd-btn {
    flex: 1;
    padding: 16px 24px;
    border-radius: 12px;
    font-weight: 700;
    font-size: 15px;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    isolation: isolate;
    border: 2px solid transparent;
    outline: none;
    min-height: 52px;
    display: flex;
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
}

.pd-btn::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.4s, height 0.4s;
    z-index: 0;
    pointer-events: none;
}

.pd-btn:hover::before {
    width: 300px;
    height: 300px;
}

.pd-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
}

.pd-btn:active {
    transform: translateY(-1px);
    transition: transform 0.1s ease;
}

.add-cart {
    background: linear-gradient(135deg, #ff3f6c, #ff6b9d);
    border: 2px solid transparent;
    color: white;
    box-shadow: 0 4px 16px rgba(255, 63, 108, 0.3);
    min-height: 52px;
    box-sizing: border-box;
}

.add-cart:hover {
    background: linear-gradient(135deg, #ff6b9d, #ff3f6c);
    box-shadow: 0 8px 28px rgba(255, 63, 108, 0.4);
    color: #ffffff;
}

.add-cart:active {
    box-shadow: 0 2px 12px rgba(255, 63, 108, 0.3);
}

.buy-now {
    border: 2px solid #ff3f6c;
    background: white;
    color: #ff3f6c;
    position: relative;
    min-height: 52px;
    box-sizing: border-box;
}

.buy-now::after {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: #ff3f6c;
    transition: left 0.3s ease;
    z-index: -1;
}

.buy-now:hover {
    color: #ffffff;
    border-color: #ff3f6c;
    background: #ff3f6c;
    box-shadow: 0 8px 24px rgba(255, 63, 108, 0.3);
}

.buy-now:hover::after {
    left: 0;
}

.buy-now:active {
    box-shadow: 0 2px 12px rgba(255, 63, 108, 0.3);
}

/* Responsive Design */
@media (max-width: 968px) {
    .pd-container {
        flex-direction: column;
        padding: 32px;
        gap: 32px;
        margin: 24px auto;
    }

    .pd-image {
        max-height: 400px;
    }

    .pd-image img {
        max-height: 400px;
    }

    .pd-name {
        font-size: 28px;
    }

    .pd-price {
        font-size: 32px;
    }

    .pd-desc {
        font-size: 15px;
        padding: 20px;
    }

    .pd-actions {
        flex-direction: column;
    }

    .pd-btn {
        width: 100%;
    }
}

@media (max-width: 640px) {
    body {
        padding: 0;
    }

    .pd-container {
        margin: 16px;
        padding: 24px;
        border-radius: 16px;
        gap: 24px;
    }

    .pd-image {
        padding: 16px;
    }

    .pd-image img {
        max-height: 300px;
    }

    .pd-name {
        font-size: 24px;
        margin-bottom: 12px;
    }

    .pd-price {
        font-size: 28px;
        margin: 16px 0 20px;
    }

    .pd-desc {
        font-size: 14px;
        padding: 16px;
        margin-bottom: 24px;
    }

    .pd-actions {
        gap: 12px;
    }

    .pd-btn {
        padding: 14px 20px;
        font-size: 14px;
    }
}

@media (max-width: 480px) {
    .pd-container {
        margin: 12px;
        padding: 20px;
    }

    .pd-name {
        font-size: 22px;
    }

    .pd-price {
        font-size: 24px;
    }

    .pd-desc {
        font-size: 13px;
        padding: 14px;
    }
}

/* Focus states for accessibility */
.pd-btn:focus {
    outline: 3px solid #ff3f6c;
    outline-offset: 2px;
}

.pd-container:focus-within {
    border-color: #ff3f6c;
}
</style>
</head>

<body>

<jsp:include page="Header.jsp" />

<div class="pd-container">

    <div class="pd-image">
        <img src="<%= p.getImageUrl() %>">
    </div>

    <div class="pd-info">
        <div class="pd-name"><%= p.getName() %></div>

        <div class="pd-price">₹<%= nf.format(p.getPrice()) %></div>

        <div class="pd-desc">
            <%= p.getDescription().replace("\n", "<br>") %>
        </div>

        <div class="pd-actions">
            <button class="pd-btn add-cart"
                onclick="location.href='addToCart?productId=<%= p.getProductId() %>'">
                Add to Cart
            </button>

            <form action="buyNow" method="post">
    <input type="hidden" name="productId" value="<%= p.getProductId() %>">
    <button type="submit" class="pd-btn buy-now">BUY NOW</button>
</form>
        </div>
    </div>

</div>

</body>
</html>