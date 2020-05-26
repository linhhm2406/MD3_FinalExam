<%--
  Created by IntelliJ IDEA.
  User: LinhHM
  Date: 5/26/2020
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <form action="/product?action=add" method="post">
        <table class="table table-hover">
            <tr>
                <th>#</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Color</th>
                <th>Category Name</th>
                <th>Action</th>
            </tr>
            <tr>
                <td><input type="text" name="productId"></td>
                <td><input type="text" name="productName"></td>
                <td><input type="text" name="price"></td>
                <td><input type="text" name="quantiy"></td>
                <td><input type="text" name="color"></td>
                <td><select name="categoryName">
                    <option value="Phone">Phone</option>
                    <option value="Television">Television</option>
                </select>
                </td>
                <td><input type="submit" class="btn btn-success" value="Add">
                <td><a href="/product"><input type="button" class="btn btn-success" value="Back"></a></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
