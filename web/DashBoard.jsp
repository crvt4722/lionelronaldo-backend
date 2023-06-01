<%-- 
    Document   : DA_DashBoard
    Created on : Jun 1, 2023, 4:39:55 PM
    Author     : Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dash Board</title>
  <link rel="stylesheet" href="assets/css/DAstyle.css">
  <script src="https://kit.fontawesome.com/f0add9272d.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>

<body>
  <div class="all-thong-ke">
    <div class="ten-div">
      THỐNG KÊ TỔNG
    </div>
    <div class="thong-ke">

      <div class="thong-ke-item">
        <div class="icon-tk">
          <i class="fa-solid fa-clock kich-co violet"></i>
        </div>
        <div class="so-tk">
            <%= request.getAttribute("spDaBan") %>
        </div>
        <div class="ten-tk">
          Đã bán
        </div>

      </div>
      <div class="thong-ke-item">
        <div class="icon-tk">
          <i class="fa-solid fa-user kich-co blue"></i>
        </div>
        <div class="so-tk">
          <%= request.getAttribute("tongUser") %>
        </div>
        <div class="ten-tk">
          Khách hàng
        </div>
      </div>
      <div class="thong-ke-item">
        <div class="icon-tk">
          <i class="fa-solid fa-cart-shopping kich-co red"></i>
        </div>
        <div class="so-tk">
          <%= request.getAttribute("tongSanPham") %>
        </div>
        <div class="ten-tk">
          Sản phẩm
        </div>
      </div>
      <div class="thong-ke-item">
        <div class="icon-tk">
          <i class="fa-solid fa-dollar-sign kich-co green"></i>
        </div>
        <div class="so-tk">
          <%= request.getAttribute("tongDoanhThu") %>
        </div>
        <div class="ten-tk">
          Thu nhập
        </div>
      </div>
    </div>
  </div>



  <div class="chart-content">

    <div class="bieu-do-trai">
      <div class="ten-div">
        Thu nhập hôm nay
      </div>
      <div class="chart">
        <canvas id="bieu-do-ngay" style="width:100%;"></canvas>
      </div>
    </div>

    <div class="bieu-do-phai">
      <div class="ten-div">
        Top sản phẩm <br>
        <span class="thong-tin-them">Bán chạy nhất trong tuần</span>
      </div>
      <div class="san-pham">
       <div class="anh-sp">
        <img src="assets/img/logo.jpg" alt="" class="full">
       </div>
        <div class="chi-tiet thong-tin-chinh">
          IPhone 16 <br>
          <span class="thong-tin-them">Item: #123</span>
        </div>
        <div class="gia thong-tin-chinh">$9999</div>
      </div>

      

       <div class="san-pham">
        <div class="anh-sp">
         <img src="assets/img/logo.jpg" alt="" class="full">
        </div>
         <div class="chi-tiet thong-tin-chinh">
           IPhone 16 <br>
           <span class="thong-tin-them">Item: #123</span>
         </div>
         <div class="gia thong-tin-chinh">$9999</div>
       </div>

       <div class="san-pham">
        <div class="anh-sp">
         <img src="assets/img/logo.jpg" alt="" class="full">
        </div>
         <div class="chi-tiet thong-tin-chinh">
           IPhone 16 <br>
           <span class="thong-tin-them">Item: #123</span>
         </div>
         <div class="gia thong-tin-chinh">$9999</div>
       </div>

       <div class="san-pham">
        <div class="anh-sp">
         <img src="assets/img/logo.jpg" alt="" class="full">
        </div>
         <div class="chi-tiet thong-tin-chinh">
           IPhone 16 <br>
           <span class="thong-tin-them">Item: #123</span>
         </div>
         <div class="gia thong-tin-chinh">$9999</div>
       </div>

       <div class="san-pham">
        <div class="anh-sp">
         <img src="assets/img/logo.jpg" alt="" class="full">
        </div>
         <div class="chi-tiet thong-tin-chinh">
           IPhone 16 <br>
           <span class="thong-tin-them">Item: #123</span>
         </div>
         <div class="gia thong-tin-chinh">$9999</div>
       </div>

      
    </div>



    <div class="bieu-do-full">
      <div class="ten-div">
        Doanh Thu <br>
        <span class="thong-tin-them">Doanh Thu Tháng</span>
      </div>
      <div class="chart">
        <canvas id="bieu-do-tuan" style="width:100%"></canvas>
      </div>
    </div>

    <div class="bieu-do-trai">
      <div class="ten-div">
        Danh mục được quan tâm <br>
        <span class="thong-tin-them">Thống kê số lượng sản phẩm bán thuộc danh mục</span>
      </div>
      <div class="chart">
        <canvas id="bieu-do-danh-muc" style="width:100%;"></canvas>
      </div>
    </div>

    <div class="bieu-do-phai">
      <div class="ten-div">
        Top người mua <br>
        <span class="thong-tin-them">Mua nhiều nhất trong tháng</span>
      </div>

    </div>

  </div>


</body>
<script>
  logJSONData();
  async function logJSONData() {
  const response = await fetch("http://localhost:2511/LeoCris/thunhaphomnay");
  const jsonData = await response.json();
  console.log(jsonData);
}
  let xValues = [50, 60, 70, 80];
  let yValues = [7, 8, 8, 10];
  let x2Values = ["Thu nhập hôm nay", "Còn thiếu"];
  let y2Values = [2,3];
 
  const x3Values = [50, 60, 70, 80];
  const y3Values = [17, 38, 58, 80];
  barColors = ["rgb(115, 174, 27)", "rgba(200,250,200)"];
  new Chart("bieu-do-tuan", {
    type: "line",
    data: {
      labels: xValues,
      datasets: [{
        fill: false,
        lineTension: 0,
        backgroundColor: "rgb(115, 174, 27)",
        borderColor: "rgba(200,250,200)",
        data: yValues
      }]
    },
    options: {
      legend: { display: false },
      scales: {
        //yAxes: [{ ticks: { min: 6, max: 16 } }],
      }
    }
  });
  new Chart("bieu-do-ngay", {
    type: "doughnut",
    data: {
      labels: x2Values,
      datasets: [{
        backgroundColor: barColors,
        data: y2Values
      }]
    },
    options: {
      title: {
        display: true,
        text: "Chỉ tiêu: 1000$"
      }
    }
  });
 
  new Chart("bieu-do-danh-muc", {
    type: 'radar',
    data: {
      labels: x3Values,
      datasets: [{
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgb(54, 162, 235)',
        pointBackgroundColor: 'rgb(54, 162, 235)',
        pointBorderColor: '#fff',
        pointHoverBackgroundColor: '#fff',
        pointHoverBorderColor: 'rgb(54, 162, 235)',
        data: y3Values
      }]
    },
    options: {
      elements: {
        line: {
          borderWidth: 3
        }
      }

    },
  })

</script>

</html>