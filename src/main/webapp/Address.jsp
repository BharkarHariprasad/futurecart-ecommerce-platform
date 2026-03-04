<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.futurecart.model.Address" %>

<%
    Address editAddr = (Address) request.getAttribute("editAddress");
    boolean isEdit = (editAddr != null);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FutureCart — Saved Addresses</title>

<style>
* { box-sizing: border-box; margin: 0; padding: 0; }

body {
    font-family: system-ui, Arial, sans-serif;
    background: #ffffff;
    color: #111827;
    padding: 28px;
}

.page-wrapper {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

.page-content {
    flex: 1;
}

.container {
    max-width: 1100px;
    margin: auto;
}

/* ===== HEADER ===== */
.page-head {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    border-bottom: 1px solid #e5e7eb;
    padding-bottom: 12px;
}

.brand {
    display: flex;
    align-items: center;
    gap: 12px;
}

.logo-rect {
    width: 44px;
    height: 44px;
    background: linear-gradient(135deg, #ff3f6c, #ff7a18);
    border-radius: 8px;
    color: #fff;
    font-weight: 800;
    display: flex;
    align-items: center;
    justify-content: center;
}

.page-title {
    font-size: 22px;
    font-weight: 800;
}

.actions {
    display: flex;
    gap: 12px;
}

.home-btn, .add-btn {
    padding: 10px 16px;
    border-radius: 8px;
    font-weight: 700;
    text-decoration: none;
    font-size: 14px;
}

.home-btn {
    background: #fff7f7;
    color: #ff3f6c;
    border: 1px solid #ffb3c4;
}

.add-btn {
    background: #f3f4ff;
    color: #4f46e5;
    border: 1px solid #c7d2fe;
}

/* ===== ADDRESS CARD ===== */
.address-card {
    border: 1px solid #e5e7eb;
    border-radius: 8px;
    padding: 18px;
    margin-bottom: 20px;
}

.address-card-top {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
}

.addr-name {
    font-size: 18px;
    font-weight: 700;
}

.addr-tag {
    background: #f3f4f6;
    padding: 4px 10px;
    border-radius: 999px;
    font-size: 12px;
    font-weight: 700;
}

.addr-text {
    line-height: 1.6;
    color: #374151;
}

.addr-mobile {
    margin-top: 10px;
    color: #6b7280;
}

.address-divider {
    height: 1px;
    background: #e5e7eb;
    margin: 14px 0;
}

.address-actions {
    display: flex;
    justify-content: space-around;
}

.address-actions a,
.address-actions button {
    background: none;
    border: none;
    font-weight: 700;
    cursor: pointer;
    color: #4f46e5;
    text-decoration: none;
}

/* ===== MODAL ===== */
.overlay {
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.4);
    display: none;
    align-items: center;
    justify-content: center;
}

.overlay:target {
    display: flex;
}

.overlay.force-open {
    display: flex;
}

.modal {
    background: #ffffff;
    width: 100%;
    max-width: 600px;
    border-radius: 10px;
    overflow: hidden;
}

.modal-head {
    padding: 16px;
    border-bottom: 1px solid #e5e7eb;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.modal-head h3 {
    font-size: 18px;
}

.close-link {
    text-decoration: none;
    font-size: 22px;
    color: #374151;
}

.modal-body {
    padding: 20px;
}

.form-row {
    display: flex;
    gap: 12px;
}

.field {
    flex: 1;
}

.form-group {
    display: flex;
    flex-direction: column;
    margin-bottom: 12px;
}

.form-group label {
    font-size: 13px;
    font-weight: 700;
    margin-bottom: 4px;
}

.form-group input,
.form-group select {
    padding: 10px;
    border-radius: 8px;
    border: 1px solid #e5e7eb;
}

.form-actions {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
}

.btn-primary {
    background: #4f46e5;
    color: #ffffff;
    padding: 10px 18px;
    border-radius: 8px;
    border: none;
    font-weight: 700;
}

.btn-ghost {
    padding: 10px 18px;
    border-radius: 8px;
    border: 1px solid #e5e7eb;
    text-decoration: none;
    color: #374151;
}
</style>
</head>

<body>

<div class="page-wrapper">
<div class="page-content">

<div class="container">

<!-- HEADER -->
<div class="page-head">
    <div class="brand">
        <div class="logo-rect">F</div>
        <div>
            <div class="page-title">Saved Addresses</div>
            <div style="font-size:12px;color:#6b7280;">FutureCart</div>
        </div>
    </div>
    <div class="actions">
        <a href="home" class="home-btn">← Home</a>
        <a href="#add-address-modal" class="add-btn">＋ Add Address</a>
    </div>
</div>

<!-- ADDRESS LIST -->
<%
ArrayList<Address> list =
    (ArrayList<Address>) request.getAttribute("savedAddress");

if (list == null || list.isEmpty()) {
%>
<p>No saved addresses.</p>
<%
} else {
    for (Address addr : list) {
%>

<div class="address-card">
    <div class="address-card-top">
        <div class="addr-name"><%= addr.getFullName() %></div>
        <div class="addr-tag"><%= addr.getAddressType() %></div>
    </div>

    <div class="addr-text">
        <%= addr.getAddressLine1() %><br>
        <%= addr.getAddressLine2() != null ? addr.getAddressLine2() + "<br>" : "" %>
        <%= addr.getCity() %>, <%= addr.getState() %> - <%= addr.getPincode() %>
    </div>

    <div class="addr-mobile">
        Mobile: <%= addr.getMobile() %>
    </div>

    <div class="address-divider"></div>

    <div class="address-actions">
        <a href="editAddress?addressId=<%= addr.getAddressId() %>">EDIT</a>
        <form action="deleteAddress" method="post">
            <input type="hidden" name="addressId" value="<%= addr.getAddressId() %>">
            <button type="submit">REMOVE</button>
        </form>
    </div>
</div>

<% } } %>

</div>
</div>

<!-- MODAL -->
<div id="add-address-modal" class="overlay <%= isEdit ? "force-open" : "" %>">
<div class="modal">

<div class="modal-head">
    <h3><%= isEdit ? "Edit Address" : "Add Address" %></h3>
    <a href="addresses" class="close-link">&times;</a>
</div>

<div class="modal-body">
<form action="<%= isEdit ? "updateAddress" : "addressesadd" %>" method="post">

<input type="hidden" name="redirectTo"
       value="<%= request.getParameter("redirectTo") != null 
                ? request.getParameter("redirectTo") 
                : "addresses" %>">

<% if (isEdit) { %>
<input type="hidden" name="addressId" value="<%= editAddr.getAddressId() %>">
<% } %>

<div class="form-row">
    <div class="form-group field">
        <label>Full Name</label>
        <input type="text" name="fullName" value="<%= isEdit ? editAddr.getFullName() : "" %>" required>
    </div>
    <div class="form-group field">
        <label>Mobile</label>
        <input type="text" name="mobile" value="<%= isEdit ? editAddr.getMobile() : "" %>" required>
    </div>
</div>

<div class="form-group">
    <label>Address Line 1</label>
    <input type="text" name="addressLine1" value="<%= isEdit ? editAddr.getAddressLine1() : "" %>" required>
</div>

<div class="form-group">
    <label>Address Line 2</label>
    <input type="text" name="addressLine2" value="<%= isEdit ? editAddr.getAddressLine2() : "" %>">
</div>

<div class="form-row">
    <div class="form-group field">
        <label>City</label>
        <input type="text" name="city" value="<%= isEdit ? editAddr.getCity() : "" %>" required>
    </div>
    <div class="form-group field">
        <label>State</label>
        <input type="text" name="state" value="<%= isEdit ? editAddr.getState() : "" %>" required>
    </div>
    <div class="form-group field">
        <label>Pincode</label>
        <input type="text" name="pincode" value="<%= isEdit ? editAddr.getPincode() : "" %>" required>
    </div>
</div>

<div class="form-group">
    <label>Address Type</label>
    <select name="addressType">
        <option value="home" <%= isEdit && "home".equals(editAddr.getAddressType()) ? "selected" : "" %>>Home</option>
        <option value="office" <%= isEdit && "office".equals(editAddr.getAddressType()) ? "selected" : "" %>>Office</option>
    </select>
</div>

<div class="form-actions">
    <button type="submit" class="btn-primary"><%= isEdit ? "Update" : "Save" %></button>
    <a href="addresses" class="btn-ghost">Cancel</a>
</div>

</form>
</div>

</div>
</div>

</div>
</body>
</html>