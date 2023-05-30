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
            <div class="phanDau">
                <div class="nua">
                    <div class="nuanua"><input class="cbox" type="checkbox" value="1" name="dssp"></div>
                    <div class="nuanua">Sản Phẩm</div>
                </div>
                <div class="nua">
                    <div class="nuanuanua Sp">Đơn giá</div> 
                    <div class="nuanuanua Sp">Số Lượng</div> 
                    <div class="nuanuanua Sp">Số Tiền</div> 
                    <div class="nuanuanua Sp">Xóa</div> 
                </div>
            </div>
            <div class="phanGiua" id="phanGiua1">
                <div class="phanGiuaCon">
                    Không tồn tại sản phẩm nào!
                </div>
                <div class="phanGiuaCon">
                    <div class="nua">
                        <div class="checkbox Sp"><input class="cbox" type="checkbox" value="1" name="dssp"></div>
                        <div class="anh Sp">img</div>
                        <div class="ten Sp">tenn</div>
                        <div class="moTa Sp">size : M</div>
                    </div>
                    <div class="nua">
                        <div class="nuanuanua Sp">Đơn giá</div> 
                        <div class="nuanuanua Sp">Số Lượng</div> 
                        <div class="nuanuanua Sp">Số Tiền</div> 
                        <div class="nuanuanua Sp">Xóa</div> 
                    </div>
                </div>
                <div class="phanGiuaCon">
                    <div class="nua">
                        <div class="checkbox Sp"><input class="cbox" type="checkbox" value="1" name="dssp"></div>
                        <div class="anh Sp">img</div>
                        <div class="ten Sp">tenn </div>
                        <div class="moTa Sp">size : M</div>
                    </div>
                    <div class="nua">
                        <div class="nuanuanua Sp">Đơn giá</div> 
                        <div class="nuanuanua Sp">Số Lượng</div> 
                        <div class="nuanuanua Sp">Số Tiền</div> 
                        <div class="nuanuanua Sp">Xóa</div> 
                    </div>
                </div>
            </div>
        </div>
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
        document.getElementById("trangThai1").style.display = "block";
        function loadData(n) {
            for (let i = 1; i <= 5; i++) {
                document.getElementById("" + i).style.color = "black";
                document.getElementById("" + i).style.borderBottom = "0px solid black";
                document.getElementById("trangThai" + i).style.display = "none";
            }
            document.getElementById("" + n).style.color = "#43d5b0";
            document.getElementById("" + n).style.borderBottom = "3px solid #43d5b0";
            document.getElementById("trangThai" + n).style.display = "block";
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
            for (let i of data) {
                loadWareHouse(i, n);
            }
            //document.querySelector("#trangThai" + n).innerHTML = html;
        }
        async function loadWareHouse(id_wh) {
            const response = await fetch("http://localhost:8080/LeoCris/truc_loadwarehouse", {
                method: "POST",
                headers: {
                    'Accept': 'application/json',
                },
                body: JSON.stringify({id_wh: id_wh}),

            });
            const jsonData = await response.json();
            return renderDataWH(jsonData);
            console.log(jsonData);
        }
        function renderDataWH(data) {
            return data.product_id;
        }
    </script>
</html>
