<%-- 
    Document   : dat-hang-thanh-cong
    Created on : May 30, 2023, 6:40:25 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" type="text/css"  type="text/css" href="./assets/css/base.css">
        <link rel="stylesheet" type="text/css"  type="text/css" href="./assets/css/main.css">
        <link rel="stylesheet" type="text/css"  type="text/css" href="./assets/css/footer.css">
        <link rel="stylesheet" type="text/css"  type="text/css" href="./assets/css/comunity.css">
        
        <link rel="stylesheet" type="text/css" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
        
        <script src="./includes/include.js"></script>
        
    </head>
    <style>
        body{
            margin: 0 0;
            padding: 0;
            top:0;
            right: 0;
            left: 0;
            bottom: 0;
        }
    </style>
    <body>
        <div class="header" w3-include-html="./includes/header.jsp"></div>
        <div class ="container" style= "display:flex; align-items: center; justify-content: center">
            <h1>Đặt hàng thành công!</h1>
        </div>
        <footer class="footer-distributed" w3-include-html="./includes/footer.html"> </footer>
        <script src="./js/header.js"> </script>
        <script>
            includeHTML();
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
