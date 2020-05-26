<%--
  Created by IntelliJ IDEA.
  User: LinhHM
  Date: 5/26/2020
  Time: 10:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <form action="/product?action=update" method="post">
        <table class="table table-hover">
            <tr>
                <th>#</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Color</th>
                <th>CategoryId</th>
                <th>Action</th>
            </tr>
            <tr>
                <td><input type="hidden" name="productId" value="${product.getProductId()}">${product.getProductId()}</td>
                <td><input type="text" name="productName" value="${product.getProductName()}"></td>
                <td><input type="text" name="price" value="${product.getPrice()}"></td>
                <td><input type="text" name="quantity" value="${product.getQuantity()}"></td>
                <td><input type="text" name="color" value="${product.getColor()}"></td>
                <td><input type="text" name="categoryId" value="${product.getCategoryId()}"></td>
                <td><input type="submit" class="btn btn-success" onclick="return alert('Update Ok')" value="Update"></td>
                <td><a href="/product"><input type="button" class="btn btn-success" value="Back"></a></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
