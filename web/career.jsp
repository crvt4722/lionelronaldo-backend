<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Toi Cr</title>

        <link rel="stylesheet" href="./assets/css/footer.css">
        <link rel="stylesheet" href="./assets/css/career.css">
        <link rel="stylesheet" href="./assets/css/modal.css">
        
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/base.css">
        <link rel="stylesheet" type="text/css"  type="text/css"href="./assets/css/main.css">
        <link rel="stylesheet" type="text/css" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
        <link rel="icon" href="./assets/img/logo.jpg" type="image/x-icon" />
        <script src="https://kit.fontawesome.com/d4acca2111.js" crossorigin="anonymous"></script>
        <!-- ReactJs -->

        <script src="https://unpkg.com/react@18/umd/react.development.js" crossorigin></script>
        <script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js" crossorigin></script>
        <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

    </head>
    <script src="./includes/include.js"></script>
<body>
    <!-- <div class="header" w3-include-html="./includes/header.html"></div> -->

    <div id="header">
        <div class="header-wrapper">
            <div class="slogan">We ride together we die together</div>
            <div class="header-wrapper__icon">
                <a href="#"><i class="fa-brands fa-facebook"></i></a>
                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                <a href="#"><i class="fa-brands fa-youtube"></i></a>
            </div>
        </div>
        <div class="main-menu">
            <div class="main-menu__items">
                <div class="main-menu__items__img">
                    <img  src="./assets/img/web_name.jpg">
                </div>
                <div class="main-menu__item"><a href="index.html">Home</a></div>
                <div class="main-menu__item item--career">
                    <a href="career.jsp">player info</a>
                </div>
                <div class="main-menu__item item--auction"><a href="vote.jsp">Who's the best</a></div>
                <div class="main-menu__item item--comunity"><a href="comunity.jsp">Comunity</a></div>
                
            </div>

            <div class="search-login">
                <input type="text" name="" id="" placeholder='Track your order by username...'>
                <i class="fa-solid fa-magnifying-glass"></i>
                <div class="login-btn" style="cursor: pointer">Login</div>
            </div>
        </div>    
    </div>

    <div class="sidebar"></div>

    <div class="career-content">
        <div class="career-head"></div>

        <div class="career__moment"></div>

        <div class="career__video"></div>

        <div class="career__shirts club__shirts"></div>

        <div class="career__shirts nation__shirts"></div>
    </div> 

    <div w3-include-html="./includes/modal.html"></div>
</body>
    

   <script type="text/babel" src="./js/career-content-react.js"></script>

    <script src="./js/career.js"></script>
    <script>
        function addModalJs(){
            const modal = document.querySelector('.modal')
            const modalLogin = document.querySelector('.modal.login')
            const modalSignup = document.querySelector('.modal.signup')

            const modalContainer = document.querySelector('.modal-container')
            const modalContainerLogin = document.querySelector('.modal-container__login')
            const modalContainerSignup = document.querySelector('.modal-container__signup')

            const modalClose = document.querySelector('.modal-close')
            const modalCloseLogin = document.querySelector('.modal-close__login')
            const modalCloseSignup = document.querySelector('.modal-close__signup')


            const loginBtn = document.querySelector('.login-btn')

            function showModal(modal){
                modal.classList.add('open')
            }

            function hideModal(modal){
                modal.classList.remove('open')
            }

            loginBtn.addEventListener('click', showModal.bind(this, modalLogin))
            modalCloseLogin.addEventListener('click', hideModal.bind(this, modalLogin))

            modalCloseSignup.addEventListener('click', hideModal.bind(this, modalSignup))

            modalClose.addEventListener('click', hideModal.bind(this, modal))


            modalSignup.addEventListener('click', hideModal.bind(this,modalSignup))
            modalLogin.addEventListener('click', hideModal.bind(this,modalLogin))
            modal.addEventListener('click', hideModal.bind(this,modal))


            modalContainer.addEventListener('click', (e) => e.stopPropagation())
            modalContainerLogin.addEventListener('click', (e) => e.stopPropagation())
            modalContainerSignup.addEventListener('click', (e) => e.stopPropagation())

            const loginLabels = document.querySelectorAll('.login-label')
            const signupLabels = document.querySelectorAll('.signup-label')

            function transfromToLogin(modalLogin, modalSignup){
                modalSignup.classList.remove('open')
                modalLogin.classList.add('open')
            }

            function transfromToSignup(modalLogin, modalSignup){
                modalSignup.classList.add('open')
                modalLogin.classList.remove('open')
            }

            for (let loginLabel of loginLabels){
                loginLabel.addEventListener('click', transfromToLogin.bind(this, modalLogin, modalSignup))
            }

            for(let signupLabel of signupLabels){
                signupLabel.addEventListener('click', transfromToSignup.bind(this, modalLogin, modalSignup))
            }
        }
        includeHTML();
        setTimeout(addModalJs, 2000);
    </script>

<body>
</html>



