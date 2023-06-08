let stars = document.querySelectorAll('.phan-danh-gia-sao i');
let commentText = document.querySelector('textarea')
let rating = 5;
let orderId;
let responseElement;

async function handleResponse(element, id) {
    responseElement = element;
    orderId = id;
    await handleGetProductByOrderId(orderId);
    openModal();
}
function clearRating() {
    commentText.value = ''
    rating = 5;
    for (let i = 0; i < 5; i++) {
        if (stars[i].classList.contains('fa-regular'))
            stars[i].classList.remove('fa-regular')
        stars[i].classList.add('fa-solid')
    }
    stars.forEach((star, index) => {
        star.onmouseover = function () {
            for (let i = 0; i <= index; i++) {
                if (stars[i].classList.contains('fa-regular'))
                    stars[i].classList.remove('fa-regular')
                stars[i].classList.add('fa-solid')
            }
            for (let i = index + 1; i < 5; i++) {
                if (stars[i].classList.contains('fa-solid'))
                    stars[i].classList.remove('fa-solid')
                stars[i].classList.add('fa-regular')
            }
        }
    })
}


stars.forEach((star, index) => {
    star.onmouseover = function () {
        for (let i = 0; i <= index; i++) {
            if (stars[i].classList.contains('fa-regular'))
                stars[i].classList.remove('fa-regular')
            stars[i].classList.add('fa-solid')
        }
        for (let i = index + 1; i < 5; i++) {
            if (stars[i].classList.contains('fa-solid'))
                stars[i].classList.remove('fa-solid')
            stars[i].classList.add('fa-regular')
        }
    }
})

stars.forEach((star, index) => {
    star.onclick = function () {
        rating = index + 1;
        for (let i = 0; i <= index; i++) {
            if (stars[i].classList.contains('fa-regular'))
                stars[i].classList.remove('fa-regular')
            stars[i].classList.add('fa-solid')
        }
        for (let i = index + 1; i < 5; i++) {
            if (stars[i].classList.contains('fa-solid'))
                stars[i].classList.remove('fa-solid')
            stars[i].classList.add('fa-regular')
        }
        stars.forEach(item => {
            item.onmouseover = null;
        })
    }
})

function renderProductDetail(product) {
    let htmls = `
        <div class="f2 anh-san-pham">
        <img src="${product.imageLinks[0]}" class="khung-anh"
            alt="">
        </div>
        <div class="f6 thong-tin-chi-tiet">
            <div class="ten-san-pham">
                ${product.name}
            </div>
            <div class="thuong-hieu">
                Thương hiêu: ${product.brand}
            </div>
        </div>
    `
    document.querySelector('.thong-tin-san-pham').innerHTML = htmls;
}

async function handleGetProductByOrderId(orderId) {
    await $.ajax({
        url: "/LeoCris/api/v1/get-order-detail",
        type: "get", //send it through get method
        data: {
            orderId: orderId,
        },
        success: function (data) {
            console.log(data);
            renderProductDetail(data);
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}


async function handlePostCustomerResponse() {
    await $.ajax({
        url: "/LeoCris/api/v1/post-customer-response",
        type: "GET", //send it through get method
        data: {
            orderId: orderId,
            rating: rating,
            comment: commentText.value,
        },
        success: function (data) {
            alert(data);
        },
        error: function (xhr) {
            //Do Something to handle error
            console.log(xhr);
        }
    });
}