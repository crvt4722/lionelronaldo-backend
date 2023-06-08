<%-- Document : TRUC_Cart Created on : May 27, 2023, 4:38:35 PM Author : hi --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trạng Thái</title>

        <link rel="stylesheet" href="assets/css/TRUC_GioHang.css">
        <link rel="stylesheet" href="./css/leocr-shop-danh-gia/main.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script><!-- comment -->
        <script src="https://kit.fontawesome.com/f0add9272d.js"></script>

    </head>

    <body>
        <div style="margin-bottom: 1500px">
            <div class="thanhTrangThai">
                <div class="trangThai" onclick="loadTrangThai(2)" id="2">Chờ Xác Nhận</div>
                <div class="trangThai" onclick="loadTrangThai(3)" id="3">Đang Giao</div>
                <div class="trangThai" onclick="loadTrangThai(4)" id="4">Đơn Đã Hủy</div>
                <div class="trangThai" onclick="loadTrangThai(5)" id="5">Lịch Sử Mua Hàng</div>
            </div>
            <div class="noiDung" id="trangThai1">

            </div>
            <div class="noiDung" id="trangThai2"></div>
            <div class="noiDung" id="trangThai3"></div>
            <div class="noiDung" id="trangThai4"></div>
            <div class="noiDung" id="trangThai5"></div>
        </div>
        <div class="modal modal-comment">
            <div class="danh-gia khung" >
                <div class="tieu-de-danh-gia">ĐÁNH GIÁ SẢN PHẨM</div>
                <div class="thong-tin-san-pham df">
                    <div class="f2 anh-san-pham">
                        <img src="https://i8.amplience.net/i/jpl/jd_615495_bl?w=408&h=408&fmt=webp" class="khung-anh"
                             alt="">
                    </div>
                    <div class="f6 thong-tin-chi-tiet">
                        <div class="ten-san-pham">
                            Lacoste Core Polo Shirt
                        </div>
                        <div class="thuong-hieu">
                            Thương hiêu: Adidas
                        </div>
                        <div class="phan-loai">
                            Size: XL <br> Số lượng: 15
                        </div>
                    </div>
                </div>
                <div class="phan-danh-gia-sao">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                </div>
                <div class="phan-comment">
                    <label for="">Comment</label><br>
                    <textarea type="text" name="address" id="" class="khung-input"
                              placeholder="Hãy chia sẻ những điều bạn thích về sản phâm này nhé..."></textarea>
                </div>



                <div class="hanh-dong">
                    <div class="tro-lai mr-4">
                        <div class="nut2 tro-lai-btn">Trở lại</div>
                    </div>
                    <div class="hoan-thanh">
                        <div class="nut2 hoan-thanh-btn">Hoàn thành</div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="./javascript/leocr-shop-danh-gia/handle-events.js"></script>
    <script src="./javascript/leocr-shop-danh-gia/handle-modal.js"></script>
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
                    let dss = [
                        'Giỏ hàng',
                        'Chờ xác nhận',
                        'Đang vận chuyển',
                        'Đã hủy',
                        'Giao hàng thành công'
                    ];
                    let LO;
                    loadTrangThai(2);

                    function loadTrangThai(n) {
                        for (let i = 2; i <= 5; i++) {
                            document.getElementById("" + i).style.color = "black";
                            document.getElementById("" + i).style.borderBottom = "0px solid black";
                            document.getElementById("trangThai" + i).style.display = "none";
                        }
                        document.getElementById("" + n).style.color = "#43d5b0";
                        document.getElementById("" + n).style.borderBottom = "3px solid #43d5b0";
                        document.getElementById("trangThai" + n).style.display = "block";
                        loadListOrder(n);
                    }
                    function loadListOrder(n) {
                        $.ajax({
                            url: 'http://localhost:8080/LeoCris/truc_loadlistorder',
                            type: 'GET',
                            data: {trangThai: dss[n - 1]},
                            success: function (data) {
                                console.log(data);
                                LO = data;
                                renderListOrder(data, n);

                            }
                        });
                    }
                    function renderListOrder(listOrder, n) {
                        let html2 = '';
                        let html3 = '';
                        let html4 = '';
                        let html5 = '';


                        for (let order of listOrder) {
                            if (n === 2) {
                                html2 +=
                                        "<div class='phanGiua'>" +
                                        "<div class='anhCXN Sp'><img class='anhsp' src='" + order.p.imageLinks[0] + "'></div>" +
                                        "<div class='moTaCXN Sp'>" +
                                        order.p.name + ", " +
                                        "Size: " + order.wh.size + ", " +
                                        "Số lượng: " + order.quantity +
                                        "</div>" +
                                        "<div class='giaCXN Sp'>" +
                                        "<div class='chuGach'>₫" + xuLyTien(order.p.originPrice * order.quantity) + "</div>&nbsp;&nbsp;&nbsp;₫" +
                                        xuLyTien(order.p.price * order.quantity) +
                                        "</div>" +
                                        "<div class='huyDonCXN Sp'><button class='nut' onclick='huyDon(" + order.orderId + ")'>Hủy Đơn</button></div>" +
                                        "</div>";

                            } else if (n === 3) {
                                html3 +=
                                        "<div class='phanGiua'>" +
                                        "<div class='anhCXN Sp'><img class='anhsp' src='" + order.p.imageLinks[0] + "'></div>" +
                                        "<div class='moTaCXN Sp'>" +
                                        order.p.name + ", " +
                                        "Size: " + order.wh.size + ", " +
                                        "Số lượng: " + order.quantity +
                                        "</div>" +
                                        "<div class='giaCXN Sp'>" +
                                        "<div class='chuGach'>₫" + xuLyTien(order.p.originPrice * order.quantity) + "</div>&nbsp;&nbsp;&nbsp;₫" +
                                        xuLyTien(order.p.price * order.quantity) +
                                        "</div>" +
                                        "<div class='huyDonCXN Sp'><button class='nut' onclick='nhanHang(" + order.orderId + ")'>Đã nhận</button></div>" +
                                        "</div>";

                            } else if (n === 4) {
                                html4 +=
                                        "<div class='phanGiua'>" +
                                        "<div class='anhCXN Sp'><img class='anhsp' src='" + order.p.imageLinks[0] + "'></div>" +
                                        "<div class='moTaCXN Sp'>" +
                                        order.p.name + ", " +
                                        "Size: " + order.wh.size + ", " +
                                        "Số lượng: " + order.quantity +
                                        "</div>" +
                                        "<div class='giaCXN Sp'>" +
                                        "<div class='chuGach'>₫" + xuLyTien(order.p.originPrice * order.quantity) + "</div>&nbsp;&nbsp;&nbsp;₫" +
                                        xuLyTien(order.p.price * order.quantity) +
                                        "</div>" +
                                        "<div class='huyDonCXN Sp'><button class='nut' onclick='muaLai(" + order.orderId + ")'>Mua Lại</button></div>" +
                                        "</div>";
                            } else if (n === 5) {
                                html5 +=
                                        "<div class='phanGiua'>" +
                                        "<div class='anhCXN Sp'><img class='anhsp' src='" + order.p.imageLinks[0] + "'></div>" +
                                        "<div class='moTaCXN Sp'>" +
                                        order.p.name + ", " +
                                        "Size: " + order.wh.size + ", " +
                                        "Số lượng: " + order.quantity +
                                        "</div>" +
                                        "<div class='giaCXN Sp'>" +
                                        "<div class='chuGach'>₫" + xuLyTien(order.p.originPrice * order.quantity) + "</div>&nbsp;&nbsp;&nbsp;₫" +
                                        xuLyTien(order.p.price * order.quantity) +
                                        "</div>" +
                                        "<div class='huyDonCXN Sp'><button class='nut2 nut' onclick='muaLai(" + order.orderId + ")'>Mua Lại";

                                if (order.comment === "") {
                                    html5 += '<button class="ml-2 nut nut-chinh danh-gia-btn" onclick="handleResponse(this, ' + order.orderId + ')"> Đánh giá</button>';
                                } else {
                                    html5 += `<button class="ml-2 nut nut-chinh">Đã đánh giá</button>`;
                                }


                                html5 += "</div>" +
                                        "</div>";
                            }
                        }
                        document.querySelector("#trangThai2").innerHTML = html2;
                        document.querySelector("#trangThai3").innerHTML = html3;
                        document.querySelector("#trangThai4").innerHTML = html4;
                        document.querySelector("#trangThai5").innerHTML = html5;
                    }
    </script>
    <script>
        
        function huyDon(id) {
            $.ajax({
                url: 'http://localhost:8080/LeoCris/truc_huydon',
                type: 'GET',
                //async : false,
                data: {id_order: id + ""},
                success: function (data) {
                    alert("Hủy thành công đơn này!");

                    loadListOrder(2);
                    //document.querySelector("#4").innerHTML = "Đơn đã hủy(1)";
                }
            });

        }
        function nhanHang(id) {
            $.ajax({
                url: 'http://localhost:8080/LeoCris/truc_nhanhang',
                type: 'GET',
                data: {id_order: id + ""},
                success: function (data) {
                    alert("Bạn đã nhận được hàng?");
                    loadListOrder(3);
                }
            });
        }
    </script>
</html>