let searchProduct = "";
let searchProductElement = document.querySelector("#search-product");
searchProductElement.oninput = function () {
    searchProduct = searchProductElement.value;
    handleSearch();
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
            console.log(">>>notBoldKeyword");
            console.log(notBoldKeyword("<b>ngo</b>ại hạng anh"));
            renderSearchData(searchData);

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
function clearSearchData() {
    SuggestData.innerHTML = '';
}

function notBoldKeyword(key) {
    let res = "";
    for (let i = 0; i < key.length; i++) {
        if (i < key.length - 3 && key.substring(i, i + 3) === "<b>")
            i += 3;
        else if (i < key.length - 4 && key.substring(i, i + 4) === "</b>")
            i += 4;
        res += key.charAt(i);
    }
    return res;
}



function renderSearchData(searchData) {

    let htmls = '';
    for (let item of searchData) {
        htmls += `<a href="/LeoCris/products?search=${notBoldKeyword(item)}"><div class="goi-y-tim-kiem-item">${item}</div></a>`;
    }
    SuggestData.innerHTML = htmls;
}