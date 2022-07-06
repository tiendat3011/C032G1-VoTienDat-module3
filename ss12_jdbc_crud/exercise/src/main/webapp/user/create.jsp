<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${mess!=null}">
    <p>${mess}</p>
</c:if>
<a href="/user">Back list</a>
<form action="/user?action=create" method="post">
    <table>
        <tr>
            <td>Id</td>
            <td><input type="hidden" name="id" > tự tăng </td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email"></td>
        </tr>
        <tr>
            <td> Country </td>
            <td><input type="text" name="country"></td>
        </tr>
        <tr>
            <td>Status</td>
            <td><input type="hidden" name="status"> mặc định là 0 </td>
        </tr>
        <tr>
            <td>  <button type="submit">Add new</button></td>
        </tr>
    </table>
</form>
</body>
</html>
