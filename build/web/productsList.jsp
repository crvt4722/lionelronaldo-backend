<%-- Document : productsList Created on : May 2, 2023, 5:13:30 PM Author : User --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh muc san pham</title>
        <link rel="stylesheet" href="css/danh-muc-san-pham/main.css">
        <script src="https://kit.fontawesome.com/f0add9272d.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    </head>

    <body>
        <div class="main container">

            <div class="danh-muc">
                <div class="bo-loc-tim-kiem">
                    <div class="bo-loc-title">
                        <i class="fa-solid fa-filter"></i> <span>BỘ LỌC TÌM KIẾM</span>
                    </div>
                    <div class="bo-loc-container">
                        <div class="tieu-chi-loc">
                            <div class="ten-tieu-chi">
                                Theo Danh Mục
                            </div>
                            <div class="tieu-chi-loc-chi-tiet">
                                <form action="">
                                    <input class="loc-text danhMucLoc" type="checkbox" id="danhMuc1" name="danhMuc1"
                                           value="1">
                                    <label for="danhMuc1"> Áo thể thao</label><br>
                                    <input class="loc-text danhMucLoc" type="checkbox" id="danhMuc2" name="danhMuc2"
                                           value="2">
                                    <label for="danhMuc2"> Quần thể thao</label><br>
                                    <input class="loc-text danhMucLoc" type="checkbox" id="danhMuc3" name="danhMuc3"
                                           value="4">
                                    <label for="danhMuc3"> Tất thể thao</label><br><br>
                                </form>
                            </div>
                        </div>

                        <div class="tieu-chi-loc">
                            <div class="ten-tieu-chi">
                                Khoảng Giá
                            </div>
                            <div class="tieu-chi-loc-chi-tiet">
                                <div class="gia-tien-loc-text loc-text">
                                    <label for="" style="margin-left: 10px"> Tối thiểu</label>
                                    <label for="" style="margin-left: 30px"> Tối đa</label>
                                </div>
                                <div action="/WebApplication2/ProcessFilterByPrice">
                                    <div class="gia-tien-loc-container">

                                        <div class="gia-tien-loc">
                                            <input type="text" name="toiThieu" id=""
                                                   class="gia-tien-chi-tiet toi-thieu">
                                        </div>
                                        <div class="">
                                            <div class=""></div>
                                            <span>--</span>
                                        </div>
                                        <div class="gia-tien-loc">
                                            <input type="text" name="toiDa" id="" class="gia-tien-chi-tiet toi-da">
                                        </div>
                                    </div>

                                    <button type="" class="ap-dung-btn" onclick="handleFilterByPrice()">ÁP
                                        DỤNG</button>
                                </div>
                            </div>

                        </div>

                        <div class="tieu-chi-loc">
                            <div class="ten-tieu-chi">
                                Đánh Giá
                            </div>
                            <div class="tieu-chi-loc-chi-tiet">
                                <form action="">
                                    <div class="danh-gia-chi-tiet loc-text">
                                        <input hidden type="text" name="" id="" class="so-sao-danh-gia" value="5">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div>
                                    <div class="danh-gia-chi-tiet loc-text">
                                        <input hidden type="text" name="" id="" class="so-sao-danh-gia" value="4">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <span> trở lên</span>
                                    </div>
                                    <div class="danh-gia-chi-tiet loc-text">
                                        <input hidden type="text" name="" id="" class="so-sao-danh-gia" value="3">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <span> trở lên</span>

                                    </div>
                                    <div class="danh-gia-chi-tiet loc-text">
                                        <input hidden type="text" name="" id="" class="so-sao-danh-gia" value="2">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <span> trở lên</span>
                                    </div>

                                    <div class="danh-gia-chi-tiet loc-text">
                                        <input hidden type="text" name="" id="" class="so-sao-danh-gia" value="1">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <span> trở lên</span>
                                    </div>

                                    <div class="danh-gia-chi-tiet loc-text">
                                        <input hidden type="text" name="" id="" class="so-sao-danh-gia" value="0">
                                        <i class="fa-regular fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <i class="fa-regular fa-star"></i>
                                        <span> trở lên</span>
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="danh-muc-chinh">
                    <div class="banner">
                        <img src="img/banner.jpg" alt="alt" />
                    </div>
                    <div class="sap-xep-container">
                        <div class="sap-xep__tieu-de"></div>
                        <div class="tieu-chi-sap-xep">Liên quan</div>
                        <div class="tieu-chi-sap-xep">Mới nhất</div>
                        <div class="tieu-chi-sap-xep">Bán chạy</div>
                        <div class="tieu-chi-sap-xep">Giá: Thấp đến cao</div>
                        <div class="tieu-chi-sap-xep">Giá: Cao đến thấp</div>
                    </div>
                    <div class="danh-sach-danh-muc-san-pham">
                        <!--                        <div class="san-pham">
                                                <div class="san-pham-body">
                                                    <div class="san-pham__hinh-anh">
                                                        <div class="crop">
                                                            <img src="https://minhhaisport.vn/wp-content/uploads/2022/07/Iceman-xanh-ngoc-KMST220320-570x483.jpg"
                                                                 alt="">
                                                        </div>
                                                    </div>
                                                    <div class="san-pham__noi-dung">
                                                        <div class="ten-san-pham">
                                                            Giày bóng đá nam Superifly 9 Air_Dòng ôm chân
                    
                                                        </div>
                                                        <div class="gia-san-pham">
                                                            <div class="gia-cu">₫ 250.000</div>
                                                            <div class="gia-hien-tai">₫140.600</div>
                                                        </div>
                                                        <div class="danh-gia-san-pham">
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star"></i>
                                                            <i class="fa-solid fa-star-half-stroke"></i>
                                                        </div>
                                                        <span class="so-luong-da-ban">
                                                            Đã bán 10.8k
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>-->


                    </div>
                </div>
            </div>
        </div>
        <script src="javascript/danh-muc-san-pham/index.js"></script>
        <script src="javascript/danh-muc-san-pham/handleEvent.js"></script>


    </body>

</html>