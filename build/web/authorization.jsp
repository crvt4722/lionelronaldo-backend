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
       <div class="chmod">
            <form class="update-permission" action='ProcessUpdatePermission' method = 'post'>
                <p style = "color:red" > <%= Validate.StringUtil((String) request.getAttribute("error1"))%> </p>
                <input type="email" name="email" id="" placeholder="Email">
                
                <div class='btn'>
                    
                    <div>
                        <input type="radio" name ="update-permission" value ="add" required>
                        <label>Cấp quyền</label>
                    </div>
                    
                    <div>
                        <input type="radio" name ="update-permission" value ="remove" required>
                        <label>Tước quyền</label>
                    </div>
                    
                </div>
                    <button type="submit">Gửi</button>
                
            </form>

            <form class="add-new" action = "ProcessSignupCTV" method = "post">
                <p style = "color:red"> <%= Validate.StringUtil((String) request.getAttribute("error2"))%> </p>
                <input id='fullname__signup' type="text" name = "fullname" required placeholder="Họ và tên">
                <input id='email__signup' type='email' name = "email" required placeholder="Email">
                <input id='password__signup' type='password' name = "password" required placeholder="Mật khẩu">
                <input id='repassword__signup' type='password' name ="repassword" required placeholder="Nhập lại mật khẩu">
                <div class="btn">
                    <button type="submit" class="signup-btn">Đăng ký CTV</button>
                </div>
            </form>
       </div>
       <div class="stats">
        <p>Danh sách cộng tác viên của LionelRonaldo</p>
        <table class="table-data">
            <tr>
                <th>STT</th>
                <th>Họ và tên</th>
                <th>Email</th>
                <!--<th>Thâm niên</th>-->
            </tr>
            <% 
                ArrayList<UserProfile> ctvList = (ArrayList<UserProfile>) session.getAttribute("ctvlist");
                int stt = 1;
            %>
            
            <% if (ctvList != null) {%>
            <%for(UserProfile x : ctvList){%>
            <tr>
                <td><%=stt++%></td>
                <td><%=x.getFullname()%></td>
                <td><%=x.getEmail()%></td>
            </tr>
            <%} }%>
            </tr>
        </table>
       </div>
    </div>

    <footer class="footer-distributed" w3-include-html="./includes/footer.html"> </footer>


    <script src="./js/header.js"> </script>
    <script>
        includeHTML();
        
        function controllPermission(){
            let xhr = new XMLHttpRequest()
            xhr.open('GET', 'http://localhost:8080/LeoCris/ProcessAuthorizationPermission', true)
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
                xhr.open('POST', 'http://localhost:8080/LeoCris/ProcessLogout', true)
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