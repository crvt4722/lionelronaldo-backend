<%@page import="model.Product" %>
<%@page import="java.util.ArrayList" %>
<%@page import="util.MoneyUtil" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Leocr shop</title>
        <link rel="stylesheet" href="./css/leocr-shop-detail/main.css">

        <script src="https://kit.fontawesome.com/f0add9272d.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        
        <link rel="stylesheet" type="text/css"  type="text/css" href="./assets/css/base.css">
        <link rel="stylesheet" type="text/css"  type="text/css" href="./assets/css/main.css">
        <link rel="stylesheet" type="text/css"  type="text/css" href="./assets/css/footer.css">
        <link rel="stylesheet" type="text/css" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
        <script src="./includes/include.js"></script>
        
        <style>
            .tim-kiem-container {
                margin: 0px 25px;
            }

            .goi-y-tim-kiem {
                background-color: #ffffff;
            }

            .goi-y-tim-kiem-item {
                padding: 8px 20px;
                border: 1px solid #43d5b0;
                border-top: 0;
                background-color: #ffffff;
            }
            a {
                text-decoration: none;
                color: black;
            }


            .goi-y-tim-kiem-item:hover {
                border-left: 3px solid #43d5b0;
                padding-left: 18px;
                background-color: #f2eded;
                cursor: pointer;
            }
        </style>
    </head>

    <body>
        <div class="header" w3-include-html="./includes/header.jsp"></div>
        <div id="nav">
            <form method="GET" action="/LeoCris/products">
                <div class="tim-kiem-container">
                    <div class="thanh-tim-kiem">
                        <input type="text" autocomplete="off" name="search" id="search-product" placeholder="Tìm kiếm..." value="<%= session.getAttribute("search")%>">
                    </div>
                    <div class="goi-y-tim-kiem info-box">
                        <!--                                    <div class="goi-y-tim-kiem-item"><a href="">hello</a></div>
                                                            <div class="goi-y-tim-kiem-item">hi</div>
                                                            <div class="goi-y-tim-kiem-item">hello world</div>-->
                    </div>
                </div>
            </form>
        </div>
        <div class="main df" style="margin-top: 120px">
            <div class="bo-loc">
                <div class="tieu-chi-loc loc-theo-gia">
                    <div class="bo-loc__tieu-de">
                        Khoảng Giá
                    </div>
                    <div class="khoang-gia-container df">
                        <div class="toi-thieu">
                            <span>Tối thiểu</span>
                            <input type="text" name="minPrice" class="nhap-so" id="" value="0">
                        </div>
                        <span class="gach-ngang">--</span>
                        <div class="toi-da">
                            <span>Tối đa</span>
                            <input type="text" name="maxPrice" class="nhap-so" id="" value="10.000.000">
                        </div>
                    </div>
                    <button class="nut nut-chinh nut-loc-gia">Áp dụng</button>
                </div>
                <br><br>
                <div class="tieu-chi-loc loc-theo-danh-gia">
                    <div class="bo-loc__tieu-de">
                        Đánh giá
                    </div>
                    <div class="loc-sao nam-sao">
                        <input hidden type="checkbox" name="minRating" id="rating-nam-sao" value="5">
                        <label for="rating-nam-sao">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>

                            <span>trở lên</span>
                        </label>
                    </div>
                    <div class="loc-sao bon-sao">
                        <input hidden type="checkbox" name="minRating" id="rating-bon-sao" value="4">
                        <label for="rating-bon-sao">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <span>trở lên</span>
                        </label>
                    </div>
                    <div class="loc-sao ba-sao">
                        <input hidden type="checkbox" name="minRating" id="rating-ba-sao" value="3">
                        <label for="rating-ba-sao">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <span>trở lên</span>
                        </label>
                    </div>
                    <div class="loc-sao hai-sao">
                        <input hidden type="checkbox" name="minRating" id="rating-hai-sao" value="2">
                        <label for="rating-hai-sao">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <span>trở lên</span>
                        </label>
                    </div>
                    <div class="loc-sao mot-sao">
                        <input hidden type="checkbox" name="minRating" id="rating-mot-sao" value="1">
                        <label for="rating-mot-sao">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <i class="fa-regular fa-star"></i>
                            <span>trở lên</span>
                        </label>
                    </div>
                    <div class="loc-sao chua-danh-gia">
                        <input hidden type="checkbox" name="minRating" id="rating-khong-sao" value="0">
                        <label for="rating-khong-sao">
                            <span>Chưa đánh giá</span>

                        </label>
                    </div>
                </div>
                <br><br>
                <div class="tieu-chi-loc loc-theo-gioi-tinh">
                    <div class="bo-loc__tieu-de">
                        Dành cho
                    </div>
                    <div class="gioi-tinh-container">
                        <input type="checkbox" name="productGender" id="product_gender1" value="1">
                        <label for="product_gender1">Nam</label><br>
                        <input type="checkbox" name="productGender" id="product_gender2" value="2">
                        <label for="product_gender2">Nữ</label><br>
                        <input type="checkbox" name="productGender" id="product_gender3" value="3">
                        <label for="product_gender3">Trẻ em</label>
                    </div>
                </div>
                <br><br>
                <div class="tieu-chi-loc loc-theo-hang">
                    <div class="bo-loc__tieu-de">
                        Hãng
                    </div>
                    <div class="loc-hang-container">
                        <input type="checkbox" name="brand" id="product_brand1" value="nike">
                        <label for="product_brand1">Nike</label><br>
                        <input type="checkbox" name="brand" id="product_brand2" value="adidas">
                        <label for="product_brand2">Adidas</label><br>
                        <input type="checkbox" name="brand" id="product_brand3" value="puma">
                        <label for="product_brand3">Puma</label>
                    </div>
                </div>
            </div>

            <div class="danh-muc-chinh">
                <div class="danh-muc-header">
                    <div class="banner-2">
                        <img src="./img/products/banner-2.png" alt="alt" style="display: block; width: 100%"/>
                    </div>

                    <div class="sap-xep df khung">
                        <div class="f1 sap-xep-title">
                            <i>Sắp xếp</i>
                        </div>
                        <div class="tieu-chi-sap-xep f2">
                            Bán chạy nhất
                        </div>
                        <div class="tieu-chi-sap-xep f2">
                            Ưu đãi lớn nhất
                        </div>
                        <div class="tieu-chi-sap-xep f2">
                            Giá: Từ thấp lên cao
                        </div>
                        <div class="tieu-chi-sap-xep f2">
                            Giá: Từ cao xuống thấp
                        </div>
                    </div>
                </div>
                <div class="danh-muc-body">
                    <div class="danh-sach-san-pham">

                        <% ArrayList<Product> arr = (ArrayList<Product>) request.getAttribute("productsList");
                        %>
                        <% if (arr != null) for (Product product : arr) {%>
                        <div class="san-pham-item">
                            <div class="san-pham-item__img cat-anh-san-pham">
                                <div class="anh-san-pham">
                                    <% ArrayList<String> imageLinks = product.getImageLinks();
                                    %>

                                    <% if (imageLinks.size() > 0) {%>
                                    <img class="anh-chinh" src="<%= imageLinks.get(0)%>"
                                         alt="">
                                    <img class="anh-phu" src="<%= imageLinks.get(1)%>"
                                         alt="">
                                    <% } else { %>
                                    <img class="anh-chinh"
                                         src="https://i8.amplience.net/i/jpl/jd_666930_a?qlt=92&w=750&h=957&v=1&fmt=auto"
                                         alt="">
                                    <img class="anh-phu"
                                         src="https://i8.amplience.net/i/jpl/jd_666930_b?qlt=92&w=750&h=957&v=1&fmt=auto"
                                         alt="">
                                    <% }%>
                                </div>
                            </div>
                            <div class="thong-tin-san-pham">
                                <a href="/LeoCris/product-detail?id=<%=product.getProductId() %>">
                                <div class="san-pham-item__ten">
                                    <%= product.getName()%>
                                </div>
                                </a>
                                <div class="df">
                                    <div class="san-pham-item__danh-gia f1">
                                        <span class="so-luong-danh-gia">
                                            <%=product.getNumberOfRating()%> lượt đánh giá
                                        </span>
                                        <br>

                                        <div class="so-sao-danh-gia">
                                            <% for (int i = 0; i < (int) product.getAvgRating();
                                                                                i++) { %>
                                            <i class="fa-solid fa-star"></i>
                                            <% } %>
                                            <% if (product.getAvgRating() - (int) product.getAvgRating() != 0) { %>
                                            <i
                                                class="fa-solid fa-star-half-stroke"></i>
                                            <% }%>
                                        </div>
                                        <span class="da-ban">Đã bán
                                            <%=product.getSoldQuantity()%>
                                        </span>
                                    </div>

                                    <div class="san-pham-item__gia f1">
                                        <span class="gia-goc">
                                            <%= MoneyUtil.toString(product.getOriginPrice())%> ₫
                                        </span>
                                        <br>
                                        <span class="gia-uu-dai">
                                            <%= MoneyUtil.toString(product.getPrice())%> ₫

                                        </span>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer-distributed" w3-include-html="./includes/footer.html"> </footer>
        <script src="./js/header.js"> </script>
        <script>
            includeHTML();
        </script>
        <script src="./javascript/leocr-shop-detail/handleEvent.js"></script>
    </body>

</html>