<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/popup.css">

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
        <div class="rect">
            <img src="images/image%201.png">
            <div class="card-title">
                Almaty
            </div>
            <div class="card-date">
                2 Nov - 10 Dec
            </div>
            <a href="more.jsp" class="more">More details</a>
        </div>
        <div class="rect">
            <img src="images/image%201.png">
            <div class="card-title">
                Almaty
            </div>
            <div class="card-date">
                2 Nov - 10 Dec
            </div>
            <a href="more.jsp" class="more">More details</a>
        </div>
        <div class="rect">
            <img src="images/image%201.png">
            <div class="card-title">
                Almaty
            </div>
            <div class="card-date">
                2 Nov - 10 Dec
            </div>
            <a href="more.jsp" class="more">More details</a>
        </div>
    </div>
    <div id="act">
        <a href="index.jsp">
            <button>Create a new booking</button>
        </a>
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


<div id="pop-cover">
    <div id="pop-rect">
        <a href="bookings.jsp"><img src="images/close%201.svg" id="close"></a>
        <img src="images/arrow%20right.svg" id="arrow1">
        <img id="hotel" src="images/hotel-room-design-trends-italianbark-interior-design-blog%201.png">
        <img src="images/arrow%20right.svg" id="arrow2">
        <div id="more-main-info">
            <div id="rect-title">
                Single-Bed Room
            </div>
            <div id="location">
                <img src="images/place.svg">
                <div id="location-title">Paris, France</div>
            </div>
            <div id="check">
                <div id="check-in">
                    <div class="title">
                        Check-in
                    </div>
                    <div class="date">
                        Sunday, Oct 25
                    </div>
                    <div class="time">
                        15.00
                    </div>
                </div>
                <div id="check-out">
                    <div class="title">
                        Check-out
                    </div>
                    <div class="date">
                        Friday, Oct 30
                    </div>
                    <div class="time">
                        15.00
                    </div>
                </div>
            </div>
            <div id="gen-info">
                <div id="title">
                    General Information
                </div>
                <div id="num">
                    Number of occupants: 3 people
                </div>
                <div id="price">
                    Price: $156.79
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>