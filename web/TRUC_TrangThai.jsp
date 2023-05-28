<%-- 
    Document   : TRUC_Cart
    Created on : May 27, 2023, 4:38:35 PM
    Author     : hi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trạng Thái</title>
        <link rel="stylesheet" href="assets/css/TRUC_GioHang1.css">
    </head>
    <body>
        <div class="thanhTrangThai">
            <div class="trangThai" onclick="loadData(1)" id="1">Giỏ Hàng</div>
            <div class="trangThai" onclick="loadData(2)" id="2">Chờ Xác Nhận</div>
            <div class="trangThai" onclick="loadData(3)" id="3">Đang Giao</div>
            <div class="trangThai" onclick="loadData(4)" id="4">Đơn Đã Hủy</div>
            <div class="trangThai" onclick="loadData(5)" id="5">Lịch Sử Mua Hàng</div>
        </div>
        <div class="noiDung" id="trangThai1">
            <jsp:include page="TRUC_GioHang.jsp" />
        </div>
        <div class="noiDung" id="trangThai2">
            <jsp:include page="TRUC_ChoXacNhan.jsp" />
        </div>
        <div class="noiDung" id="trangThai3">
            <jsp:include page="TRUC_DangGiao.jsp" />
        </div>
        <div class="noiDung" id="trangThai4">
            <jsp:include page="TRUC_DonDaHuy.jsp" />
        </div>
        <div class="noiDung" id="trangThai5">
            <jsp:include page="TRUC_LichSuMuaHang.jsp" />
        </div>
    </body>
    <script>
        for (let i = 1 ; i <= 5 ; i++){
            document.getElementById("" + i).style.color = "black";
            document.getElementById("" + i).style.borderBottom = "0px solid black";
            document.getElementById("trangThai" + i).style.display = "none";
        }
        loadData(1);
        document.getElementById("1").style.color = "#43d5b0";
        document.getElementById("1").style.borderBottom = "3px solid #43d5b0";
        document.getElementById("trangThai1").style.display = "flex";
        function loadData(n){
            for (let i = 1 ; i <= 5 ; i++){
                document.getElementById("" + i).style.color = "black";
                document.getElementById("" + i).style.borderBottom = "0px solid black";
                document.getElementById("trangThai" + i).style.display = "none";
            }
            document.getElementById("" + n).style.color = "#43d5b0";
            document.getElementById("" + n).style.borderBottom = "3px solid #43d5b0";
            document.getElementById("trangThai" + n).style.display = "flex";
            
        }
    </script>
</html>
