<%-- Document : TRUC_Cart Created on : May 27, 2023, 4:38:35 PM Author : hi --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ Hàng</title>

        <link rel="stylesheet" href="assets/css/TRUC_GioHang1.css">
        <link rel="stylesheet" href="./css/leocr-shop-danh-gia/main.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script><!-- comment -->
        <script src="https://kit.fontawesome.com/f0add9272d.js"></script>
        
        
    </head>

    <body>

        <div >
            <!--<div class="thanhTrangThai"></div>-->
            <div  class="noiDung" id="trangThai1"></div>
            <div style = 'margin-top : 300px; float: left' ></div>
            <form method="GET" action="/LeoCris/payment-from-cart">
                <div class='phanCuoi' >
                    <div class='nua'>
                        <div class='nua Sp'><input class='cboxAll' type='checkbox' value='1' name='dssp'>&nbsp;&nbsp;Chọn tất cả</div>
                        <div class='nua Sp'><button class='nut' onclick='xoaAll()'>Xóa</button></div>
                    </div>
                    <div class='nua'>
                        <div class='nua Pc Sp'>
                            <div class='tren' id='tongTien'>Tổng: ₫0</div><br>
                            <span class='duoi' id='tietKiem'>Tiết kiệm: ₫0</span>
                        </div>
                        <input hidden name="orderIds" id ="ord" value="1, 6">
                        <input hidden name="productIds" id ="prd" value="1, 6">
                        <input hidden name="sizes" id ="s" value="1, 6">
                        <input hidden name="quantities" id ="qtt" value="1, 6">

                        <div class='nua Sp'><button type="SUBMIT" class='nut mua'>MUA</button></div>
                    </div>
                </div>
            </form>
        </div>

    </body>
    <script>
        function xuLyTien(n) {
            let res = '', cnt = 1;
            n = "" + n;
            n = Array.from(n).filter(item => item !== '.').join('');
            for (let i = n.length - 1; i >= 0; i--) {
                res += n[i];
                if (cnt % 3 === 0 && i)
                    res += '.';
                cnt++;
            }
            return res.split("").reverse().join("");
        }

        let LO;
        loadListOrder(1);
        function loadListOrder() {
            $.ajax({
                url: '/LeoCris/truc_loadlistorder',
                type: 'GET',
                data: {trangThai: 'Giỏ hàng'},
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
                    "<div class='nuanua'><input class='cboxAll' type='checkbox' value='1' name='dssp'></div>" +
                    "<div class='nuanua'>Sản Phẩm</div>" +
                    "</div>" +
                    "<div class='nua'>" +
                    "<div class='motphantu Sp'>Đơn giá</div>" +
                    "<div class='motphantu Sp'>Số Lượng</div>" +
                    "<div class='motphantu Sp'>Số Tiền</div>" +
                    "<div class='motphantu Sp'>Xóa</div>" +
                    "</div>" +
                    "</div>";

            for (let order of listOrder) {
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
                        "<div class='chuGach'>₫" + xuLyTien(order.p.originPrice) + "</div>&nbsp;&nbsp;&nbsp;₫" +
                        xuLyTien(order.p.price) +
                        "</div>" +
                        "<div class='motphantu Sp'>" + order.quantity + "</div>" +
                        "<div class='motphantu Sp'>₫" + xuLyTien(order.quantity * order.p.price) + "</div>" +
                        "<div class='motphantu Sp'><button class='nut' onclick='xoa(" + order.orderId + ")'>Xóa</button></div>" +
                        "</div>" +
                        "</div>";
            }


            cbGioHang();

            document.querySelector("#trangThai1").innerHTML = html1;
        }
    </script>
    <script>
        function cbGioHang() {
            setTimeout(() => {
                let buyProductIds = [];
                let buyProductCheckboxs = document.querySelectorAll(".cbox");
                buyProductCheckboxs.forEach((checkbox) => {
                    checkbox.onchange = function () {
                        buyProductCheckboxsAll.forEach((item) => {
                            item.checked = false;
                        });
                        let checkedProductElements = document.querySelectorAll('input[type="checkbox"]:checked');
                        if (checkedProductElements.length === buyProductCheckboxs.length) {
                            buyProductCheckboxsAll.forEach((item) => {
                                item.checked = true;
                            });
                        }
                        buyProductIds = Array.from(checkedProductElements).map((item) => item.value);// chuyen mang
                        tinhTien(buyProductIds);

                    };
                });
                let buyProductCheckboxsAll = document.querySelectorAll(".cboxAll");
                buyProductCheckboxsAll.forEach((checkboxAll) => {
                    checkboxAll.oninput = function () {
                        if (checkboxAll.checked) {
                            buyProductCheckboxs.forEach((item) => {
                                item.checked = true;
                            });
                            buyProductCheckboxsAll.forEach((item) => {
                                item.checked = true;
                            });
                        } else {
                            buyProductCheckboxs.forEach((item) => {
                                item.checked = false;
                            });
                            buyProductCheckboxsAll.forEach((item) => {
                                item.checked = false;
                            });

                        }
                        let checkedProductElements = document.querySelectorAll('input[type="checkbox"]:checked');
                        buyProductIds = Array.from(checkedProductElements).map((item) => item.value);// chuyen mang
                        tinhTien(buyProductIds);
                        //tinhTien(buyProductIds);
                    };
                });

            }, 0500);
        }
        function tinhTien(buyProductIds) {
            let tongTien = 0;
            let tietKiem = 0;
            let listIdOrdMua = [];
            let listIdPrdMua = [];
            let listSizesMua = [];
            let listQuantitiesMua = [];
            let soSanPham = buyProductIds.length;
            for (let i of buyProductIds) {
                for (let order of LO) {
                    if (String(order.orderId) === String(i)) {
                        listIdOrdMua +=  String(order.orderId) + ",";
                        listIdPrdMua +=  String(order.p.productId) + ",";
                        listSizesMua +=  String(order.wh.size) + ",";
                        listQuantitiesMua +=  String(order.quantity) + ",";
                        tongTien += order.p.price * order.quantity;
                        tietKiem += order.p.originPrice * order.quantity;
                    }
                }

            }
            tietKiem -= tongTien;
            console.log("buyProductIds");
            console.log(buyProductIds);
            document.querySelector("#tongTien").innerHTML = "Tổng :₫" + xuLyTien(tongTien);
            document.querySelector("#tietKiem").innerHTML = "Tiết kiệm :₫" + xuLyTien(tietKiem) + " (" + soSanPham + " mặt hàng)";
            document.querySelector("#ord").value = listIdOrdMua;
            document.querySelector("#prd").value = listIdPrdMua;  
            document.querySelector("#s").value = listSizesMua;
            document.querySelector("#qtt").value = listQuantitiesMua;
            console.log(LO);
        }
    </script>
    <script>
        function xoa(id) {
            $.ajax({
                url: '/LeoCris/truc_xoaorder',
                type: 'GET',
                data: {id_order: id + ""},
                success: function (data) {
                    alert("Xóa thành công đơn này!");
                    loadListOrder(1);
                }
            });
        }
        function xoaAll() {
            let cboxx = document.querySelectorAll(".cbox");
            for (let i = 0; i < cboxx.length; i++) {
                if (cboxx[i].checked === true) {
                    $.ajax({
                        url: '/LeoCris/truc_xoaorder',
                        type: 'GET',
                        data: {id_order: cboxx[i].value + ""},
                        success: function (data) {
                        }
                    });
                }
            }
            alert("Xóa thành công những đơn này!");
            loadListOrder(1);
            //alert("Xóa thành công những đơn này!");
            //loadListOrder(1);
        }
        function mua() {
            let cboxx = document.querySelectorAll(".cbox");
            for (let i = 0; i < cboxx.length; i++) {
                if (cboxx[i].checked === true) {
                    $.ajax({
                        url: '/LeoCris/truc_xoaorder',
                        type: 'GET',
                        data: {id_order: cboxx[i].value + ""},
                        success: function (data) {
                        }
                    });
                }
            }
            alert("Xóa thành công những đơn này!");
            loadListOrder(1);
            //alert("Xóa thành công những đơn này!");
            //loadListOrder(1);
        }
        

    </script>
</html>