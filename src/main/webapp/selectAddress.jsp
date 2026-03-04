<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.futurecart.model.Address" %>

<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("Login.html");
        return;
    }

    ArrayList<Address> list =
        (ArrayList<Address>) request.getAttribute("savedAddress");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Delivery Address</title>

<style>
body {
    font-family: system-ui, Arial, sans-serif;
    background: #f5f5f5;
    padding: 30px;
}

.container {
    max-width: 850px;
    margin: auto;
    background: #fff;
    padding: 26px;
    border-radius: 10px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.08);
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 22px;
}

.add-btn {
    padding: 10px 18px;
    border-radius: 999px;
    background: #fff0f4;
    border: 1px solid #ff3f6c;
    color: #ff3f6c;
    font-weight: 700;
    text-decoration: none;
}

.address-card {
    border: 1px solid #e0e0e0;
    padding: 16px;
    border-radius: 8px;
    margin-bottom: 14px;
    display: flex;
    gap: 12px;
}

.address-card:hover {
    background: #fff5f7;
    border-color: #ff3f6c;
}

button {
    margin-top: 24px;
    padding: 14px 26px;
    border-radius: 999px;
    border: none;
    background: #ff3f6c;
    color: white;
    font-weight: 700;
    cursor: pointer;
}

/* ========= MODAL ========= */
.overlay {
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.45);
    display: none;
    align-items: center;
    justify-content: center;
}

.overlay:target {
    display: flex;
}

.modal {
    background: #fff;
    width: 520px;
    padding: 22px;
    border-radius: 10px;
}

.modal h3 {
    margin-bottom: 12px;
}

.form-group {
    display: flex;
    flex-direction: column;
    margin-bottom: 10px;
}

input, select {
    padding: 9px;
    border-radius: 6px;
    border: 1px solid #ccc;
}
</style>
</head>

<body>

<div class="container">

    <div class="header">
        <h2>Select Delivery Address</h2>
        <!-- 🔥 OPEN POPUP -->
        <a href="addresses?redirectTo=confirmAddress" class="add-btn">
    ➕ Add New Address
</a>
    </div>

    <% if (list != null && !list.isEmpty()) { %>

        <form action="confirmAddress" method="post">

            <% for (Address addr : list) { %>

                <div class="address-card">
                    <input type="radio" name="addressId"
                           value="<%= addr.getAddressId() %>" required>

                    <div>
                        <b><%= addr.getFullName() %></b><br>
                        <%= addr.getAddressLine1() %><br>
                        <%= addr.getCity() %>, <%= addr.getState() %> - <%= addr.getPincode() %><br>
                        Mobile: <%= addr.getMobile() %>
                    </div>
                </div>

            <% } %>

            <button type="submit">Deliver to this Address</button>
        </form>

    <% } %>

</div>

<!-- ================= ADD ADDRESS POPUP ================= -->
<div id="addAddressModal" class="overlay">
    <div class="modal">

        <h3>Add New Address</h3>

        <form action="addressesadd" method="post">

            <div class="form-group">
                <label>Full Name</label>
                <input name="fullName" required>
            </div>

            <div class="form-group">
                <label>Mobile</label>
                <input name="mobile" required>
            </div>

            <div class="form-group">
                <label>Address Line 1</label>
                <input name="addressLine1" required>
            </div>

            <div class="form-group">
                <label>City</label>
                <input name="city" required>
            </div>

            <div class="form-group">
                <label>State</label>
                <input name="state" required>
            </div>

            <div class="form-group">
                <label>Pincode</label>
                <input name="pincode" required>
            </div>

            <div class="form-group">
                <label>Address Type</label>
                <select name="addressType">
                    <option>HOME</option>
                    <option>WORK</option>
                </select>
            </div>

            <button type="submit">Save Address</button>
            <br><br>
            <a href="#">Cancel</a>
        </form>

    </div>
</div>

</body>
</html>