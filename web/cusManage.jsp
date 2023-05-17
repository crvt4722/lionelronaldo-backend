<%-- 
    Document   : dangky
    Created on : Apr 27, 2023, 4:06:24 PM
    Author     : hi
--%>

<%@page import="modal.TaiKhoan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/dangky.css">
        <link rel="stylesheet" href="css/menu.css">
    </head>
    <body>
        <% TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("TaiKhoan");%>
        <div class="menu">
            <div class="tacvu">
                Tiếng Trung An An
            </div>
            <div class="tacvu">
                <% if (taikhoan.getVaitro().equals("0")) {%>
                <buttion class="button" onclick="document.location= 'http://localhost:8080/apptiengtrung/trangchudadangnhap.jsp'" >Trang Chủ</buttion>
                <%} else {%>
                <buttion class="button" onclick="document.location= 'http://localhost:8080/apptiengtrung/trangchuadmin.jsp'" >Trang Chủ</buttion>
                <%}%>
            </div>
            <div class="tacvu">
                <form action="dangxuatservlet"> <input type="submit" class="button" value="Đăng xuất"></form>
                <form action="capnhattaikhoanservlet"> <input type="submit" class="button" value="Cập nhật"></form>
            </div>
        </div>
        <div class="dangky">
            <form action="capnhattaikhoanserverlet2">
                <div class="form-group">
                    <label style="font-size: 30px ; color: white">Cập Nhật </label>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Tên Đăng Nhập </label>
                    <input type="text" class="form-control" id="exampleInputEmail1"  name="name" value="<%= taikhoan.getTendangnhap()%>" readonly>
                    
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Mật khẩu</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" name="pass" value="<%= taikhoan.getMatkhau()%>" >
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Email </label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="mail"  value="<%= taikhoan.getMail()%>">

                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Họ và tên </label>
                    <input type="text" class="form-control"  name="hoten"  value="<%= taikhoan.getHotendaydu()%>">

                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Số điện thoại </label>
                    <input type="text" class="form-control" name="sdt"  value="<%= taikhoan.getSodienthoai()%>">

                </div>
                <div class="form-group">
                    <input hidden type="text" name="vaitro" value="<%= taikhoan.getVaitro()%>">

                </div>
                    
                <div class="form-group">
                    <label for="exampleInputEmail1">Vai Trò </label>
                    <input type="text" class="form-control" id="exampleInputEmail1"  name="vaitro" value=" <%= taikhoan.getVaitro()%>" readonly>
                    
                </div>
                <% if (session.getAttribute("message") != null) {%>
                <div class=""><%= (String) session.getAttribute("message")%></div>
                <% }%>
                <button type="submit" class="btn btn-primary">Cập nhật</button>
                
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
