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
        <div class="noiDung" id="trangThai1"></div>
        <div class="noiDung" id="trangThai2"></div>
        <div class="noiDung" id="trangThai3"></div>
        <div class="noiDung" id="trangThai4"></div>
        <div class="noiDung" id="trangThai5"></div>
    </body>
    <script>
        let dss = [
            'giohang',
            'choxacnhan',
            'danggiao',
            'dondahuy',
            'delivered'
        ];
        for (let i = 1; i <= 5; i++) {
            document.getElementById("" + i).style.color = "black";
            document.getElementById("" + i).style.borderBottom = "0px solid black";
            document.getElementById("trangThai" + i).style.display = "none";
        }
        loadData(1);
        document.getElementById("1").style.color = "#43d5b0";
        document.getElementById("1").style.borderBottom = "3px solid #43d5b0";
        document.getElementById("trangThai1").style.display = "flex";
        function loadData(n) {
            for (let i = 1; i <= 5; i++) {
                document.getElementById("" + i).style.color = "black";
                document.getElementById("" + i).style.borderBottom = "0px solid black";
                document.getElementById("trangThai" + i).style.display = "none";
            }
            document.getElementById("" + n).style.color = "#43d5b0";
            document.getElementById("" + n).style.borderBottom = "3px solid #43d5b0";
            document.getElementById("trangThai" + n).style.display = "flex";
            logJSONData(n);
        }
        async function logJSONData(n) {
            const response = await fetch("http://localhost:8080/LeoCris/truc_loaddata", {
                method: "POST",
                headers: {
                    'Accept': 'application/json',
                },
                body: JSON.stringify({ds: dss[n-1]}),

            });
            const jsonData = await response.json();
            renderData(jsonData, n);
            console.log(jsonData);
        }
        function renderData(data, n) {
            
            let html = '';
            for (let i of data) {
                html += i.orderId + " ";
            }
            document.querySelector("#trangThai" + n).innerHTML = html;
        }

    </script>
</html>
