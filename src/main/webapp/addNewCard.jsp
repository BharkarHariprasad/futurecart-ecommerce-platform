<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Add New Card</title>

<style>
body {
    font-family: system-ui, Arial;
    background: #f1f3f6;
}

.card-box {
    max-width: 420px;
    margin: 60px auto;
    background: white;
    padding: 24px;
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.1);
}

.card-box h2 {
    text-align: center;
    margin-bottom: 20px;
}

input {
    width: 100%;
    padding: 12px;
    margin-bottom: 14px;
    border-radius: 8px;
    border: 1px solid #ccc;
}

button {
    width: 100%;
    padding: 14px;
    border-radius: 999px;
    border: none;
    background: #ff3f6c;
    color: white;
    font-weight: 700;
}
</style>

</head>
<body>

<div class="card-box">
    <h2>Add New Card</h2>

    <form action="validateCard" method="post">

        <input type="text" name="cardNumber"
               placeholder="Card Number" required>

        <input type="text" name="expiryMonth"
               placeholder="Expiry Month (MM)" required>

        <input type="text" name="expiryYear"
               placeholder="Expiry Year (YY)" required>

        <input type="password" name="cvv"
               placeholder="CVV" required>

        <button>PAY NOW</button>

    </form>
</div>

</body>
</html>