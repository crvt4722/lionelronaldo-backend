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
                <img  src="./assets/img/web_name.jpg">
                <div class="main-menu__item"><a href="index.jsp">home</a></div>
                <div class="main-menu__item item--career">
                    <a href="career.jsp">career</a>
                    
                </div>
                <div class="main-menu__item item--auction"><a href="vote.jsp">auction</a></div>
                <div class="main-menu__item item--comunity"><a href="comunity.jsp">comunity</a></div>
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


    <div class="modal">
        <div class="modal-container">
            <div class="modal-header">
                <i class="modal-close fa-solid fa-xmark"></i>
                <div class="modal__web-name">
                    
                    <h3>    <span class="modal-header__span1">Lionel</span><span class="modal-header__span2">Ronaldo</span></h3>
                    <p>Be served you is our honor!</p>
                </div>
                
            </div>

            <div class="modal-content">

                <div class="label-container">
                    <label for="modal__full-name" class="modal-label" >
                        <i class="fa-sharp fa-solid fa-signature"></i> Full Name: 
                    </label>
    
                    <label for="modal__phone" class="modal-label">
                        <i class="fa-sharp fa-solid fa-phone"></i> Phone: 
                    </label>
    
                    <label for="modal__address" class="modal-label">
                        <i class="fa-sharp fa-solid fa-location-dot"></i> Address:
                    </label>
    
                    <label for="" class="modal-label">
                        <i class="fa-sharp fa-solid fa-shirt"></i> Size:
                    </label>
                    
                    <label for="" class="modal-label" style="transform:translateY(-3px)">
                        <i class="fa-sharp fa-solid fa-cart-plus"></i> Quantity:
                    </label> 
                </div>

                <div class="input-container">
                    <input id='modal__full-name' type="text" required>
                    <input id='modal__phone' type='tel' required>
                    <input id='modal__address' type='text' required>

                    <div class="input-container__radio">
                        <input type="radio" class="modal__radio-btn" id ='s' value="S" name = 'shirt-size'> <label for="s">S</label>
                        <input type="radio" class="modal__radio-btn" id ='m' value="M" name = 'shirt-size'> <label for="m">M</label>
                        <input type="radio" class="modal__radio-btn" id ='l' value="L" name = 'shirt-size'> <label for="l">L</label>
                        <input type="radio" class="modal__radio-btn" id ='xl' value="XL" name = 'shirt-size'> <label for="xl">XL</label>
                        <input type="radio" class="modal__radio-btn" id ='2xl' value="2XL" name = 'shirt-size'> <label for="2xl">2XL</label>
                        <input type="radio" class="modal__radio-btn" id ='3xl' value="3XL" name = 'shirt-size'> <label for="3xl">3XL</label>
                    </div>

                    <input type="number" name="" id="" min = "1" max = '100' value="1" class="input-container__quantity">
                </div>    
                <button type="submit" class="modal-submit-btn">submit <i class="fa-sharp fa-solid fa-circle-check"></i></button>
            </div>
        </div>
    </div>
</body>
    

   <script type="text/babel" src="./js/career-content-react.js">
    </script>

    <script src="./js/career.js"></script>

<body>
</html>

