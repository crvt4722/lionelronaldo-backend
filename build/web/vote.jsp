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
    <link rel="stylesheet" href="./assets/css/modal.css">

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
            
        </div>

        <div class="btn">
            <button onclick = renderSlider()>Back</button>
            <button onclick = submitSection()>Submit</button>
            <button onclick = analysChart()>Statistics</button>
        </div>
    </div>

    <footer class="footer-distributed" w3-include-html="./includes/footer.html"> </footer>
    <div w3-include-html="./includes/modal.html"></div>
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="text/babel" src="js/vote-react.js"> </script>
    
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
</body>
</html>