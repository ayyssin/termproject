<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Log-in Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/login-manager.css">
</head>
<body>
<div id="bg">
    <nav class="navbar navbar-expand-sm " id="navbar">
        <a href="index.jsp" class="navbar-brand link">de Vieras</a>
        <button class="navbar-toggler navbar-dark" data-toggle="collapse" data-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarMenu">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item" id="navbarItems">
                    <a href="index.jsp" class="nav-link link">Home</a>
                </li>
                <li class="nav-item">
                    <a href="bookings.jsp" class="nav-link link">Your Bookings</a>
                </li>
                <li class="nav-item">
                    <a href="login-all.jsp" class="nav-link link">Login</a>
                </li>
                <li class="nav-item">
                    <a href="signup.jsp" class="nav-link link">Sign-up</a>
                </li>
            </ul>

        </div>
    </nav>

    <div class="container form-outer-container">
        <h1 class="form-header">Login</h1>
        <form action="<%= request.getContextPath() %>/managerLogin" method="post">
            <div class="form-group">
                <label for="emailInput">Email:</label>
                <input name="email" type="email" class="form-control" id='emailInput' placeholder="Enter email">
            </div>
            <div class="form-group">
                <label for="passwordInput">Password</label>
                <input name="password" type="password" class="form-control" id="passwordInput"
                       placeholder="Enter password">
            </div>
            <div class="form-check">
                <div class="row">
                    <div class="col-8">
                        <input type="checkbox" class="form-check-input" id="Ñheck1">
                        <label class="form-check-label" for="check1">Remember me</label>
                    </div>
                </div>
            </div>
            <div class="login-btn">
                <button type="submit" class="btn" id="login-btn">Login</button>
            </div>
        </form>
    </div>
</div>

<div class="footer">
    <div class="row footer">
        <div class="col-10">
            <ul class="list-unstyled footer-links">
                <li><a href="FAQ.jsp" class="link">FAQ</a></li>
                <li id="cu" class="link">Contact us:</li>
                <li class="phone">
                    <img src="images/phone.png" height="30" width="30">
                    <p class="link" id="phone-num">+7 777 777 77 77</p>
                </li>
                <li class="mail">
                    <img src="images/mail.png" id="mml">
                    <p class="link" id="maill"> devieras@nu.edu.kz</p>
                </li>
                <li><h6 class="link">©SWE project 2020. All rights reserved</h6></li>
            </ul>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
</body>
</html>