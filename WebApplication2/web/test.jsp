<%-- 
    Document   : test
    Created on : Apr 30, 2023, 5:22:51 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="main">
            <div class="app">
                <h2>DANH SACH USER</h2>
                <ul class="courses-box">

                </ul>
            </div>
        </div>
        <!--<script src="/index.js"></script>-->
    </body>

    <script>
        let coursesBoxElement = document.querySelector('.courses-box');
        let coursesApi = 'http://localhost:8080/WebApplication2/NewServlet1';

        function start() {
            getUsers();
            // handleCreateCource();
        }

        start();

        function getUsers() {
            fetch(coursesApi)
                    .then(function (response) {
                        return response.json();
                    })
                    .then(function (users) {
                        renderUsers(users);
                    })
        }
        function renderUsers(users) {
            let html = '';
            for (let user of users) {
                html += "<h2>" + user.username + "</h2>" + "<br>";
            }
            coursesBoxElement.innerHTML = html;
            alert(html);
        }
    </script>
</html>
