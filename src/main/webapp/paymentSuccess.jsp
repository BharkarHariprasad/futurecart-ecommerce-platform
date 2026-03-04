<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Payment Successful - FutureCart</title>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        min-height: 100vh;
        font-family: system-ui, Arial, sans-serif;
        background: linear-gradient(135deg, #f0fdf4, #dcfce7);
        display: flex;
        justify-content: center;
        align-items: center;
        color: #064e3b;
    }

    .success-card {
        background: #ffffff;
        width: 420px;
        padding: 32px 28px;
        border-radius: 18px;
        text-align: center;
        box-shadow: 0 20px 40px rgba(0,0,0,0.12);
    }

    .check-circle {
        width: 80px;
        height: 80px;
        margin: 0 auto 18px;
        border-radius: 50%;
        background: linear-gradient(135deg, #22c55e, #16a34a);
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 42px;
        box-shadow: 0 10px 22px rgba(34,197,94,0.45);
    }

    h1 {
        font-size: 22px;
        font-weight: 800;
        margin-bottom: 6px;
    }

    .subtitle {
        font-size: 14px;
        color: #065f46;
        margin-bottom: 20px;
    }

    .info-box {
        background: #f0fdf4;
        border-radius: 12px;
        padding: 14px;
        margin-bottom: 22px;
        font-size: 13px;
        color: #166534;
    }

    .btn {
        width: 100%;
        height: 46px;
        border-radius: 999px;
        border: none;
        background: linear-gradient(135deg, #ff3f6c, #ff6b8b);
        color: white;
        font-size: 15px;
        font-weight: 700;
        cursor: pointer;
        margin-top: 10px;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 14px 30px rgba(255,63,108,0.45);
    }

    .btn.secondary {
        background: #ffffff;
        color: #ff3f6c;
        border: 2px solid #ff3f6c;
        box-shadow: none;
    }

    .btn:hover {
        filter: brightness(1.05);
    }

</style>
</head>

<body>

<div class="success-card">

    <div class="check-circle">✓</div>

    <h1>Payment Successful</h1>
    <div class="subtitle">
        Your order has been placed successfully
    </div>

    <div class="info-box">
        Thank you for shopping with <strong>FutureCart</strong>.<br>
        Your payment is confirmed and your order is being processed.
    </div>

    <a href="orders" class="btn">
        VIEW MY ORDERS
    </a>

    <a href="home" class="btn secondary">
        CONTINUE SHOPPING
    </a>

</div>

</body>
</html>