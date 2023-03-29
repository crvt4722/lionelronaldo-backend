<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Toi Cr</title>

    <link rel="stylesheet" href="./assets/css/footer.css">
    <link rel="stylesheet" href="./assets/css/vote.css">
    <link rel="stylesheet" href="./assets/css/comunity.css">

    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/base.css">
    <link rel="stylesheet" type="text/css"  type="text/css"href="./assets/css/main.css">
    <link rel="stylesheet" type="text/css" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">

    <link rel="icon" href="./assets/img/logo.jpg" type="image/x-icon" />

    <!-- ReactJs -->
    <script src="https://unpkg.com/react@18/umd/react.development.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js" crossorigin></script>
    <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

    <script src="./includes/include.js"></script>
</head>
<body>
    <div class="header" w3-include-html="./includes/header.html"></div>

    <div class="container">
        <div class="slogan">
            <span>Who's the best?</span>
        </div>

        <div class="items">
            <div class="control prev"><i class="fa-sharp fa-solid fa-chevron-left"></i></i></div>
            <div class="item first">
                <img src="./assets/img/career/2008-2009/head-avatar.jpg" alt="">
                <input type="radio" name="player" id="first-section" value="Cristiano Ronaldo">
                <label for="first-section">Cristiano Ronaldo</label>
            </div>
    
            <div class="item second">
                <img src="./assets/img/career/2017-2018/head-avatar.jpg" alt="">
                <input type="radio" name="player" id ="second-section" style="font-size: 20px;">
                <label for="second-section">Cristiano Ronaldo</label>
            </div>
    
            <div class="item third">
                <img src="./assets/img/career/2022-2023/head-avatar.jpg" alt="">
                <input type="radio" name="player" id = "third-section">
                <label for="third-section">Cristiano Ronaldo</label>
            </div>
            <div class="control next"><i class="fa-sharp fa-solid fa-chevron-right"></i></div>
        </div>

        <button>Statistics</button>
    </div>

    <footer class="footer-distributed" w3-include-html="./includes/footer.html"> </footer>
    <script>
        const messageForm = document.querySelector('.message-form')
        messageForm.addEventListener('submit', (e) =>{
            e.preventDefault()
            const messageBox = document.querySelector('.message-box')
            messageBox.scrollTop = messageBox.scrollHeight
        })
    </script>
    <script>
        includeHTML();
    </script>
</body>
</html>