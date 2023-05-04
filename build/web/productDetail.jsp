<%-- 
    Document   : productDetail
    Created on : May 4, 2023, 4:23:48 PM
    Author     : Vinh
--%>

<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="assets/css/DAstyle.css">
    <link rel="stylesheet" href="assets/css/DAsanpham.css">
</head>
<body>
    
    <div class="head">
        <img class = "full" src="assets/img/product/head.png" alt="" srcset="">
    </div>
    <div class="con">
        <div class="khunganh">
            <img src="assets/img/product/HPEnvy.png" alt="">
        </div>
        <div class="ten">
            <h1> HP Enry </h1>
        </div>
        <div class="gia">
            <h2>Giá bán: 12.000.000 d</h2>
        </div>
        <div class="mota">
            <h2>Mô tả: Rac la dep </h2>
        </div>
        <div class="mua">
            <form action="giohang.jsp">
                <input type="submit">
            </form>
        </div>
    </div>
    <script>
        function mua(){
            document.location = "giohang.jsp";
        }
    </script>
</body>
</html>
