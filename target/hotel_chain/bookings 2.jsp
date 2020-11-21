<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upcoming Bookings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/bookings.css">

</head>
<body>
<div>
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
                    <a href="bookings.jsp" class="nav-link link">My Bookings</a>
                </li>
                <li class="nav-item">
                    <a href="index.jsp" class="nav-link link">Log-out</a>
                </li>
            </ul>
        </div>
    </nav>
</div>


<div id="main">
    <div id="main-title">
        My bookings
    </div>
    <div id="choose">
        <a href="bookings.jsp">Upcoming</a>
        <a href="finished.jsp">Finished</a>
    </div>
    <div id="rectangles">
        <div class="oops">
            You don't have any upcoming bookings!
        </div>
    </div>

    <div id="act">
        <a href="search.jsp">
            <button class="newbooking-btn">Create a new booking</button>
        </a>
    </div>
</div>
<!--POP UP WINDOW-->
<div class="modals">
    <div class="modal" id="myModal">
        <!-- Modal content -->
        <div class="close">&times;</div>
        <div class="modal-content">
            <div class="modal-body">
                <img id="room-img" src="images/popup.png">
                <div class="info-body">
                    <div class="info-title">
                        <div class="room-type" >Room-type</div>
                        <div class="location-box">
                            <img id="location-img" src="images/place.svg">
                            <div class="location">City, Country</div>
                        </div>
                    </div>
                    <div id="info">
                        <div id="dates">
                            <div class="check-in">
                                <span class="titles">Check-in</span>
                                <div class="date">Weekday, Date</div>
                                <div class="time">Time</div>
                            </div>
                            <div class="check-out">
                                <div class="titles">Check-out</div>
                                <div class="date">Weekday, Date</div>
                                <div class="time">Time</div>
                            </div>
                        </div>
                        <div class="gen-info">
                            <div class="titles">General Information</div>
                            <div class="capacity">Number of occupants: <span class="room-capacity"> 3 </span> person(s)</div>
                            <div class="price">Price: $ <span class="room-price">150.0</span></div>
                        </div>
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
                <li><h6 class="link">©SWE project 2020. All rights reserved</h6></li>
            </ul>
        </div>
    </div>
</div>
<script src="constants/catalog.js"></script>

<script src="components/Header/Header.js"></script>

<script src="components/Products/Products.js"></script>

<script src="components/Shopping/Shopping.js"></script>

<script src="utils/localStorageUtil.js"></script>
<script src="bookings.js"></script>
</body>
</html>