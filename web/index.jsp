<!--<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>-->
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- 
        LAYOUT
        1. Header
        2. Banner/Slider
        3. Nav (horizontal/vertical)
        4. Content
        5. Footer
     -->

     <!-- 
        Responsive
        1. PC (>=1024 px)
        2. Tablet(>=704px and <1024px)
        3. Mobile(<740px)
     -->

     <!-- 
        Git
        1. git checkout -f (pull Error)
        2. git push -f origin master (push Error)
        3. git push --set-upstream origin test-branch (add branch)
      -->

      <!-- 
        flex-direction: horizontally or vertically.
        flex-wrap: next line.
        align-items: cross axis.
        justify-content: main axis.
        align-self: apply with one element.
        flex-grow: size of each element (larger).
        flex-shrink: size of each element (smaller).
        order: the order of elements.
        flex: 
       -->

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Toi Cr</title>

    <link rel="stylesheet" href="./assets/css/footer.css">
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
    <div class="header" w3-include-html="./includes/header.html"></div>

    <div id="slider">
        <div class="slider__main">
            <img src="./assets/img/rosi1.jpg" id="slider__img">
            <div class="control prev"><i class="fa-sharp fa-solid fa-chevron-left"></i></i></div>
            <div class="control next"><i class="fa-sharp fa-solid fa-chevron-right"></i></div>
            <div class="control play"><i class="fa-solid fa-play"></i></div>
            <div class="control stop"><i class="fa-solid fa-stop"></i></div>
        </div>
    </div>

    <footer class="footer-distributed" w3-include-html="./includes/footer.html"> </footer>
    <div w3-include-html="./includes/modal.html"></div>
    <script src="./js/main.js"> </script>
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
        setTimeout(addModalJs, 1000);
    </script>
</body>
</html>