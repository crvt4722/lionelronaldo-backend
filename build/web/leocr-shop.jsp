<%@page import="util.MoneyUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LeoCr shop</title>
        
        
        <link rel="stylesheet" type="text/css"  type="text/css" href="./assets/css/base.css">
        <link rel="stylesheet" type="text/css"  type="text/css" href="./assets/css/main.css">
        <link rel="stylesheet" type="text/css"  type="text/css" href="./assets/css/footer.css">
        <link rel="stylesheet" href="./css/leocr-shop/main.css">
        <link rel="stylesheet" href="./css/seach-bar/main.css">
        <link rel="stylesheet" type="text/css" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
        <script src="./includes/include.js"></script>
    
        <script src="https://kit.fontawesome.com/f0add9272d.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


    </head>

    <body>
        <div class="header" w3-include-html="./includes/header.jsp"></div>
        <div id="nav" style  = "margin-top:117px">
            <form method="GET" action="/LeoCris/products">
                <div class="tim-kiem-container">
                    <div class="thanh-tim-kiem">
                        <input type="text" autocomplete="off" name="search" id="search-product" placeholder="Tìm kiếm..." value="<%= session.getAttribute("search") != null ? session.getAttribute("search") : ""%>">
                    </div>
                    <div class="goi-y-tim-kiem info-box">
                    </div>
                </div>
            </form>
        </div>
        <div class="main mt30">
            <div class="san-pham-header">
                <div class="banner">
                    <img src="https://i8.amplience.net/i/jpl/desktop-top-banner-1920x840-home-1-7f239a4e0a6423a22030dcdf43518df9?fmt=webp"
                         alt="">
                </div>
            </div>

            <div class="san-pham-body trang">
                <div class="danh-muc-body">
                    <div class="">
                        <div class="danh-muc khung">
                            <div class="tieu-de pb-20" style="margin-left: 12px;">
                                Danh mục nổi bật
                            </div>
                            <div class="df">
                                <div class="danh-muc-item">
                                    <a href="/LeoCris/products?categoryId=1" target="_blank">
                                        <div class="danh-muc-item-img cat-anh-danh-muc ">
                                            <img src="https://i8.amplience.net/i/jpl/jd_533562_a?qlt=92&w=750&h=957&v=1&fmt=auto"
                                                 alt="">
                                        </div>

                                        <div class="danh-muc-item-ten">
                                            <span>Áo bóng đá</span>
                                        </div>
                                    </a>
                                </div>
                                <div class="danh-muc-item">
                                    <div class="danh-muc-item-img cat-anh-danh-muc ">
                                        <a href="/LeoCris/products?categoryId=3" target="_blank">
                                            <img src="https://i8.amplience.net/t/jpl/jd_product_list?plu=jd_187721_b&qlt=92&w=363&h=463&v=1&fmt=auto&bg=rgb(238,238,238)"
                                                 alt="">
                                            </div>

                                            <div class="danh-muc-item-ten">
                                                <span>Mũ/nón</span>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="danh-muc-item">
                                        <div class="danh-muc-item-img cat-anh-danh-muc ">
                                            <img src="https://i8.amplience.net/t/jpl/jd_product_list?plu=jd_599929_b&qlt=92&w=363&h=463&v=1&fmt=auto&bg=rgb(238,238,238)"
                                                 alt="">
                                        </div>
                                        <div class="danh-muc-item-ten">
                                            <span>Găng tay</span>
                                        </div>
                                    </div>
                                    <div class="danh-muc-item">
                                        <div class="danh-muc-item-img cat-anh-danh-muc ">
                                            <img src="https://i8.amplience.net/t/jpl/jd_product_list?plu=jd_103686_b&qlt=92&w=363&h=463&v=1&fmt=auto&bg=rgb(238,238,238)"
                                                 alt="">
                                        </div>
                                        <div class="danh-muc-item-ten">
                                            <span>Tất thể thao</span>
                                        </div>
                                    </div>
                                    <div class="danh-muc-item">
                                        <div class="danh-muc-item-img cat-anh-danh-muc ">
                                            <img src="https://i8.amplience.net/t/jpl/jd_product_list?plu=jd_620215_b&qlt=92&w=363&h=463&v=1&fmt=auto&bg=rgb(238,238,238)"
                                                 alt="">
                                        </div>
                                        <div class="danh-muc-item-ten">
                                            <span>Balo</span>
                                        </div>
                                    </div>
                                    <div class="danh-muc-item">
                                        <div class="danh-muc-item-img cat-anh-danh-muc ">
                                            <img src="https://i8.amplience.net/t/jpl/jd_product_list?plu=jd_546846_plc&qlt=92&w=363&h=463&v=1&fmt=auto"
                                                 alt="">
                                        </div>
                                        <div class="danh-muc-item-ten">
                                            <span>Kính thể thao</span>
                                        </div>
                                    </div>
                                    <div class="danh-muc-item">
                                        <div class="danh-muc-item-img cat-anh-danh-muc ">
                                            <img src="https://i8.amplience.net/t/jpl/jd_product_list?plu=jd_532611_b&qlt=92&w=363&h=463&v=1&fmt=auto&bg=rgb(238,238,238)"
                                                 alt="">
                                        </div>
                                        <div class="danh-muc-item-ten">
                                            <span>Tai nghe</span>
                                        </div>
                                    </div>
                                    <div class="danh-muc-item">
                                        <a href="/LeoCris/products?categoryId=2" target="_blank">
                                            <div class="danh-muc-item-img cat-anh-danh-muc ">
                                                <img src="https://i8.amplience.net/i/jpl/jd_648380_bl?w=408&h=408&fmt=webp" alt="">
                                            </div>
                                            <div class="danh-muc-item-ten">
                                                <span>Giày thể thao</span>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="danh-muc-item">
                                        <div class="danh-muc-item-img cat-anh-danh-muc ">
                                            <img src="https://i8.amplience.net/t/jpl/jd_product_list?plu=jd_666969_plc&qlt=92&w=363&h=463&v=1&fmt=auto"
                                                 alt="">
                                        </div>
                                        <div class="danh-muc-item-ten">
                                            <span>Quần jean</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="san-pham-ban-chay-container">
                        <div class="san-pham-ban-chay khung">
                            <div class="tieu-de pb-20" style="margin-left: 20px">
                                Sản phẩm bán chạy
                            </div>
                            <div class="danh-sach-san-pham-ban-chay">
                                <% ArrayList<Product> featuredProducts = (ArrayList<Product>) request.getAttribute("featuredProducts"); %> 
                                <% for (Product featuredProduct : featuredProducts) {%>
                                <div class="san-pham-ban-chay-item">
                                    <div class="cat-anh-san-pham-ban-chay">
                                        <img src="<%= featuredProduct.getImageLinks().get(0)%>"
                                             alt="">
                                    </div>
                                    <a href ="/LeoCris/product-detail?id=<%=featuredProduct.getProductId()%>" target="_blank">
                                        <div class="ten-san-pham-ban-chay">
                                            <%= featuredProduct.getName()%>
                                        </div>
                                    </a>
                                    <div class="thong-tin-san-pham df">
                                        <div class="danh-gia-san-pham-ban-chay">
                                            <div class="so-sao">
                                                <% for (int i = 0; i < (int) featuredProduct.getAvgRating(); i++) { %>
                                                <i class="fa-solid fa-star"></i>
                                                <% } %>
                                                <% if (featuredProduct.getAvgRatingString().length() > 1) { %>
                                                <i class="fa-solid fa-star-half-stroke"></i>
                                                <% }%>
                                            </div>
                                            <div class="so-luong-da-ban">
                                                <%= featuredProduct.getSoldQuantity()%> đã bán
                                            </div>
                                        </div>
                                        <div class="gia-tien">
                                            <div class="gia-goc">
                                                <%= MoneyUtil.toString(featuredProduct.getOriginPrice())%> ₫ ₫
                                            </div>
                                            <div class="gia-uu-dai">
                                                <%= MoneyUtil.toString(featuredProduct.getPrice())%> ₫
                                            </div>
                                        </div>
                                    </div>
                                    <div class="so-luong-ban-chay">
                                        - <%= featuredProduct.getSale()%>%
                                    </div>
                                </div>
                                <% }%>


                            </div>
                        </div>
                    </div>
                    <!-- Begin: Phân loại brands -->
                    <div class="phan-loai-nhan-hieu khung">
                        <div class="tieu-de">Nhãn hiệu bạn love</div>

                        <div class="danh-sach-nhan-hang">
                            <div class="nhan-hang-item">
                                <img src="https://i8.amplience.net/i/jpl/adidas-originals-2adf9245358c4e8b6f34372d49ed84ac?qlt=80"
                                     alt="" class="khung-anh">
                            </div>
                            <div class="nhan-hang-item">
                                <img src="https://i8.amplience.net/i/jpl/under-armour-265f0a0d0df0522ba15f92d5be860678?qlt=80"
                                     alt="" class="khung-anh">
                            </div>
                            <div class="nhan-hang-item">
                                <img src="https://i8.amplience.net/i/jpl/converse?qlt=80&w=140&h=94" alt="" class="khung-anh">
                            </div>
                            <div class="nhan-hang-item">
                                <img src="https://i8.amplience.net/i/jpl/ea7-68fe9895e241977687411d9ef552ac9c?qlt=80" alt=""
                                     class="khung-anh">
                            </div>
                            <div class="nhan-hang-item">
                                <img src="https://i8.amplience.net/i/jpl/filaexported-bd97523323a4e904885307d4803717b4?qlt=80"
                                     alt="" class="khung-anh">
                            </div>
                            <div class="nhan-hang-item">
                                <img src="https://i8.amplience.net/i/jpl/hoodrichexported-4cdf6788ab1831866a45e7501e5c2a5f?qlt=80"
                                     alt="" class="khung-anh">
                            </div>

                        </div>
                        <div class="danh-sach-nhan-hang">
                            <div class="nhan-hang-item">
                                <img src="https://i8.amplience.net/i/jpl/levi-73dd94824f210890565eefb43f819c72?qlt=80" alt=""
                                     class="khung-anh">
                            </div>
                            <div class="nhan-hang-item">
                                <img src="https://i8.amplience.net/i/jpl/puma-456ab7242446811e862069d94277829a?qlt=80" alt=""
                                     class="khung-anh">
                            </div>
                            <div class="nhan-hang-item">
                                <img src="https://i8.amplience.net/i/jpl/nike-621a4daaff4afc19c241a0febf32df75?qlt=80" alt=""
                                     class="khung-anh">
                            </div>
                            <div class="nhan-hang-item">
                                <img src="https://i8.amplience.net/i/jpl/tnf-ec7d7b450efe952dbe0b32b5c16256a8?qlt=80" alt=""
                                     class="khung-anh">
                            </div>
                            <div class="nhan-hang-item">
                                <img src="https://i8.amplience.net/i/jpl/vans-b5c0a099c374620035b080a9ec5ed711?qlt=80" alt=""
                                     class="khung-anh">
                            </div>
                            <div class="nhan-hang-item">
                                <img src="https://i8.amplience.net/i/jpl/nb-4163ae1bfa2f378ab5e316e986efd2cd?qlt=80" alt=""
                                     class="khung-anh">
                            </div>

                        </div>
                    </div>
                    <!-- End: Phân loại brands -->
                    <!-- Begin: Phan loai doi tuong -->

                    <div class="phan-loai-doi-tuong khung">
                        <div class="danh-cho-nam doi-tuong">
                            <div class="anh-doi-tuong">
                                <img src="https://i8.amplience.net/i/jpl/midspots-552x823-mens-1-cb0438ca7b779080f76f3b9f76ffc70e?fmt=webp"
                                     alt="">
                            </div>
                            <div class="xem-san-pham-cua-doi-tuong">
                                <a href="/LeoCris/products?productGender=1" target="_blank"><button class="xem-san-pham-btn">SHOP MEN</button></a>
                            </div>
                        </div>
                        <div class="danh-cho-nu doi-tuong">
                            <div class="anh-doi-tuong">
                                <img src="https://i8.amplience.net/i/jpl/midspots-552x823-womens-3-bde50faaad4cf49c3fba1e948b845563?fmt=webp"
                                     alt="">
                            </div>
                            <div class="xem-san-pham-cua-doi-tuong">
                                <a href="/LeoCris/products?productGender=2" target="_blank"><button class="xem-san-pham-btn">SHOP WOMEN</button></a>
                            </div>
                        </div>
                        <div class="danh-cho-tre-em doi-tuong">
                            <div class="anh-doi-tuong">
                                <img src="https://i8.amplience.net/i/jpl/midspots-552x823-kids-1-a7af5edccc59ad150e7388bb1c1559e1?fmt=webps"
                                     alt="">
                            </div>
                            <div class="xem-san-pham-cua-doi-tuong">
                                <a href="/LeoCris/products?productGender=3" target="_blank"><button class="xem-san-pham-btn">SHOP KID'S</button></a>
                            </div>
                        </div>
                    </div>
                    <!-- End: Phan loai doi tuong -->


                    <!-- Begin: San pham moi -->
                    <div class="san-pham-moi-container khung">
                        <div class="tieu-de" style="margin-left: 10px">Sản phẩm mới</div>
                        <div class="danh-sach-san-pham-moi">
                            <% ArrayList<Product> newestProducts = (ArrayList<Product>) request.getAttribute("newestProducts"); %> 
                            <% for (Product newestProduct : newestProducts) {%>
                            <div class="san-pham-moi-item">
                                <div class="anh-san-pham-moi">
                                    <img class="khung-anh"
                                         src="<%= newestProduct.getImageLinks().get(0)%>" alt="">
                                </div>
                                <div class="mo-ta-san-pham-moi">
                                    <a href ="/LeoCris/product-detail?id=<%=newestProduct.getProductId()%>" target="_blank">
                                        <div class="ten-san-pham-moi">
                                            <%= newestProduct.getName()%>
                                        </div>
                                    </a>
                                    <div class="gia-tien-san-pham-moi">
                                        <span class="gia-uu-dai">
                                            <%= MoneyUtil.toString(newestProduct.getPrice())%> ₫
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <% }%>


                        </div>
                    </div>
                    <!-- End: San pham moi -->
                    <div class="banner-giam-gia">
                        <img src="https://i8.amplience.net/i/jpl/desktop-strip-1680x244-f85f25ff7bf1c100640637efa62ba06c?fmt=webp"
                             alt="" class="khung-anh">
                    </div>
                    <div class="banner-giam-gia">
                        <img src="https://i8.amplience.net/i/jpl/desktop-middle-banner-1704x740-2-b0a63df984568c12957abbb097558f98?fmt=webps"
                             alt="" class="khung-anh">
                    </div>
                    <div class="banner-giam-gia">
                        <img src="https://i8.amplience.net/i/jpl/desktop-strip-1680x244-a05829b3808a683f8796340005974e72?fmt=webp"
                             alt="" class="khung-anh">
                    </div>

                    <div class="slides df">
                        <img src="https://i8.amplience.net/i/jpl/slide-desk-content-spots-840x740-01-19952ca75b8e5f48a2e5d66bbc086f11?fmt=webp"
                             alt="" class="khung-anh">
                        <img src="https://i8.amplience.net/i/jpl/desk-content-spots-840x740-02-5f202689af326b72d35a361fa9707d8f?fmt=webp"
                             alt="" class="khung-anh">
                    </div>
                </div>
                <footer class="footer-distributed" w3-include-html="./includes/footer.html"> </footer>
                <script src="./js/header.js"> </script>
                <script>
                    includeHTML();
                </script>
                <script src="javascript/search-bar/index.js"></script>
                
                
                <script>
                    //            let arr =
                    //                ['https://i8.amplience.net/i/jpl/performance-logo-bw…4d987855ac86f8e0ff5637da59d8438?qlt=80&w=140&h=53', 'https://i8.amplience.net/i/jpl/adidas-originals-2adf9245358c4e8b6f34372d49ed84ac?qlt=80', 'https://i8.amplience.net/i/jpl/castore-no-white-b995dca0cc85cfb6cb91b39225033df2', 'https://i8.amplience.net/i/jpl/converse?qlt=80&w=140&h=94', 'https://i8.amplience.net/i/jpl/ea7-68fe9895e241977687411d9ef552ac9c?qlt=80', 'https://i8.amplience.net/i/jpl/filaexported-bd97523323a4e904885307d4803717b4?qlt=80', 'https://i8.amplience.net/i/jpl/hoodrichexported-4cdf6788ab1831866a45e7501e5c2a5f?qlt=80', 'https://i8.amplience.net/i/jpl/levi-73dd94824f210890565eefb43f819c72?qlt=80', 'https://i8.amplience.net/i/jpl/puma-456ab7242446811e862069d94277829a?qlt=80', 'https://i8.amplience.net/i/jpl/nike-621a4daaff4afc19c241a0febf32df75?qlt=80', 'https://i8.amplience.net/i/jpl/tnf-ec7d7b450efe952dbe0b32b5c16256a8?qlt=80', 'https://i8.amplience.net/i/jpl/vans-b5c0a099c374620035b080a9ec5ed711?qlt=80', 'https://i8.amplience.net/i/jpl/nb-4163ae1bfa2f378ab5e316e986efd2cd?qlt=80', 'https://i8.amplience.net/i/jpl/under-armour-265f0a0d0df0522ba15f92d5be860678?qlt=80'];
                    //            for (let x of arr) {
                    //                console.log(x);
                    //            }
                </script>
                </body>

                </html>