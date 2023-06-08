<%-- 
    Document   : product-payment
    Created on : May 30, 2023, 2:03:30 PM
    Author     : User
--%>

<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="util.MoneyUtil" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thanh toán</title>
        <link rel="stylesheet" href="./css/leocr-shop-order-payment/main.css">
        <script src="https://kit.fontawesome.com/f0add9272d.js"></script>

    </head>

    <body>
        <div class="main">
            <!-- thanh-toan-header: begin -->
            <div class="thanh-toan-header">
                <h3>LEO CRIS | Thanh toán</h3>
            </div>
            <!-- thanh-toan-header: end -->

            <!-- thanh-toan-body: begin -->

            <div class="thanh-toan-body">
                <!-- dia-chi-nhan-hang: begin -->


                <div class="dia-chi-nhan-hang khung">
                    <div class="tieu-de-nho"><i class="fa-solid fa-location-dot"></i> Địa chỉ nhận hàng</div>
                    <div class="dia-chi-khach-hang mt-12">
                        <b class="mr-4"><span class="ten-day-du">Nam Nguyen</span> <span
                                class="so-dien-thoai"><%= request.getAttribute("phone")%></span></b>
                        <span class="dia-chi-chi-tiet"> <%= request.getAttribute("address")%></span>
                        <span class="ml-12 thay-doi-dia-chi-link" style="cursor: pointer; color: #038b75; text-decoration: underline">Thay đổi</span>

                    </div>
                </div>
                <!-- dia-chi-nhan-hang: end -->

                <!-- danh-sach-san-pham: begin -->
                <% Product product = (Product) request.getAttribute("product");%>
                <div class="danh-sach-san-pham khung">
                    <!-- <div class="tieu-de-nho">Sản phẩm</div>
                    <div class="ten-shop mt-12">LEO CRIS SHOP</div> -->
                    <div class="mo-ta-san-pham-container">
                        <div class="tieu-de-mo-ta">
                            Sản phẩm
                            <div class="hr"></div>
                        </div>
                        <div class="df">
                            <div class="anh-mo-ta f1">
                                <img src="<%= product.getImageLinks().get(0)%>"
                                     alt="">
                            </div>
                            <div class="ten-san-pham f6">
                                <span style="font-size: 18px"> <%= product.getName()%></span>
                                <br>
                                <span style="opacity: 0.7">
                                    Hãng: <%= product.getBrand()%>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="kich-co-container">
                        <div class="tieu-de-mo-ta">
                            Loại
                            <div class="hr">

                            </div>
                        </div>
                        <div class="size-san-pham">
                            <%= (String) request.getAttribute("size")%>
                        </div>

                    </div>
                    <div class="don-gia-container">
                        <div class="tieu-de-mo-ta">
                            Đơn giá
                            <div class="hr"></div>
                        </div>
                        <div class="don-gia"><%= MoneyUtil.toString(product.getPrice())%> ₫</div>
                    </div>
                    <div class="so-luong-container">
                        <div class="tieu-de-mo-ta">
                            Số lượng
                            <div class="hr"></div>
                        </div>
                        <div class="so-luong">
                            <%= request.getAttribute("quantity")%>
                        </div>
                    </div>
                    <div class="thanh-tien-container">
                        <div class="tieu-de-mo-ta">
                            Thành tiền
                            <div class="hr"></div>
                        </div>
                        <div class="thanh-tien thanh-tien-value">
                            <%= MoneyUtil.toString((String) request.getAttribute("totalPrice"))%> ₫
                        </div>
                    </div>
                </div>
                <!-- danh-sach-san-pham: end -->

                <!-- giao-hang-san-pham-container: begin -->
                <div class="giao-hang-san-pham-container khung df">
                    <div class="f2 loi-nhan-container">
                        <label class="mr-4" for="">Lời nhắn: </label>
                        <input type="text" name="" id="" placeholder="Lưu ý cho người bán...">
                    </div>
                    <div class="f1">
                        <div class="van-chuyen">
                            <label for="van-chuyen" class="tieu-de-nho" style="font-size: 15px">Vận chuyển</label>

                            <select name="van-chuyen" id="phi-van-chuyen-select" value="20.000 ₫">
                                <option value="20.000 ₫" selected>Tiết kiệm</option>
                                <option value="50.000 ₫">Nhanh</option>
                                <option value="80.000 ₫">Hỏa tốc</option>
                            </select>
                        </div>
                        <br>
                        <div class="thanh-tien-container">
                            <label for="van-chuyen" class="tieu-de-nho">Thành tiền cho 2 sản phẩm</label>

                        </div>
                    </div>
                    <div class="tinh-tien f1">
                        <div class="phi-van-chuyen phi-van-chuyen-value">

                        </div><br><br>
                        <div class="tong-tien-khach-tra khach-hang-tra-value">

                        </div>
                    </div>
                </div>

                <!-- giao-hang-san-pham-container: end -->

                <!-- phuong-thuc-thanh-toan: begin -->

                <div class="phuong-thuc-thanh-toan-container khung">
                    <div class="chon-phuong-thuc df">
                        <div class="tieu-de f1">Chọn phương thức thanh toán</div>
                        <div class="f2 cac-phuong-thuc">
                            <span class="chon-phuong-thuc-item">Thanh toán trực tuyến</span>
                            <span class="chon-phuong-thuc-item">Thanh toán khi nhận hàng</span>
                        </div>
                    </div>
                    <div class="hr"></div>
                    <div class="phuong-thuc-thanh-toan-truc-tuyen df mt-12">

                        <div class="hinh-thuc-thanh-toan f2">
                            <div class="tieu-de-nho">Thanh toán trực tuyến</div>
                            <div class="tieu-de mt-12">Loại thẻ</div>
                            <select name="" id="">
                                <option value="">-- Chọn loại thẻ --</option>
                                <option value="">Visa / MasterCard / Amex / JCB</option>
                                <option value="">UnionPay - Creditcard</option>
                            </select>
                            <br><br>
                            <div class="tieu-de">Tên trên thẻ</div>
                            <input type="text" name="" id="">
                            <br><br>
                            <div class="tieu-de">Ngày hết hạn</div>
                            <input type="date" name="" id="">
                            <br><br>
                            <div class="tieu-de">Mã bảo mật CVC</div>
                            <input type="password" name="" id="">
                        </div>
                        <div class="" style="flex: 1.5">
                            <img class="anh-the-tin-dung" src="./img/credit-card.png" alt="">
                        </div>
                    </div>
                    <div class="phuong-thuc-thanh-toan-khi-nhan-hang mt-12" style="display: none">
                        <div class="df">
                            <div class="f1">
                                <span class="tieu-de-nho">Thanh toán khi nhận hàng</span>
                                Phí thu hộ:
                            </div>
                            <div class="f2">₫0 VNĐ. Ưu đãi về phí vận chuyển (nếu có) áp dụng cả với phí thu hộ.</div>
                        </div>
                    </div>
                    <div class="hr"></div>

                    <div class="hoa-don-san-pham">
                        <div class="df">
                            <div class="ten-thuoc-tinh-container">
                                <div class="ten-thuoc-tinh">Tổng tiền hàng</div>
                                <div class="ten-thuoc-tinh">Phí vận chuyển</div>
                                <br>
                                <div class="ten-thuoc-tinh">Tổng thanh toán</div>
                            </div>
                            <div class="gia-tri-thuoc-tinh-container">
                                <div class="gia-tri-thuoc-tinh"><%= MoneyUtil.toString((String) request.getAttribute("totalPrice"))%> ₫</div>
                                <div class="gia-tri-thuoc-tinh phi-van-chuyen-value"></div><br>
                                <div class="gia-tri-thuoc-tinh khach-hang-tra khach-hang-tra-value"></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-dat-hang-container">
                        <form action="/WebApplication2/post-order" method="POST" class="form-dat-hang">
                            <input hidden type="text" name="quantity" id="" value="<%= request.getAttribute("quantity")%>">                            
                            <input hidden type="text" name="productId" id="" value="<%= product.getProductId() %>">
                            <input hidden type="text" name="size" id="" value="<%= (String) request.getAttribute("size")%>">
                            <input hidden type="text" name="phone" id="" value="<%= request.getAttribute("phone")%>">
                            <input hidden type="text" name="address" id="" value="<%= request.getAttribute("address")%>">
                            <input hidden type="text" name="paymentMethod" id="" value="thanh toán trực tuyến">
                            <input hidden type="text" name="totalAmount" id="" value="1">

                            <button type="submit" class="nut dat-hang-btn" style="font-size: 16px">ĐẶT HÀNG</button>
                        </form>
                    </div>
                </div>
                <!-- phuong-thuc-thanh-toan: end -->
            </div>
            <!-- thanh-toan-body: end -->
            <!-- Modal thay đổi địa chỉ -->
            <div class="modal modal-thay-doi-dia-chi-container">
                <div class="thay-doi-dia-chi khung">
                    <div class="tieu-de-nho ml-12">CẬP NHẬT ĐỊA CHỈ</div>
                    <div class="hr"></div>

                    <div class="df ten-va-so-dien-thoai">
                        <div class="f1 cap-nhat-ten">
                            <label for="">Họ và tên</label><br>
                            <input type="text" name="fullname" id="" class="khung-input" value="Nam Nguyen">
                        </div>
                        <div class="f1 cap-nhat-so-dien-thoai">
                            <label for="">Số điện thoại</label><br>
                            <input type="text" name="phoneNumber" id="" class="khung-input" value="<%= request.getAttribute("phone")%>">
                        </div>
                    </div>

                    <div class="tinh-thanh-pho">
                        <label for="">Tỉnh/Thành phố, quận/huyện, phường/xã</label><br>
                        <input type="text" name="province" id="" class="khung-input">
                    </div>

                    <div class="dia-chi-container">
                        <label for="">Địa chỉ cụ thể</label><br>
                        <input type="text" name="address" id="" class="khung-input" value="<%= request.getAttribute("address")%>">
                    </div>

                    <div class="ban-do">
                        <img src="./img/products/map.png" alt="">
                    </div>

                    <div class="hanh-dong">
                        <div class="tro-lai mr-4">
                            <div class="nut tro-lai-btn">Trở lại</div>
                        </div>
                        <div class="hoan-thanh">
                            <div class="nut hoan-thanh-btn">Hoàn thành</div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal thay đổi địa chỉ -->
        </div>
        <script>
            let formDatHang = document.querySelector(".form-dat-hang");
            // let formQuantity = formDatHang.querySelector('[name="quantity"]');
            // let formSize = formDatHang.querySelector('[name="size"]');
            let formPhone = formDatHang.querySelector('[name="phone"]');
            let formAddress = formDatHang.querySelector('[name="address"]');
            let formPaymentMethod = formDatHang.querySelector('[name="paymentMethod"]');
            let formTotalAmount = formDatHang.querySelector('[name="totalAmount"]');

        </script>
        <script>


            // xử lý modal
            let troLaiElement = document.querySelector('.tro-lai-btn');
            let hoanThanhElement = document.querySelector('.hoan-thanh-btn');
            let openModalElement = document.querySelector('.thay-doi-dia-chi-link');
            let modal = document.querySelector('.modal');

            let updatePhone = document.querySelector('.modal .cap-nhat-so-dien-thoai input');
            let userPhone = document.querySelector('.dia-chi-khach-hang .so-dien-thoai');
            let userAddress = document.querySelector('.dia-chi-khach-hang .dia-chi-chi-tiet')
            let updateAddress = document.querySelector('.modal .dia-chi-container input');
            let userName = document.querySelector('.ten-day-du');
            let updateUserName = document.querySelector('.cap-nhat-ten input');

            // xử lý nếu phone và address bằng NULL
            if (userPhone.innerText.trim().length === 0) {
                modal.classList.add('open');
            }

            // 
            openModalElement.onclick = openModal;
            troLaiElement.onclick = closeModal;
            function openModal() {
                modal.classList.add('open');
            }
            function closeModal() {
                modal.classList.remove('open');
            }

            hoanThanhElement.onclick = function () {


                userPhone.innerText = updatePhone.value;
                formPhone.value = updatePhone.value;
                userAddress.innerText = updateAddress.value;
                formAddress.value = updateAddress.value;
                userName.innerText = updateUserName.value;
                closeModal();
            }
        </script>

        <script>
            let phuongThucThanhToanElements = document.querySelectorAll('.chon-phuong-thuc-item');
            let thanhToanTrucTuyenElement = document.querySelector('.phuong-thuc-thanh-toan-truc-tuyen');
            let thanhToanKhiNhanhangElement = document.querySelector('.phuong-thuc-thanh-toan-khi-nhan-hang');
            let thanhToanContainer = [thanhToanTrucTuyenElement, thanhToanKhiNhanhangElement];


            phuongThucThanhToanElements[0].style.color = '#038b75';
            phuongThucThanhToanElements[0].style.border = '1px solid #038b75';

            phuongThucThanhToanElements.forEach((phuongThuc, index) => {
                phuongThuc.onclick = function () {
                    phuongThucThanhToanElements.forEach((item) => {
                        item.style.color = "black";
                        item.style.border = '1px solid #ccc';
                    })
                    phuongThuc.style.color = '#038b75';
                    phuongThuc.style.border = '1px solid #038b75';

                    thanhToanContainer.forEach((thanhToan) => {
                        thanhToan.style.display = 'none';
                    })
                    if (index === 0) {
                        thanhToanContainer[index].style.display = 'flex'
                        formPaymentMethod.value = "Thanh toán trực tuyến";
                    } else {
                        thanhToanContainer[index].style.display = 'block'
                        formPaymentMethod.value = "Thanh toán khi nhận hàng";
                        
                    }
                }
            })

        </script>

        <script>
            // tính tiền dựa vào phí ship và tổng tiền hàng
            let xulyTien = (s) => {
                s = "" + s;
                s = s.split('.').join('')
                let res = '';
                let cnt = 0;
                for (let i = s.length - 1; i >= 0; i--) {
                    cnt++;
                    res += s[i];
                    if (cnt % 3 == 0 && i != 0)
                        res += '.';
                }
                res = res.split("").reverse().join("");
                return res;
            }
            let toNumber = (s) => {
                s = s.split("");
                let res = "";
                for (let x of s) {
                    if (Number.isInteger(+x))
                        res += x;
                }
                return +res;
            }
            let phiVanChuyenSelect = document.querySelector('#phi-van-chuyen-select');
            let phiVanChuyenElements = document.querySelectorAll('.phi-van-chuyen-value');
            let thanhTienElement = document.querySelector('.thanh-tien-value');
            let khachHangTraElements = document.querySelectorAll('.khach-hang-tra-value');

            khachHangTraElements.forEach((item) => {
                item.innerText = xulyTien(toNumber(thanhTienElement.innerText) + toNumber(phiVanChuyenSelect.value)) + ' ₫';

            })
            phiVanChuyenElements.forEach((phiVanChuyenText) => {
                phiVanChuyenText.innerHTML = phiVanChuyenSelect.value;

            })
            formTotalAmount.value = toNumber(thanhTienElement.innerText) + toNumber(phiVanChuyenSelect.value);
            phiVanChuyenSelect.oninput = function () {
                phiVanChuyenElements.forEach((phiVanChuyenText) => {
                    phiVanChuyenText.innerHTML = phiVanChuyenSelect.value;

                })
                khachHangTraElements.forEach((item) => {
                    item.innerText = xulyTien(toNumber(thanhTienElement.innerText) + toNumber(phiVanChuyenSelect.value)) + ' ₫';

                })
                formTotalAmount.value = toNumber(thanhTienElement.innerText) + toNumber(phiVanChuyenSelect.value)
            }
        </script>
    </body>

</html>