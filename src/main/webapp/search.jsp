<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/search.css">
</head>
<body>
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
                    <a href="login.jsp" class="nav-link link">Login</a>
                </li>
                <li class="nav-item">
                    <a href="signup.jsp" class="nav-link link">Sign-up</a>
                </li>
            </ul>
        </div>
    </nav>
    
    <div class="main">
        <h1 class="search-hotel-name">de Vieras Almaty</h1>

        <div class="container">
            <div class="booking-item">
                <div class="row">
                    <div class="col-sm">
                        <div class="booking-item-pic">
                            <img src="images/room.png" class="booking-item-img">
                        </div>
                    </div>
                    <div class="col-sm">
                        <div class="booking-item-description">
                            <h3 class="room-type">Double</h3>
                            <ul class="facilities-list">
                                <li class="facility-item"> 1 guest</li>
                                <li class="facility-item"> 1 bed </li>
                                <li class="facility-item"> Mountains</li>
                            </ul>
                            <p class="room-description">Prekrasnaya super comnata s 
                                vidom na gory v zolotom kvadrate
                            </p>
                            <h3 class="room-price">800$ per night</h3>
                            <h2 class="room-price-total">1600$ in total</h2>
                            <h3 class="date-interval"> 2 Nov - 4 Dec </h3>
                            <button class="book-btn">Book now</button>
                       </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="booking-item">
                <div class="row">
                    <div class="col-sm">
                        <div class="booking-item-pic">
                            <img src="images/room.png" class="booking-item-img">
                        </div>
                    </div>
                    <div class="col-sm">
                        <div class="booking-item-description">
                            <h3 class="room-type">Double</h3>
                            <ul class="facilities-list">
                                <li class="facility-item"> 1 guest</li>
                                <li class="facility-item"> 1 bed </li>
                                <li class="facility-item"> Mountains</li>
                            </ul>
                            <p class="room-description">Prekrasnaya super comnata s 
                                vidom na gory v zolotom kvadrate
                            </p>
                            <h3 class="room-price">800$ per night</h3>
                            <h2 class="room-price-total">1600$ in total</h2>
                            <h3 class="date-interval"> 2 Nov - 4 Dec </h3>
                            <button class="book-btn">Book now</button>
                       </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="booking-item">
            <div class="row">
                <div class="col-sm">
                    <div class="booking-item-pic">
                        <img src="images/room.png" class="booking-item-img">
                    </div>
                </div>
                <div class="col-sm">
                    <div class="booking-item-description">
                        <h3 class="room-type">Double</h3>
                        <ul class="facilities-list">
                            <li class="facility-item"> 1 guest</li>
                            <li class="facility-item"> 1 bed </li>
                            <li class="facility-item"> Mountains</li>
                        </ul>
                        <p class="room-description">Prekrasnaya super comnata s 
                            vidom na gory v zolotom kvadrate
                        </p>
                        <h3 class="room-price">800$ per night</h3>
                        <h2 class="room-price-total">1600$ in total</h2>
                        <h3 class="date-interval"> 2 Nov - 4 Dec </h3>
                        <button class="book-btn">Book now</button>
                   </div>
                </div>
            </div>
        </div>
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
                    <li><h6 class="link">Â©SWE project 2020. All rights reserved</h6></li>
                </ul>
            </div>
        </div>
    </div>

    <script src="js/search.js"></script>
</body>
</html>