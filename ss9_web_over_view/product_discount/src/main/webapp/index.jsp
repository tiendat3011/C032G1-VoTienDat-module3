<%--
  Created by IntelliJ IDEA.
  User: hella
  Date: 6/27/2022
  Time: 4:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="/product" method="post">
    <div>
        <label>Product Description: Mô tả của sản phẩm</label>
        <input  type="text" name="product_description" value="${description}">
    </div>
    <div>
        <label>List Price: Giá niêm yết của sản phẩm</label>
        <input type="text" name="list_price" value="${listPrice}">
    </div>
    <div>
        <label>Discount Percent: Tỷ lệ chiết khấu (phần trăm)</label>
        <input type="text" name="discount_percent" value="${discountPercent}">
    </div>
    <button data-toggel = "modal" data-target = "myModal" type="submit">Tính chiết khấu</button>
</form>
<label>Discount Amount: Lượng chiết khấu</label>
<div>${discountAmount}</div>
<label>Discount Price: Giá sau khi đã được chiết khấu</label>
<div>${discountPrice}</div>
</body>
</html>