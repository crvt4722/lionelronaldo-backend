<%@page import="model.Product" %>
<%@page import="model.CustomerResponse" %>
<%@page import="java.util.ArrayList" %>
<%@page import="util.MoneyUtil" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết sản phẩm</title>
        <link rel="stylesheet" href="./css/leocr-shop-product-detail/main.css">
        <link rel="stylesheet" href="./css/seach-bar/main.css">
        <script src="https://kit.fontawesome.com/f0add9272d.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    </head>

    <body>

        <div id="nav">
            <form method="GET" action="/LeoCris/products">
                <div class="tim-kiem-container">
                    <div class="thanh-tim-kiem">
                        <input type="text" autocomplete="off" name="search" id="search-product" placeholder="Tìm kiếm..." value="<%= session.getAttribute("search") != null ? session.getAttribute("search") : "" %>">
                    </div>
                    <div class="goi-y-tim-kiem info-box">
                        <!--                                    <div class="goi-y-tim-kiem-item"><a href="">hello</a></div>
                                                            <div class="goi-y-tim-kiem-item">hi</div>
                                                            <div class="goi-y-tim-kiem-item">hello world</div>-->
                    </div>
                </div>
            </form>
        </div>
        <div class="main">
            <div class="banner-nho">
                <img src="./img/products/banner-2.png" alt="alt" style="width: 100%"/>

            </div>
            <div class="phan-chinh df khung-thong-tin">
                <% Product product = (Product) request.getAttribute("productDetail"); %>
                <div class="chi-tiet-san-pham f2 df">
                    <div class="danh-sach-anh-san-pham">
                        <% for (String x : product.getImageLinks()) {%>
                        <img class="anh-san-pham__img anh-phu"
                             src="<%= x%>" alt="">
                        <% }%>
                    </div>
                    <div class="anh-chinh">
                        <img class="anh-san-pham__img"
                             src="<%=product.getImageLinks().get(0)%>" alt="">
                    </div>
                </div>
                <div class="thong-tin-dat-hang f1">
                    <div class="ten-san-pham" style="font-family: Arial, sans-serif;">
                        <%= product.getName()%>
                    </div>
                    <div class="gia-tien-san-pham mt-12">
                        <span class="gia-goc"><%= MoneyUtil.toString(product.getOriginPrice())%> ₫</span>
                        <span class="gia-uu-dai"><%= MoneyUtil.toString(product.getPrice())%> ₫</span>
                    </div>
                    <div class="danh-gia-san-pham df mt-12">
                        <div class="so-sao f1">
                            <span class="mr-2"><%= product.getAvgRatingString()%> </span>
                            <% for (int i = 0; i < (int) product.getAvgRating(); i++) { %>
                            <i class="fa-solid fa-star"></i>
                            <% } %>
                            <% if (product.getAvgRatingString().length() > 1) { %>
                            <i class="fa-solid fa-star-half-stroke"></i>
                            <% }%>
                        </div>
                        <div class="so-danh-gia f1">
                            <%= product.getNumberOfRating()%> đánh giá
                        </div>
                        <div class="so-da-ban f1">
                            <%= product.getSoldQuantity()%> đã bán
                        </div>
                    </div>
                    <h4 class="mt-24">Chọn size</h4>
                    <div class="kich-co-san-pham">
                        <% for (String size : product.getSizes()) {%>
                        <div class="chon-size"><%= size%></div>
                        <% }%>
                    </div>
                    <div class="so-luong-mua mt-24">
                        <h4>Số lượng</h4>
                        <div class="df">
                            <div class="chon-so-luong mt-12 f1">
                                <div class="nut nut-giam"><i class="fa-solid fa-minus"></i></div>
                                <div class="nut so-luong-text">1</div>
                                <div class="nut nut-tang"><i class="fa-solid fa-plus"></i></div>
                            </div>
                            <div class="so-luong-con-lai-trong-kho mt-24 f2 ml-6">
                                <!--                                334112 sản phẩm có sẵn-->
                                <input hidden type="text" class="so-luong-con-lai-trong-kho-value" value="<%=product.getAvailableQuantityInWarehouse().get(0)%>"></input>
                                <% for (int availableQuantity : product.getAvailableQuantityInWarehouse()) {%>
                                <div class="so-luong-trong-kho"><%= availableQuantity%> sản phẩm có sẵn</div>  
                                <% }%>
                            </div>
                        </div>
                    </div>
                    <div class="hanh-dong mt-24">
                        <div class="giao-hang-tiet-kiem">
                            <img src="./img/truck.svg" alt="" style="max-width: 45px;">
                            <span class="ml-12">Giao hàng siêu tiết kiệm</span>
                        </div>
                        <div class="hanh-dong__them-vao-gio-hang mt-24">
                            <form action="" method="GET">
                                <input hidden type="text" class="chon-size-input" name="size" value="">
                                <input hidden type="number" name="quantity" class="so-luong-dat-san-pham">
                                <input hidden type="text" name="productId" class="" value="<%= product.getProductId()%>"> 
                                <div class="df">
                                    <button type="submit" class="nut them-vao-gio-hang-btn f1">
                                        Thêm vào giỏ hàng
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="hanh-dong__mua-ngay mt-12">
                            <form action="/LeoCris/payment" method="GET">
                                <input hidden type="text" class="chon-size-input" name="size" value="">
                                <input hidden type="number" name="quantity" class="so-luong-dat-san-pham">                                
                                <input hidden type="text" name="productId" class="" value="<%= product.getProductId()%>">

                                <div class="df">
                                    <button type="submit" class="nut mua-ngay-btn f1">
                                        MUA NGAY
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Thông tin sp và sp liên quan -->
            <div class="thong-tin-va-san-pham-lien-quan df">
                <div class="thong-tin-san-pham khung-thong-tin">
                    <b>THÔNG TIN SẢN PHẨM</b><br><br>
                    <%= product.getDescription()%>
                    <!--                    <b>Mô tả</b>
                                        <p>Show your support for the Los Blancos with this men's Real Madrid 2022/23 Home Shirt. Coming in the
                                            classic White colourway, this standard-fit shirt is made from a lightweight poly fabric with a
                                            smooth feel for all-day wear. It features a button placket with a spread collar and short sleeves
                                            for a classic look. With the 3-Stripes to the shoulders, this shirt is finished with the Badge of
                                            Sport and Real Madrid crest to the chest. Machine washable.|HF0291
                                        </p><br>
                                        <p>
                                            <b>Care & Material</b><br>
                                            100% Recycled Polyester<br><br>
                                            <b>Colour:</b><br>
                                            White
                                            Product Code: 16492314/533562
                                        </p>-->

                </div>
                <div class="san-pham-ban-chay khung-thong-tin ml-12">
                    <img src="https://cdn.britannica.com/94/193794-050-0FB7060D/Adidas-logo.jpg" alt="alt" />
                </div>
            </div>

            <!-- comment, like: begin -->
            <div class="comment-va-like khung-thong-tin">
                <h3 class="mb-20">ĐÁNH GIÁ SẢN PHẨM</h3>
                <div class="phan-hoi-khach-hang-container">
                    <% for (CustomerResponse productResponse : (ArrayList<CustomerResponse>) request.getAttribute("productResponses")) {%>

                    <div class="phan-hoi-khach-hang df">
                        <div class="f1 avatar">
                            <img src="https://i.pinimg.com/originals/c6/e5/65/c6e56503cfdd87da299f72dc416023d4.jpg" alt="">
                        </div>
                        <div class="f10">
                            <div class="ten-user"><%= productResponse.getUserName()%></div>
                            <div class="so-sao-danh-gia">
                                <% for (int i = 0; i < (int) productResponse.getRating(); i++) { %>
                                <i class="fa-solid fa-star"></i>
                                <% }%>
                            </div>
                            <div class="thoi-gian-phan-hoi">
                                <%= productResponse.getResponseTime()%>
                            </div>
                            <div class="comment-user">
                                <%= productResponse.getComment()%>
                            </div>
                        </div>
                    </div>
                    <div class="hr"></div>

                    <% } %>

                </div>
            </div>
            <!-- comment, like: end -->

            <!-- sản phẩm liên quan: begin -->

            <div class="danh-muc-lien-quan khung-thong-tin mt-20" style="margin-bottom: 0px;">
                <% ArrayList<Product> relatedProducts = (ArrayList<Product>) request.getAttribute("relatedProducts"); %>
                <% for (Product relatedProduct : relatedProducts) {%>
                <div class="danh-muc-lien-quan__item">
                    <div class="danh-muc-lien-quan__anh">
                        <img src="<%= relatedProduct.getImageLinks().get(0)%>" alt="">
                    </div>
                    <div class="thong-tin-danh-muc-lien-quan">
                        <a href="/LeoCris/product-detail?id=<%= relatedProduct.getProductId()%>" target="_blank">
                            <div class="ten-san-pham-lien-quan"><%= relatedProduct.getName()%></div>
                        </a>
                        <div class="df">
                            <div class="f1">
                                <div class="danh-gia-san-pham-lien-quan">

                                    <div class="so-luot-danh-gia-san-pham-lien-quan"><%= relatedProduct.getNumberOfRating()%> lượt đánh giá</div>
                                    <div class="so-sao-san-pham-lien-quan">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star-half-stroke"></i>
                                    </div>
                                    <div class="so-luong-da-ban-san-pham-lien-quan">Đã bán <%= relatedProduct.getSoldQuantity()%></div>
                                </div>
                            </div>
                            <div class="f1">
                                <div class="gia-san-pham-lien-quan">
                                    <div class="gia-goc-san-pham-lien-quan">
                                        <%= MoneyUtil.toString(relatedProduct.getOriginPrice())%> ₫
                                    </div>
                                    <div class="gia-uu-dai-san-pham-lien-quan">
                                        <%= MoneyUtil.toString(relatedProduct.getPrice())%> ₫
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% }%>


            </div>
            <!-- sản phẩm liên quan: end -->
            <div class="df">
                <button class="nut nut-xem-them f1">Xem thêm</button>
            </div>
            <div class="df">
                <button class="nut nut-thu-gon f1">Thu gọn</button>
            </div>

            <div  style="margin-bottom: 60px;"></div>
        </div>

        <script src="javascript/search-bar/index.js"></script>
        <script>
            let anhPhuElements = document.querySelectorAll('.anh-phu');
            let anhChinhElement = document.querySelector('.anh-chinh .anh-san-pham__img');
            anhPhuElements.forEach((anhPhuElement) => {
                anhPhuElement.onmouseover = function () {
                    anhChinhElement.setAttribute("src", anhPhuElement.getAttribute("src"))
                }
            })

        </script>
        <script>
            // script nút mở rộng/thu gọn sản phẩm liên quan
            let nutXemThemElement = document.querySelector('.nut-xem-them');
            let nutThuGonElement = document.querySelector('.nut-thu-gon');
            let danhMucLienQuanElement = document.querySelector('.danh-muc-lien-quan')

            nutThuGonElement.style.display = 'none';
            nutXemThemElement.onclick = function () {
                danhMucLienQuanElement.style.maxHeight = '20000px';
                nutThuGonElement.style.display = 'block';
                nutXemThemElement.style.display = 'none';
            }
            nutThuGonElement.onclick = function () {
                danhMucLienQuanElement.style.maxHeight = '350px';
                nutXemThemElement.style.display = 'block';
                nutThuGonElement.style.display = 'none';
            }
        </script>



        <script>
            let chonSizeElements = document.querySelectorAll('.kich-co-san-pham .chon-size');
            let chonSizeInputElements = document.querySelectorAll('.chon-size-input');
            let soLuongTrongKhoElements = document.querySelectorAll('.so-luong-trong-kho');
            soLuongTrongKhoElements.forEach((item) => {
                item.style.display = 'none';
            })

            chonSizeElements.forEach((chonSize, index) => {
                chonSize.onclick = function () {
                    chonSizeElements.forEach((item) => {
                        item.style.color = 'black';
                        item.style.backgroundColor = '#fff';
                    })
                    chonSize.style.color = 'white';
                    chonSize.style.backgroundColor = '#000';
                    chonSizeInputElements.forEach((chonSizeInput) => {
                        chonSizeInput.value = chonSize.innerText.trim();
                    })
                    soLuongTrongKhoElements.forEach((item) => {
                        item.style.display = 'none';
                    })
                    soLuongTrongKhoElements[index].style.display = 'block';
                    document.querySelector('.so-luong-con-lai-trong-kho-value').value = soLuongTrongKhoElements[index].innerText.trim().split(" ")[0];
                }
            })
        </script>

        <script>
            // xử lý tăng giảm số lượng
            let nutTangSoLuongSP = document.querySelector('.nut-tang');
            let nutGiamSoLuongSP = document.querySelector('.nut-giam');
            let soLuongDatSanPhamInputElements = document.querySelectorAll('.so-luong-dat-san-pham');
            let soLuongDatSanPhamText = document.querySelector('.so-luong-text');
            let soLuongConLaiElement = document.querySelector('.so-luong-con-lai-trong-kho-value');


            soLuongDatSanPhamInputElements.forEach((item) => {
                item.value = "1";
            })
            nutTangSoLuongSP.onclick = function () {
                let soLuongConLaiValue = parseInt(soLuongConLaiElement.value);
                let soLuongDatSanPhamInput = soLuongDatSanPhamInputElements[0];
                if (+soLuongDatSanPhamInput.value >= +soLuongConLaiValue)
                    return;
                soLuongDatSanPhamInput.value = +soLuongDatSanPhamInput.value + 1;
                soLuongDatSanPhamText.innerText = soLuongDatSanPhamInput.value;

                soLuongDatSanPhamInputElements.forEach((item) => {
                    item.value = soLuongDatSanPhamInput.value;
                })
            }
            nutGiamSoLuongSP.onclick = function () {
                let soLuongDatSanPhamInput = soLuongDatSanPhamInputElements[0];
                if (+soLuongDatSanPhamInput.value !== 1) {
                    soLuongDatSanPhamInput.value = +soLuongDatSanPhamInput.value - 1;
                    soLuongDatSanPhamText.innerText = soLuongDatSanPhamInput.value;
                    soLuongDatSanPhamInputElements.forEach((item) => {
                        item.value = soLuongDatSanPhamInput.value;
                    })
                }
            }


        </script>
    </body>

</html>