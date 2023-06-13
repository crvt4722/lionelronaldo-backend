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
    <title>Quản lý đơn hàng</title>

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
<style>
    .stats-option{
        width: 40%; 
        float: left;
        display: flex;
        align-items: center;
        height: 45px;
        
    }
    select {
        height: 25px;
        font-weight: bold;
        font-family: monospace;
        font-size:11px;
        transform: translateX(110px)
    }
    label{
        width: 15%;
        font-family: monospace;
        font-weight: bold;
        /*transform: translateX(-60px);*/
    }
</style>
<body>
     <div class="header" w3-include-html="./includes/header.jsp"></div>

    <div id="slider" style="display: flex;">
        
        <div class ="stats" style="width: 100%; height: 630px; border:none; margin: 0 auto">
            <div>
                <p style = "width: 60%; float: right; text-align: left">Danh sách đơn hàng của LionelRonaldo</p>
                <div class = "stats-option">
                    <select name="delivery_status" class="delivery_status" onchange="changeDeliveryStatus()">
                        <option value="all">Tất cả</option>
                        <option value="Chờ xác nhận">Chờ xác nhận</option>
                        <option value="Chờ lấy hàng">Chờ lấy hàng</option>
                        <option value="Lấy hàng thành công">Lấy hàng thành công</option>
                        <option value="Đang vận chuyển">Đang vận chuyển</option>
                        <option value="Giao hàng thành công">Giao hàng thành công</option>
                        <option value="Đã hủy">Đã hủy</option>
                    </select>
                    <input type="radio" name ='old-new' class = 'old-new' style ="height:10px; transform: translateX(110px)" value = "new"/>
                    <label style="transform:translateX(40px)">Mới nhất</label>
                    <input type="radio" name ='old-new' class = 'old-new' style ="height:10px; transform: translateX(-20px)" value = "old"/>
                    <label style= "transform:translateX(-90px)">Cũ nhất</label>
                </div>
            </div>
            <table class="table-data">
                
                
            </table>
        </div>
    </div>

    <footer class="footer-distributed" w3-include-html="./includes/footer.html"> </footer>


    <script src="./js/header.js"> </script>
    <script>
        var deliveryStatus = "all"
        var orderTime = "new"
        function changeDeliveryStatus(){
            deliveryStatus = document.querySelector('.delivery_status').value
            console.log(deliveryStatus +' ' +orderTime)
            let data = {
                "deliveryStatus": deliveryStatus,
                "orderTime":orderTime
            }
            getData(data)
        }
        
        const oldNewRadios = document.querySelectorAll('.old-new')
        for (let oldNewRadio of oldNewRadios){
            oldNewRadio.addEventListener('click', ()=>{
                orderTime = oldNewRadio.value
                console.log(deliveryStatus +' ' +orderTime)
                let data = {
                    "deliveryStatus": deliveryStatus,
                    "orderTime":orderTime
                }
                getData(data)
            })
        }
        
        getData({
                "deliveryStatus": deliveryStatus,
                "orderTime":orderTime
            })
        function getData(data){
            fetch('/LeoCris/api/orders',  {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
              })
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
              tableData.innerHTML = `
              <tr>
                <th>ID</th>
                <th>Tên KH</th>
                <th>SĐT</th>
                <th>Địa chỉ</th>
                <th>Thời gian</th>
                <th>Tên sản phẩm</th>
                <th>Kích cỡ</th>
                <th>Số lượng</th>
                <th>Tổng chi phí</th>
                <th>Hình thức thanh toán</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
                <th>Hủy đơn hàng</th>
             </tr>
             `
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

                  let cancelOrderCase = ['Chờ xác nhận', 'Chờ lấy hàng', 'Lấy hàng thành công']

                  if(cancelOrderCase.includes(element.deliveryStatus)){

                    let controll_option = 0
                    let controll = ''
                    if(element.deliveryStatus == 'Chờ xác nhận') {
                        controll = 'Xác nhận đơn'
                        controll_option = 1
                    }
                    else if(element.deliveryStatus == 'Chờ lấy hàng'){
                        controll = 'Lấy hàng'
                        controll_option = 2
                    }
                    else if(element.deliveryStatus == 'Lấy hàng thành công'){
                        controll = 'Gửi hàng'
                        controll_option = 3
                    }


                    td = document.createElement('td')
                    a = document.createElement('a')
                    a.textContent = controll
                    a.href= '/LeoCris/api/orders/controll/' + element.id + '/' + controll_option
                    td.appendChild(a)
                    tr.appendChild(td)

                    td = document.createElement('td')
                    a = document.createElement('a')
                    a.textContent = 'Hủy đơn hàng'
                    a.href= '/LeoCris/api/orders/cancel/' + element.id
                    td.appendChild(a)
                    tr.appendChild(td)
                  }

                  tableData.appendChild(tr)
              }
            })
            .catch(error => {
              // Handle any errors that occurred during the request
              console.error(error);
            });
        }
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