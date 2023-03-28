<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Toi Cr</title>

    <link rel="stylesheet" href="./assets/css/footer.css">
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

        <div class="chat-box">
            <!-- <label for="">Send to: </label> -->
            <div class="receiver-section">
                <label for="">Gửi tới: </label>
                <select>
                    <option value="everyone">Everyone</option>
                    <option value="ronaldo">Ronaldo</option>
                    <option value="messi">Messi</option>
                    <option value="benzema">Benzema</option>
                    <option value="neymar">Neymar</option>
                </select>
            </div>

            <ul class="message-box">
                <li>Tá»i Cr: HÃ­ anh em!</li>
                <li>Minh Cr: HÃ­ anh em!</li>
                <li>Leo Nguyá»n: HÃ­ anh em!</li>
                <li>HoÃ ng Ãc BÃ²: HÃ­ anh em!</li>
                <li>VÃµ TÃ²ng Äáº£ há»: HÃ­ anh em!</li>
                <li>Äá» thÃ¡nh: HÃ­ anh em!</li>
                <li>KiÃªn Jr: HÃ­ anh em!</li>
                <li>Leo Cr: HÃ­ anh em!</li>
                <li>HoÃ ng Cr: HÃ­ anh em!</li>
                <li>HoÃ ng Cr: HÃ­ anh em!</li>
                <li>HoÃ ng Cr: HÃ­ anh em!</li>
                <li>HoÃ ng Cr: HÃ­ anh em!</li>
                <li>HoÃ ng Cr: HÃ­ anh em!</li>
                <li>HoÃ ng Cr: HÃ­ anh em!</li>
                <li>HoÃ ng Cr: HÃ­ anh em!</li>
                <li>HoÃ ng Cr: HÃ­ anh em!</li>
                <li>HoÃ ng Cr: HÃ­ anh em!</li>
                
            </ul>

            <form    class="message-form" action="\" method="post">
                <div class="input-form">
                    <label for="name">Tên hiển thị</label>
                    <input id = 'name' type="text" name="name-shown">
                </div>

                <div class="input-form">
                    <label for="message-content">Nội dung</label>
                    <input id = 'message-content'type="text" name="message">

                    <button type="submit">Gá»­i</button>
                </div>
            </form>
        </div>

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