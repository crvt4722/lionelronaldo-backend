
let filterData = {
    minPrice: 0,
    maxPrice: 10000000,
    minRating: 0,
    brand: "",
    productGender: 0
}

let sortData = 0;
let searchProduct = "";

// handle search event
let searchProductElement = document.querySelector("#search-product");
//searchProductElement.onchange = function () {
//    clearSortData();
//    clearFilterData();
//    searchProduct = searchProductElement.value;
//    handleSearch();
//    handleSortAndFilterProducts();
//}

searchProductElement.oninput = function () {
//    clearSortData();
//    clearFilterData();
    searchProduct = searchProductElement.value;
    handleSearch();
}


// handle Filter Events

let minRatingElements = document.querySelectorAll(".loc-theo-danh-gia input");
for (let element of minRatingElements) {
    element.onclick = function () {
        filterData.minRating = element.value;
        handleSortAndFilterProducts();
    }
}

let brandElements = document.querySelectorAll(".loc-hang-container input");
for (let brand of brandElements) {
    brand.oninput = function () {
        let brandResult = [];
        for (let item of brandElements) {
            if (item.checked) {
                brandResult.push(item.value);
            }
        }
        filterData.brand = brandResult.join(",");
        handleSortAndFilterProducts();
    }
}

let productGenderElements = document.querySelectorAll('.loc-theo-gioi-tinh input');
for (let productGender of productGenderElements) {
    productGender.oninput = function () {
        if (productGenderElements[0].checked && productGenderElements[1].checked && productGenderElements[2].checked) {
            filterData.productGender = "5";
        } else if (productGenderElements[0].checked && productGenderElements[1].checked) {
            filterData.productGender = "4";
        } else if (productGenderElements[0].checked)
            filterData.productGender = "1";
        else if (productGenderElements[1].checked)
            filterData.productGender = "2";
        else if (productGenderElements[2].checked)
            filterData.productGender = "3";
        else
            filterData.productGender = "0";
        handleSortAndFilterProducts();
    }
}

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

let minPriceElement = document.querySelector(".toi-thieu input");
let maxPriceElement = document.querySelector(".toi-da input");

minPriceElement.oninput = function () {
    minPriceElement.value = xulyTien(minPriceElement.value);
}

maxPriceElement.oninput = function () {
    maxPriceElement.value = xulyTien(maxPriceElement.value);
}

minPriceElement.onchange = function () {
    filterData.minPrice = minPriceElement.value.split(".").join("");
    handleSortAndFilterProducts();
}

maxPriceElement.onchange = function () {
    filterData.maxPrice = maxPriceElement.value.split(".").join("");
    handleSortAndFilterProducts();
}


// handle Sort events
function clearSortData(){
    sortData = 0;
}
function clearFilterData() {
    filterData = {
        minPrice: 0,
        maxPrice: 10000000,
        minRating: 0,
        brand: "",
        productGender: 0
    }
    minPriceElement.value = "0";
    maxPriceElement.value = "10.000.000";
    for (let brand of brandElements) {
        brand.checked = false;
    }
    for (let productGender of productGenderElements) {
        productGender.checked = false;
    }
}

let sortElements = document.querySelectorAll('.tieu-chi-sap-xep');
sortElements.forEach((sortElement, sortIndex) => {
    sortElement.onclick = function () {
        sortData = sortIndex + 1;
        clearFilterData();
        handleSortAndFilterProducts();
    }
})

function handleSortAndFilterProducts() {
    $.ajax({
        url: "/LeoCris/ProcessSortAndFilterProducts",
        type: "get", //send it through get method
        data: {
            ...filterData,
            sortData: sortData,
            searchProduct: searchProduct,
        },
        success: function (data) {
            console.log(data);
            renderProductsList(data);
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}
let SuggestData = document.querySelector(".goi-y-tim-kiem");
let mainSection = document.querySelector(".main");
mainSection.onclick = function () {
    clearSearchData();
}
function clearSearchData(){
    SuggestData.innerHTML = '';
}
function notBoldKeyword(key) {
    let res = "";
    for (let i = 0; i < key.length; i++) {
        if (i <= key.length - 3 && key.substring(i, i + 3) === "<b>")
            i += 3;
        else if (i <= key.length - 4 && key.substring(i, i + 4) === "</b>")
            i += 4;
        res += key.charAt(i);
    }
    return res;
}

function renderSearchData(searchData){
    console.log(notBoldKeyword("<b>bóng</b>%20<b>đá</b>"));
    let htmls = '';
    for(let item of searchData){
        htmls += `<a href="/LeoCris/products?search=${notBoldKeyword(item)}"><div class="goi-y-tim-kiem-item">${item}</div></a>`;
    }
    SuggestData.innerHTML = htmls;
}
function handleSearch() {
    $.ajax({
        url: "/LeoCris/ProcessGetKeyWordSearch",
        type: "get", //send it through get method
        data: {
            search: searchProduct,
        },
        success: function (searchData) {
            console.log(searchData);
            renderSearchData(searchData);
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}



function renderRatingProduct(product) {
    let html = '';
    for (let i = 0; i < parseInt(product.avgRating); i++) {
        html += '<i class="fa-solid fa-star"></i>'
    }
    if (product.avgRating - parseInt(product.avgRating) != 0) {
        html += '<i class="fa-solid fa-star-half-stroke"></i>'
    }
    return html;
}

let productsListElement = document.querySelector('.danh-sach-san-pham');
function renderProductsList(productsList)
{
    let htmls = '';
    for (let product of productsList) {
        htmls += `<div class="san-pham-item">
    <div class="san-pham-item__img cat-anh-san-pham">
        <div class="anh-san-pham">`;
        let imageLinks = product.imageLinks;
        if (imageLinks.length > 0) {
            htmls += `<img class="anh-chinh" src="${imageLinks[0]}
    "
                     alt="">
                <img class="anh-phu" src="${imageLinks[1]}" alt="">`
        } else {
            htmls += `
                <img class="anh-chinh"
                     src="https://i8.amplience.net/i/jpl/jd_666930_a?qlt=92&w=750&h=957&v=1&fmt=auto"
                     alt="">
                <img class="anh-phu"
                     src="https://i8.amplience.net/i/jpl/jd_666930_b?qlt=92&w=750&h=957&v=1&fmt=auto"
                     alt="">
            `
        }

        htmls += `
                </div>
                </div>
                <div class="thong-tin-san-pham">
                    <a href="/LeoCris/product-detail?id=${product.productId}">
                        <div class="san-pham-item__ten">
                            ${product.name}
                        </div>
                    </a>
                    <div class="df">
                        <div class="san-pham-item__danh-gia f1">
                            <span class="so-luong-danh-gia">
                                ${product.numberOfRating} lượt đánh giá
                            </span>
                            <br>

                            <div class="so-sao-danh-gia">
                                ${renderRatingProduct(product)}
                            </div>
<span class="da-ban">Đã bán ${product.soldQuantity}
                            </span>
                        </div>

<div class="san-pham-item__gia f1">
                            <span class="gia-goc">
                                ${xulyTien(product.originPrice)} ₫
                            </span>
                            <br>
                            <span class="gia-uu-dai">
                                ${xulyTien(product.price)} ₫

                            </span>
                        </div>
                    </div>

                </div>

        </div>
`
    }
    productsListElement.innerHTML = htmls;
}

