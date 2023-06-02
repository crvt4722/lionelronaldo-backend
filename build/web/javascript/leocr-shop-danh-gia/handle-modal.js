// xử lý modal
let troLaiElement = document.querySelector('.tro-lai-btn');
let hoanThanhElement = document.querySelector('.hoan-thanh-btn');
let openModalElements = document.querySelectorAll('.danh-gia-btn');
let modal = document.querySelector('.modal');

// openModalElement.onclick = openModal;
// openModalElements.forEach((btn) => {
//     btn.onclick = function () {
//         openModal();
//     }
// })

troLaiElement.onclick = closeModal;
function openModal() {
    clearRating();
    modal.classList.add('open');
}
function closeModal() {
    modal.classList.remove('open');
}

hoanThanhElement.onclick = async function () {
    console.log(commentText.value);
    console.log(rating);
    await handlePostCustomerResponse();
    responseElement.onclick = null;
    responseElement.innerText = "Đã đánh giá";
    closeModal();
}