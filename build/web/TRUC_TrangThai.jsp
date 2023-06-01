<%-- Document : TRUC_Cart Created on : May 27, 2023, 4:38:35 PM Author : hi --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Trạng Thái</title>
            <link rel="stylesheet" href="assets/css/TRUC_GioHang1.css">
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        </head>

        <body>
            <div style="margin-bottom: 300px">
                <div class="thanhTrangThai">
                    <div class="trangThai" onclick="loadTrangThai(1)" id="1">Giỏ Hàng</div>
                    <div class="trangThai" onclick="loadTrangThai(2)" id="2">Chờ Xác Nhận</div>
                    <div class="trangThai" onclick="loadTrangThai(3)" id="3">Đang Giao</div>
                    <div class="trangThai" onclick="loadTrangThai(4)" id="4">Đơn Đã Hủy</div>
                    <div class="trangThai" onclick="loadTrangThai(5)" id="5">Lịch Sử Mua Hàng</div>
                </div>
                <div class="noiDung" id="trangThai1">
                    <form method="GET" class="form-mua-hang">
                        <div class="danh-sach-mua-hang">

                        </div>
                        <button type="submit">MUA</button>
                    </form>

                </div>
                <div class="noiDung" id="trangThai2"></div>
                <div class="noiDung" id="trangThai3"></div>
                <div class="noiDung" id="trangThai4"></div>
                <div class="noiDung" id="trangThai5"></div>
            </div>
        </body>
        <script>
            loadListOrder();
            let LO;
            loadTrangThai(1);
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
            function loadListOrder() {
                $.ajax({
                    url: 'http://localhost:8080/LeoCris/truc_loadlistorder',
                    type: 'GET',
                    data: {},
                    success: function (data) {
                        console.log(data);
                        LO = data;
                        renderListOrder(data);

                    }
                });
            }
            function renderListOrder(listOrder) {

                let html1 =
                    "<div class='phanDau'>" +
                    "<div class='nua'>" +
                    "<div class='nuanua'><input class='cbox' type='checkbox' value='1' name='dssp'></div>" +
                    "<div class='nuanua'>Sản Phẩm</div>" +
                    "</div>" +
                    "<div class='nua'>" +
                    "<div class='motphantu Sp'>Đơn giá</div>" +
                    "<div class='motphantu Sp'>Số Lượng</div>" +
                    "<div class='motphantu Sp'>Số Tiền</div>" +
                    "<div class='motphantu Sp'>Xóa</div>" +
                    "</div>" +
                    "</div>";
                let html2 = '';
                let html3 = '';
                let html4 = '';
                let html5 = '';
                let dss = [
                    'Giỏ hàng',
                    'Chờ xác nhận',
                    'Đang giao',
                    'Đơn đã hủy',
                    'Đã giao'
                ];

                for (let order of listOrder) {
                    if (order.deliveryStatus === dss[0]) {
                        html1 +=
                            "<div class='phanGiua'>" +
                            "<div class='nua'>" +
                            "<div class='checkbox Sp'><input class='cbox' type='checkbox' name='danhsachmua' value='" + order.orderId + "'></div>" +
                            "<div class='anh Sp'> <img class='anhsp' src='" + order.p.imageLinks[0] + "'></div>" +
                            "<div class='ten Sp'>" + order.p.name + "</div>" +
                            "<div class='moTa Sp'>size : " + order.wh.size + "</div>" +
                            "</div>" +
                            "<div class='nua'>" +
                            "<div class='motphantu Sp'>" +
                            "<div class='chuGach'>₫" + order.p.originPrice + "</div>&nbsp;&nbsp;&nbsp;₫" +
                            order.p.price +
                            "</div>" +
                            "<div class='motphantu Sp'>" + order.quantity + "</div>" +
                            "<div class='motphantu Sp'>" + order.quantity * order.p.price + "</div>" +
                            "<div class='motphantu Sp'><button class='nut' onclick='xoa()'>Xóa</button></div>" +
                            "</div>" +
                            "</div>";
                    } else if (order.deliveryStatus === dss[1]) {
                        html2 +=
                            "<div class='phanGiua'>" +
                            "<div class='anhCXN Sp'><img class='anhsp' src='" + order.p.imageLinks[0] + "'></div>" +
                            "<div class='moTaCXN Sp'>" +
                            order.p.name + ", " +
                            "Size: " + order.wh.size + ", " +
                            "Số lượng: " + order.quantity +
                            "</div>" +
                            "<div class='giaCXN Sp'>" +
                            "<div class='chuGach'>₫" + order.p.originPrice * order.quantity + "</div>&nbsp;&nbsp;&nbsp;₫" +
                            order.p.price * order.quantity +
                            "</div>" +
                            "<div class='huyDonCXN Sp'><button class='nut' onclick='huyDon()'>Hủy Đơn</button></div>" +
                            "</div>";

                    } else if (order.deliveryStatus === dss[2]) {
                        html3 +=
                            "<div class='phanGiua'>" +
                            "<div class='anhCXN Sp'><img class='anhsp' src='" + order.p.imageLinks[0] + "'></div>" +
                            "<div class='moTaCXN Sp'>" +
                            order.p.name + ", " +
                            "Size: " + order.wh.size + ", " +
                            "Số lượng: " + order.quantity +
                            "</div>" +
                            "<div class='giaCXN Sp'>" +
                            "<div class='chuGach'>₫" + order.p.originPrice * order.quantity + "</div>&nbsp;&nbsp;&nbsp;₫" +
                            order.p.price * order.quantity +
                            "</div>" +
                            "<div class='huyDonCXN Sp'><button class='nut' onclick='daNhanHang()'>Đã nhận hàng</button></div>" +
                            "</div>";

                    } else if (order.deliveryStatus === dss[3]) {
                        html4 +=
                            "<div class='phanGiua'>" +
                            "<div class='anhCXN Sp'><img class='anhsp' src='" + order.p.imageLinks[0] + "'></div>" +
                            "<div class='moTaCXN Sp'>" +
                            order.p.name + ", " +
                            "Size: " + order.wh.size + ", " +
                            "Số lượng: " + order.quantity +
                            "</div>" +
                            "<div class='giaCXN Sp'>" +
                            "<div class='chuGach'>₫" + order.p.originPrice * order.quantity + "</div>&nbsp;&nbsp;&nbsp;₫" +
                            order.p.price * order.quantity +
                            "</div>" +
                            "<div class='huyDonCXN Sp'><button class='nut' onclick='muaLai()'>Mua Lại</button></div>" +
                            "</div>";
                    } else if (order.deliveryStatus === dss[4]) {
                        html5 +=
                            "<div class='phanGiua'>" +
                            "<div class='anhCXN Sp'><img class='anhsp' src='" + order.p.imageLinks[0] + "'></div>" +
                            "<div class='moTaCXN Sp'>" +
                            order.p.name + ", " +
                            "Size: " + order.wh.size + ", " +
                            "Số lượng: " + order.quantity +
                            "</div>" +
                            "<div class='giaCXN Sp'>" +
                            "<div class='chuGach'>₫" + order.p.originPrice * order.quantity + "</div>&nbsp;&nbsp;&nbsp;₫" +
                            order.p.price * order.quantity +
                            "</div>" +
                            "<div class='huyDonCXN Sp'><button class='nut' onclick='muaLai()'>Mua Lại</button></div>" +
                            "</div>";
                    }
                }
                html1 +=
                    "<div class='phanCuoi'>" +
                        "<div class='nua'>" +
                            "<div class='nua Sp'><input class='cbox' type='checkbox' value='1' name='dssp'>&nbsp;&nbsp;Chọn tất cả</div>" +
                            "<div class='nua Sp'><button class='nut' onclick='xoa()'>Xóa</button></div>" +
                        "</div>" +
                        "<div class='nua'>" +
                            "<div class='nua Sp'>"+
                                "<div class='nuaTren Sp' id='tongTien'></div>"+
                                "<div class='nuaTren Sp' id='tietKiem'></div>"+
                            "</div>" +
                            "<div class='nua Sp'><button class='nut' onclick='xoa()'>MUA</button></div>" +
                        "</div>" +
                    "</div>";
                document.querySelector("#trangThai1 .form-mua-hang .danh-sach-mua-hang").innerHTML = html1;
                document.querySelector("#trangThai2").innerHTML = html2;
                document.querySelector("#trangThai3").innerHTML = html3;
                document.querySelector("#trangThai4").innerHTML = html4;
                document.querySelector("#trangThai5").innerHTML = html5;
            }
        </script>
        <script>
            // xử lý checkboxs
            setTimeout(() => {
                let buyProductIds = [];
                let buyProductCheckboxs = document.querySelectorAll(".cbox");
                buyProductCheckboxs.forEach((checkbox) => {
                    checkbox.oninput = function () {
                        let tongTien = 0;
                        let tietKiem = 0;
                        let checkedProductElements = document.querySelectorAll('input[type="checkbox"]:checked');
                        buyProductIds = Array.from(checkedProductElements).map((item) => item.value);
                        for (let i of buyProductIds){
                            for (let order of LO){
                                if (String(order.orderId) === String(i)){
                                    tongTien += order.p.price * order.quantity;
                                    tietKiem += order.p.originPrice * order.quantity;
                                }
                            }
                            
                        }
                        tietKiem -= tongTien;
                        console.log("buyProductIds");
                        console.log(buyProductIds);
                        document.querySelector("#tongTien").innerHTML = "Tổng thanh toán :" + tongTien;
                        document.querySelector("#tietKiem").innerHTML = "Tiết kiệm :" + tietKiem;
                        console.log(LO);
                    };
                });
            }, 2000);

        </script>

        </html>