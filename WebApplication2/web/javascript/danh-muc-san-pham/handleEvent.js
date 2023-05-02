let toiThieuElement = document.querySelector(".toi-thieu");
let toiDaElement = document.querySelector(".toi-da");

toiThieuElement.oninput = function () {
    toiThieuElement.value = xuLyTien(toiThieuElement.value);
}

toiDaElement.oninput = function () {
    toiDaElement.value = xuLyTien(toiDaElement.value);
}

function xuLyTien2(n) {
    n = Array.from(n).filter(item => item !== '.').join('');
    return n;
}

function handleFilterByPrice() {
    $.ajax({
        url: "/WebApplication2/ProcessFilterByPrice",
        type: "get", //send it through get method
        data: {
            toiThieu: xuLyTien2(toiThieuElement.value) || 0,
            toiDa: xuLyTien2(toiDaElement.value) || 1e9,
        },
        success: function (data) {
            renderAllProducts(data);
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

let danhMucLocElements = document.querySelectorAll('.danhMucLoc');
for (let danhMucLoc of danhMucLocElements) {
    danhMucLoc.onchange = function () {

        let danhMucLocArray = [];
        for (item of danhMucLocElements) {
            if (item.checked) {
                danhMucLocArray.push(item.value);
            }
        }

        handleFilterByDanhMucLoc(danhMucLocArray.join(','));
    }
}

function handleFilterByDanhMucLoc(danhMucLocArray) {
    $.ajax({
        url: "/WebApplication2/ProcessFilterByDanhMucLoc",
        type: "get", //send it through get method
        data: {
            danhMucLocArray,
        },
        success: function (data) {
            renderAllProducts(data);
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}


let danhGiaElements = document.querySelectorAll('.danh-gia-chi-tiet');
for (item of danhGiaElements) {
    item.onclick = function (e) {
        let numberOfStars = this.querySelector('input').value;
        handleFilterBySoSaoDanhGia(numberOfStars);
    }
}

function handleFilterBySoSaoDanhGia(numberOfStars) {
    $.ajax({

        url: "/WebApplication2/ProcessFilterBySoSaoDanhGia",
        type: "get", //send it through get method
        data: {
            soSaoDanhGia: numberOfStars,
        },
        success: function (data) {
            renderAllProducts(data);
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}