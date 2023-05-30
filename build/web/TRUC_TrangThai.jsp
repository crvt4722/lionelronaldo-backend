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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
    </head>
    <body>
        <div class="thanhTrangThai">
            <div class="trangThai" onclick="loadTrangThai(1)" id="1">Giỏ Hàng</div>
            <div class="trangThai" onclick="loadTrangThai(2)" id="2">Chờ Xác Nhận</div>
            <div class="trangThai" onclick="loadTrangThai(3)" id="3">Đang Giao</div>
            <div class="trangThai" onclick="loadTrangThai(4)" id="4">Đơn Đã Hủy</div>
            <div class="trangThai" onclick="loadTrangThai(5)" id="5">Lịch Sử Mua Hàng</div>
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
        loadTrangThai(1);
        loadListOrder();
        let htmlTrangThai1 = '';
        let htmlTrangThai2 = '';
        let htmlTrangThai3 = '';
        let htmlTrangThai4 = '';
        let htmlTrangThai5 = '';
        
        
        function loadTrangThai(n) {
            for (let i = 1; i <= 5; i++) {
                document.getElementById("" + i).style.color = "black";
                document.getElementById("" + i).style.borderBottom = "0px solid black";
                document.getElementById("trangThai" + i).style.display = "none";
            }
            document.getElementById("" + n).style.color = "#43d5b0";
            document.getElementById("" + n).style.borderBottom = "3px solid #43d5b0";
            document.getElementById("trangThai" + n).style.display = "block";
        }
        function loadListOrder(){
            $.ajax({
                url: 'http://localhost:8080/LeoCris/truc_loadlistorder',
                type: 'GET',
                data: {},
                success: function (data) { 
                    //console.log(data);
                    renderListOrder(data);
                    
                }
            });
        }
        function loadWareHouse(id_wh){
            $.ajax({
                url: 'http://localhost:8080/LeoCris/truc_loadwarehouse',
                type: 'GET',
                data: {id_wh : id_wh},
                success: function (data) { 
                    //console.log(data);
                    renderWareHouse(data);
                    
                }
            });
        }
        function loadProduct(id_p){
            $.ajax({
                url: 'http://localhost:8080/LeoCris/truc_loadproduct',
                type: 'GET',
                data: {id_p : id_p},
                success: function (data) { 
                    console.log(data);
                    renderProduct(data);
                    
                }
            });
        }
        function renderListOrder(listOrder){
            for (let order of listOrder){
                loadWareHouse(order.wareHouseID);
            }
        }
        function renderWareHouse(wareHouse){
            loadProduct(wareHouse.productId);
        }
        function renderProduct(product){
            
        }
        
    </script>
</html>
