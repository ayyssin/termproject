<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Desk Clerk Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/desk_clerk.css">

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
                    <a href="desk_clerk.jsp" class="nav-link link">My Profile</a>
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
</div>

<div id="main">
    <div class="createBtn">
        <a href="create_booking.jsp">
            <button id="create">Create a new booking</button>
        </a>
    </div>
    <div class="title">
        <div class="city">
            City
        </div>
        <div class="srch">
            <form action="search" class="srchh"><input type="search" name="search" placeholder="Search Guest"></form>
        </div>
    </div>
    <div id="rectangles">
        <div class="guest"><span class="gst"><span class="kk">GuestName, </span> <span>GuestID</span></span></div>
        <div>

        </div>

        <div class="rect">
            <div class="card-title">
                2 - 10 Nov, 2020
            </div>
            <ul id="card">
                <ul id="main-inf">
                    <li id="room-type">Room type: <span class="val">Double</span></li>
                    <li id="room-id">Room ID: <span class="val">0123</span></li>
                    <li id="occupancy">Occupancy: <span class="val">1 person(s)</span> </li>
                </ul>
                <li id="price">Total price: <span class="val">$1420</span></li>
                <li id="ed-b"><a id="edit" href="edit_booking.jsp">
                    Edit booking
                </a>
                <a id="cancel" href="">Cancel booking</a></li>
            </ul>
        </div>


        <div class="rect">
            <div class="card-title">
                1 - 9 Dec, 2020
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
</body>
</html>