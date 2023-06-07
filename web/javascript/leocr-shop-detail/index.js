let productsElement = document.querySelector('.danh-sach-danh-muc-san-pham');
let productsApi = 'http://localhost:8080/LeoCris/ProcessGetAllProducts';

// function format string, instead of string template, it doesn't work in .jsp?
String.prototype.format = function () {
    let formatted = this;
    for (let i = 0; i < arguments.length; i++) {
        let regexp = new RegExp('\\{' + i + '\\}', 'gi');
        formatted = formatted.replace(regexp, arguments[i]);
    }
    return formatted;
};
function start() {
    
    getAllProducts();
}

start();

function getAllProducts() {
    fetch(productsApi)
            .then(function (response) {
                return response.json();
            })
            .then(function (products) {
                renderAllProducts(products);

            })
}
function xuLySoSaoDanhGia(n) {
    n = "" + n.toFixed(1);
    if (n == 0)
        return "Chưa có đánh giá";
    else if (n[2] == '0')
        return n[0] + " trên 5";
    return n + " trên 5";
}
function handleNumberOfStars(n) {
    let html = '';
    for (let i = 1; i <= n; i++) {
        html += '<i class="fa-solid fa-star"></i>'
    }
    if (n == parseInt(n)) {
        n = parseInt(n);
        for (let i = n + 1; i <= 5; i++) {
            html += '<i class="fa-regular fa-star"></i>'
        }
    } else {
        html += '<i class="fa-solid fa-star-half-stroke"></i>';
        n = parseInt(n);
        for (let i = n + 2; i <= 5; i++) {
            html += '<i class="fa-regular fa-star"></i>'
        }
    }
    return html;
}
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


function renderAllProducts(products) {
    let html = '';

    for (let product of products) {
        html += `<div class="san-pham">
                            <div class="san-pham-body">
                                <div class="san-pham__hinh-anh">
                                    <div class="crop">
                                        <img src="{0}"
                                             alt="">
                                    </div>
                                </div>
                                <div class="san-pham__noi-dung">
                                    <div class="ten-san-pham">
                                        {1}

                                    </div>
            
                                    <div class="gia-san-pham">
                                        <div class="gia-cu">₫{2}</div>
                                        <div class="gia-hien-tai">₫{3}</div>
                                    </div>
            
                                    <div class="so-luot-danh-gia">
                                        {6} lượt đánh giá
                                    </div>
                                    <div class="danh-gia-san-pham">
                                        
                                        {5}
                                        
                                    </div>
                                    
                                    <div class="so-luong-da-ban">
                                        Đã bán {7}
                                    </div>
                                </div>
                            </div>
                        </div>`.format("img/" + product.linkAnh, product.tenSanPham, xuLyTien(product.giaCu), xuLyTien(product.giaHienTai), xuLySoSaoDanhGia(product.soSaoDanhGia), handleNumberOfStars(product.soSaoDanhGia), product.soLuotDanhGia, product.soLuongDaBan);
    }
    productsElement.innerHTML = html;
}