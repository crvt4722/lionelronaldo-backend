
<%-- Document : DA_DashBoard Created on : Jun 1, 2023, 4:39:55 PM Author : Vinh --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                    Thống kê tổng
                </div>
                <div class="thong-ke">

                    <div class="thong-ke-item">
                        <div class="icon-tk">
                            <i class="fa-solid fa-clock kich-co violet"></i>
                        </div>
                        <div class="so-tk">
                            <%= request.getAttribute("spDaBan")%>
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
                            <%= request.getAttribute("tongUser")%>
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
                            <%= request.getAttribute("tongSanPham")%>
                        </div>
                        <div class="ten-tk">
                            Sản phẩm
                        </div>
                    </div>
                    <div class="thong-ke-item">
                        <div class="icon-tk" style="width: 30%;" >
                            <i class="fa-solid fa-dollar-sign kich-co green"></i>
                        </div>
                        <div class="so-tk">
                            <%= request.getAttribute("tongDoanhThu")%>
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
                        Thu nhập hôm nay <br>
                        <span class="thong-tin-them">Thu nhập so với chỉ tiêu</span>
                    </div>
                    <button id="myBtn" class="three-dot"><i class="fa-solid fa-ellipsis-vertical"></i></button>
                    <div class="chart">
                        <canvas id="bieu-do-ngay" style="width:100%;"></canvas>
                    </div>
                </div>

                <div class="bieu-do-phai" id="top-san-pham">

                </div>



                <div class="bieu-do-full">
                    <div class="ten-div">
                        Doanh Thu <br>
                        <span class="thong-tin-them">Doanh thu theo các ngày trong tháng</span>
                    </div>
                    <div class="chart">
                        <canvas id="bieu-do-thang" style="width:100%"></canvas>
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

                <div class="bieu-do-phai" id="top-nguoi-dung">

                </div>

            </div>
            <div class="footer"></div>
            <div id="myModal" class="modal">

                <div class="modal-content">
                    <span class="close">&times;</span>
                    <div style="text-align: center; font-size: 36px;" class="thong-tin-chinh">Cài đặt chỉ tiêu</div>
                    <div class="cho-nhap thong-tin-chinh"> 
                        Chỉ tiêu: <input style="border: 1px solid black; height: 30px; width: 500px; padding-left: 8px;" placeholder="Type in here ..." type="text" id = "modal-text" >
                    </div>
                    <div class="cac-nut-modal">
                        <button class="huy-modal" onclick="HuyModal()">Cancel</button>
                        <button class="chap-nhan" onclick="CaiDatChiTieu()">Apply</button>
                    </div>
                   
                </div>

            </div>
        </body>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
            let lastChiTieu;
            let preThuNhapThang;
            let preTopSanPham;
            let preThuNhapNgay;
            let preDoanhMuc;
            let today = new Date();
            let date = new Date(today.getFullYear(), today.getMonth(), "1", "7");
            let days = [];
            let thuNhapThang = [];
            
            while (date.getMonth() === today.getMonth()) {
                let s = date.toJSON().slice(0, 10).trim();
                days.push(s);
                thuNhapThang.push(0);
                date.setDate(date.getDate() + 1);
            }


            let x2Values = ["Thu nhập hôm nay", "Còn thiếu"];
            let y2Values = [];
            barColors = ["rgb(25, 209, 25)", "rgba(200,250,200)"];

            let lablesDanhMuc = [];
            let soDaBanDM = [];

            getDataThuNhapThang();
            getDataTopSanPham();
            getDataThuNhapNgay(20000000);
            getDataDanhMuc();
            getDataTopNguoiDung();

            setInterval(getDataThuNhapThang, 3000);
            setInterval(getDataTopSanPham, 3000);
            setInterval(getDataTopNguoiDung, 3000);
            setInterval(getDataThuNhapNgay, 3000);
            setInterval(getDataDanhMuc, 3000);
            function getDataThuNhapThang() {
                $.ajax({
                    type: 'GET',
                    url: 'http://localhost:2511/LeoCris/thunhapthang',
                    async: false,
                    success: function (data) {

                        for (let i = 0; i < data.length; i++) {
                            for (let j = 0; j < days.length; j++) {// tim vi tri ngay trong mang
                                if (days[j] === data[i].ngay)
                                    thuNhapThang[j] = data[i].tien;
                            }

                        }
                        if (JSON.stringify(data) !== JSON.stringify(preThuNhapThang)) renderBieuDoThang();
                        preThuNhapThang = data;
                    }
                });
            }

            function getDataThuNhapNgay(chitieu = lastChiTieu,a = false) {
                
                $.ajax({
                    type: 'GET',
                    url: 'http://localhost:2511/LeoCris/thunhaphomnay',
                    dataType: 'text',
                    async: false,
                    success: function (data) {
                        y2Values = [];
                        y2Values.push(data);
                        if (data > chitieu) {
                            y2Values.push(0);
                        } else
                            y2Values.push(chitieu - data);
                        if (JSON.stringify(data) !== JSON.stringify(preThuNhapNgay))
                            renderBieuDoNgay(chitieu);
                        if(a){
                            lastChiTieu = chitieu;
                            alert(lastChiTieu);
                            renderBieuDoNgay(chitieu);
                        }
                        preThuNhapNgay = data;
                    }
                });
            }
            function getDataTopSanPham() {
                $.ajax({
                    type: 'GET',
                    url: 'http://localhost:2511/LeoCris/topsanpham',
                    async: false,
                    success: function (data) {
                        renderSanPham(data);
                    }
                });
            }

            function getDataTopNguoiDung() {
                $.ajax({
                    type: 'GET',
                    async: false,
                    url: 'http://localhost:2511/LeoCris/topnguoidung',
                    async: false,
                    success: function (data) {
                        renderNguoiDung(data);
                    }
                });
            }

            function getDataDanhMuc() {
                $.ajax({
                    type: 'GET',
                    url: 'http://localhost:2511/LeoCris/dabantheodoanhmuc',
                    async: false,
                    success: function (data) {
                        lablesDanhMuc = [];
                        soDaBanDM = [];
                        for (let i = 0; i < data.length; i++) {
                            lablesDanhMuc.push(data[i].name);
                            soDaBanDM.push(data[i].tongSPDaBan);
                        }
                        if (JSON.stringify(data) !== JSON.stringify(preDoanhMuc))
                            renderBieuDoDanhMuc();
                        preDoanhMuc = data;

                    }
                });
            }

            function renderBieuDoNgay(chitieu) {
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

                        tooltips: {
                            callbacks: {
                                label: function (tooltipItem, data) {
                                    var value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
                                    return xuLyTien(value) + "₫";
                                }
                            }
                        },

                        title: {
                            display: true,
                            text: "Chỉ tiêu: " + xuLyTien(chitieu) + "₫"
                        }

                    }
                });
            }




            function renderBieuDoThang() {
                new Chart("bieu-do-thang", {
                    type: "line",
                    data: {
                        labels: days,
                        datasets: [{
                            label: "Doanh thu",
                            fill: true,
                            lineTension: 0.2,
                            backgroundColor: "rgba(57, 223, 57, 0.2)",
                            borderColor: "rgb(57, 223, 57)",
                            data: thuNhapThang
                        }]
                    },
                    options: {

                        tooltips: {
                            callbacks: {
                                label: function (tooltipItem, data) {
                                    var value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
                                    return xuLyTien(value) + "₫";
                                }
                            }
                        },
                        scales: {

                            yAxes: [{
                                ticks: {
                                    beginAtZero: true,
                                    callback: function (value, index, values) {
                                        return xuLyTien(value) + "₫";
                                    }
                                }
                            }]
                        }

                    }
                });
            }
            function renderBieuDoDanhMuc() {
                new Chart("bieu-do-danh-muc", {
                    type: 'radar',
                    data: {
                        labels: lablesDanhMuc,
                        datasets: [{
                            label: "Số lượng đã bán",
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgb(54, 162, 235)',
                            pointBackgroundColor: 'rgb(54, 162, 235)',
                            pointBorderColor: '#fff',
                            pointHoverBackgroundColor: '#fff',
                            pointHoverBorderColor: 'rgb(54, 162, 235)',
                            data: soDaBanDM
                        }]
                    },
                    options: {
                        scale: {
                            pointLabels: {
                                fontSize: 20
                            }
                        },
                        elements: {
                            line: {
                                borderWidth: 3
                            }
                        }

                    },
                })
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
            function renderSanPham(data) {
                let html = "<div class=\"ten-div\">" +
                    "Top sản phẩm <br>" +
                    "<span class=\"thong-tin-them\">Bán chạy nhất</span>" +
                    "</div>";


                for (let i = 0; i < data.length; i++) {

                    html +=
                        "<div class=\"san-pham\">" +
                        " <div class=\"anh-sp\">" +
                        "<img src=\"" + data[i].imageLinks[0] + "\" alt=\"\" class=\"full\">" +
                        "</div>" +
                        "<div class=\"chi-tiet thong-tin-chinh\">" +
                        data[i].name + "<br>" +
                        "<span class=\"thong-tin-them\">Item: #" + data[i].productId + "</span>" +
                        "</div>" +
                        "<div class=\"gia thong-tin-chinh\">" + xuLyTien(data[i].price) + "₫</div>" +
                        "</div>";
                }
                document.getElementById("top-san-pham").innerHTML = html;
            }

            function renderNguoiDung(data) {
                let html = "<div class=\"ten-div\">" +
                    "Top người dùng <br>" +
                    "<span class=\"thong-tin-them\">Mua nhiều nhất trong tháng</span>" +
                    "</div>";


                for (let i = 0; i < data.length; i++) {

                    html +=
                        "<div class=\"san-pham\">" +
                        " <div id = \"stt\" class = \"thong-tin-chinh\" >" +
                        (i + 1).toString() +
                        ". </div>" +
                        "<div class=\"chi-tiet thong-tin-chinh\">" +
                        data[i].fullname + "<br>" +
                        "<span class=\"thong-tin-them\">User: #" + data[i].user_id + "</span>" +
                        "</div>" +
                        "<div class=\"gia thong-tin-chinh\">" + xuLyTien(data[i].tongdaban) + "₫</div>" +
                        "</div>";
                }
                document.getElementById("top-nguoi-dung").innerHTML = html;
            }
   
            let modal = document.getElementById("myModal");
            let btn = document.getElementById("myBtn");
            let span = document.getElementsByClassName("close")[0];
            btn.onclick = function () {
                modal.style.display = "block";
            }
            span.onclick = function () {
                modal.style.display = "none";
                chitieu = document.getElementById("modal-text").value;
            }
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

            function CaiDatChiTieu(){
                let a = document.getElementById("modal-text");
                getDataThuNhapNgay(a.value,true);
                let modal = document.getElementById("myModal");
                modal.style.display = "none"
            }
            function HuyModal(){
                let modal = document.getElementById("myModal");
                modal.style.display = "none";
            }
        </script>
     
        </html>