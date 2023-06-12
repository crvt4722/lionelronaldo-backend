<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="util.Validate"%>
<%@page import="java.util.*"%>
<%@page import="model.UserProfile"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Toi Cr</title>

    <link rel="stylesheet" href="./assets/css/footer.css">
    <link rel="stylesheet" href="./assets/css/authorization.css">
    <link rel="stylesheet" href="./assets/css/modal.css">
    <link rel="stylesheet" href="./assets/css/management.css">

    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/base.css">
    <link rel="stylesheet" type="text/css"  type="text/css" href="./assets/css/main.css">
    <link rel="stylesheet" type="text/css" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">

    <link rel="icon" href="./assets/img/logo.jpg" type="image/x-icon" />

    <!-- ReactJs -->
    <script crossorigin src="https://unpkg.com/react@17.0.0/umd/react.production.min.js"></script>
    <script crossorigin src="https://unpkg.com/react-dom@17.0.0/umd/react-dom.production.min.js"></script> 
    <script src="./includes/include.js"></script>
</head>
<body>
     <div class="header" w3-include-html="./includes/header.jsp"></div>

    <div id="slider" style="display: flex;">
        <div class ="chmod" style="width: 40%; height: 630px">
            <form class="add-new" action = "ProcessAddOrUpdateProduct" method = "post">
                <p style = "color:red"></p>
                <p style = "color:red"></p>
                <p style = "color:red"></p>
                <p style = "color:red"></p>
                <p style = "color:red"></p>
                <p style = "color:red"></p>
                <p style = "color:red"></p>
                <p style = "color:red"></p>
                <p style = "color:red"></p>
                <p style = "color:red"></p>
                <p style = "color:red; transform: translateY(30px)"><%= Validate.StringUtil((String) request.getAttribute("error"))%></p>
                
                <div class="row-form">
                    <input  type="text" name = "name" placeholder="Tên mặt hàng">
                    
                    <select name="category">
                        <option value="category">Loại</option>
                        <option value="Quần áo">Quần áo</option>
                        <option value="Mũ">Mũ</option>
                        <option value="Giày">Giày</option>
                        <option value="Bóng đá">Bóng đá</option>
                        <option value="Balo">Balo</option>
                        <option value="Găng tay">Găng tay</option>
                        <option value="Kính">Kính</option>
                        <option value="Tất">Tất</option>
                    </select>
                </div>
                <div class="row-form">
                    <select name="gender" >
                        <option value="gender">Dành cho</option>
                        <option value="1">Trẻ em</option>
                        <option value="2">Nam</option>
                        <option value="3">Nữ</option>
                        <option value="4">Nam và Nữ</option>
                    </select>
                    
                    <select name="brand">
                        <option value="brand">Nhãn hiệu</option>
                        <option value="Adidas">Adidas</option>
                        <option value="Nike">Nike</option>
                        <option value="Gucci">Gucci</option>
                        <option value="Dior">Dior</option>
                    </select>
                </div>
                <div class="row-form">
                    <input  type="number" name = "origin-price" placeholder="Giá gốc">
                    <input  type="number" name = "sale" placeholder="Khuyến mại">
                </div>
                <div class="row-form">
                    <input  type="number" name = "quantity" placeholder="Số lượng trong kho">
                    <select name="size">
                        <option value="size">Kích cỡ</option>
                        <option value="S">S</option>
                        <option value="M">M</option>
                        <option value="L">L</option>
                        <option value="XL">XL</option>
                        <option value="2XL">2XL</option>
                        <option value="3XL">3XL</option>
                        <option value="3XL">3XL</option>
                        <option value = '25'>25</option>
                        <option value = '26'>26</option>
                        <option value = '27'>27</option>
                        <option value = '28'>28</option>
                        <option value = '29'>29</option>
                        <option value = '30'>30</option>
                        <option value = '31'>31</option>
                        <option value = '32'>32</option>
                        <option value = '33'>33</option>
                        <option value = '34'>34</option>
                        <option value = '35'>35</option>
                        <option value = '36'>36</option>
                        <option value = '37'>37</option>
                        <option value = '38'>38</option>
                        <option value = '39'>39</option>
                        <option value = '40'>40</option>
                        <option value = '41'>41</option>
                        <option value = '42'>42</option>
                        <option value = '43'>43</option>
                        <option value = '44'>44</option>
                        <option value = '45'>45</option>
                    </select>
                </div>
                <div class="row-form">
                    <input  type="file" name = "files" multiple>
                    <input  type="text" name = "keywords" placeholder = "Các keyword cách nhau bởi dấu !">
                </div>
                
                <div class="row-form">
                    <input  type="text" name = "description" placeholder="Mô tả sản phẩm">
                    <input  type="number" name = "product-id" placeholder="ID: Nhập nếu bạn cần chỉnh sửa" value = "">
                </div>
                
                <div class="btn">
                    <button type="submit" class="submit-btn" style="font-size:15px; font-weight: bold">Gửi</button>
                </div>
            </form>
        </div>
        
        <div class ="stats"style="width: 60%; height: 630px">
            <p>Danh sách các mặt hàng của LionelRonaldo</p>
            <table class="table-data">
                <tr>
                    <th>ID</th>
                    <th>Loại</th>
                    <th>Tên sản phẩm</th>
                    
                    <!--<th>Mô tả</th>-->
                    <th>Dành cho</th>
                    <th>Nhãn hiệu</th>
                    <th>Giá gốc</th>
                    <th>Khuyến mại</th>
                    <!--<th>Giá bán</th>-->
                    <!--<th>Đã bán</th>-->
                    <!--<th>Đánh giá</th>-->
                    <th>Xóa</th>
                </tr>
                
            </table>
        </div>
    </div>

    <footer class="footer-distributed" w3-include-html="./includes/footer.html"> </footer>


    <script src="./js/header.js"> </script>
    <script>
        fetch('/LeoCris/api/products')
        .then(response => {
          if (response.ok) {
            return response.json();
          } else {
            throw new Error('Error: ' + response.status);
          }
        })
        .then(data => {
          // Handle the data returned from the API
          let tableData = document.querySelector('.table-data');
          for (let element of data) {
              let tr = document.createElement('tr')
              
              let ignoreAttribute = ['description', 'numberOfRating', 'price', 'avgRating', 'soldQuantity']
              for (let i in element) {
                  if(ignoreAttribute.includes(i)== false){
                    let td = document.createElement('td')
                    td.textContent = element[i]
                    tr.appendChild(td)
                  }
              }
              
              td = document.createElement('td')
              a = document.createElement('a')
              a.textContent = 'Xóa'
              a.href= '/LeoCris/api/products/delete/' + element.productId
              td.appendChild(a)
              tr.appendChild(td)
              
              tableData.appendChild(tr)
          }
        })
        .catch(error => {
          // Handle any errors that occurred during the request
          console.error(error);
        });
    </script>
    <script>
        includeHTML();
        
        function controllPermission(){
            let xhr = new XMLHttpRequest()
            xhr.open('GET', '/LeoCris/ProcessManagementPermission', true)
            xhr.setRequestHeader('Content-Type', 'application/json')
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                  let responseMessage = xhr.responseText
                  if (responseMessage == 'DENY') window.location.href = "index.jsp"
                }
              };
            xhr.send()
        }
        controllPermission()
        
        setTimeout(()=>{
            const logoutBtn = document.querySelector('.fa-power-off')

            logoutBtn.addEventListener('click', (e)=>{
                e.preventDefault()
                console.log('logout')
                let xhr = new XMLHttpRequest()
                xhr.open('POST', '/LeoCris/ProcessLogout', true)
                xhr.setRequestHeader('Content-Type', 'application/json')
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                      console.log(1111)
                    }
                  };
                xhr.send()
                setTimeout(()=>{
                    location.reload()
                },100)
            })
        }, 1000)
        
    </script>
</body>
</html>