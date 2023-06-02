<%-- 
    Document   : lepcr-shop-danh-gia
    Created on : Jun 2, 2023, 2:52:55 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comment</title>
    <link rel="stylesheet" href="./css/leocr-shop-danh-gia/main.css">
    <script src="https://kit.fontawesome.com/f0add9272d.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>

<body>
    <div class="main">

        <div class="orders-list-container">
            <div class="order-item">
                OrderId = 3
                <button class="nut nut-chinh danh-gia-btn" onclick="handleResponse(this, 3)"> Đánh giá</button>
            </div>
            <div class="order-item">
                OrderId = 4
                <button class="nut nut-chinh danh-gia-btn" onclick="handleResponse(this, 4)"> Đánh giá</button>
            </div>
            <div class="order-item">
                OrderId = 5
                <button class="nut nut-chinh danh-gia-btn" onclick="handleResponse(this, 5)"> Đánh giá</button>
            </div>
            <div class="order-item">
                OrderId = 6
                <button class="nut nut-chinh danh-gia-btn" onclick="handleResponse(this, 6)"> Đánh giá</button>
            </div>
        </div>




        <div class="modal modal-comment">
            <div class="danh-gia khung">
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
                        <div class="nut tro-lai-btn">Trở lại</div>
                    </div>
                    <div class="hoan-thanh">
                        <div class="nut hoan-thanh-btn">Hoàn thành</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="./javascript/leocr-shop-danh-gia/handle-events.js"></script>
    <script src="./javascript/leocr-shop-danh-gia/handle-modal.js"></script>
</body>

</html>
