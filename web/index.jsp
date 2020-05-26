<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="mainStyle.css">
</head>
<body>
<div class="container" style="margin-top: 30px">
    <div class="head">
        <a href="/product?action=add"><input type="button"
                                             class="btn btn-primary"
                                             value="Add more Product"></a>
        <form style="float:right;" action="/product?action=search" method="post">
            <input type="text" name="searchContent">
            <input type="submit" value="Search">
        </form>
    </div>
    <div>
        <form action="" method="post">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Color</th>
                    <th>Category</th>
                    <th colspan="2">Action</th>
                </tr>
                <c:forEach items="${productList}" var="productList">
                    <tr>
                        <td>${productList.getProductId()}</td>
                        <td>${productList.getProductName()}</td>
                        <td>${productList.getPrice()}</td>
                        <td>${productList.getQuantity()}</td>
                        <td>${productList.getColor()}</td>
                        <td>${productList.getCategoryName()}</td>
                        <td><a href="/product?action=update&productId=${productList.getProductId()}"><input
                                type="button"
                                class="btn btn-success"
                                value="Update"></a>
                        </td>
                        <td><a href="/product?action=delete&productId=${productList.getProductId()}"><input
                                type="button"
                                class="btn btn-danger"
                                value="Delete"
                                onclick="return (confirm('Do you want to Delete?'))"></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </div>
</div>
</body>
</html>
