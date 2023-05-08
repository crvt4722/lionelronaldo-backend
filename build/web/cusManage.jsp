<%-- 
    Document   : cusManage
    Created on : May 4, 2023, 2:13:19 AM
    Author     : hi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="dangkyservlet">
                    <div class="form-group">
                        <label style="font-size: 30px ; color: white">Đăng Kí </label>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Tên Đăng Nhập </label>
                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="name">
                        
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Mật khẩu</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="pass">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email </label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="mail">
                        
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Họ và tên </label>
                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter họ tên" name="hoten">
                        
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Số điện thoại </label>
                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter số điện thoại" name="sdt">
                        
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Nếu bạn muốn đăng kí thêm tài khoản quản lý thì hãy nhập mã </label>
                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter mã code" name="vaitro">
                        
                    </div> 
    </body>
</html>
