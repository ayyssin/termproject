<%@ page import="java.util.Date" %>
<%@ page import="search.hotel_model.searchRoom" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.swing.plaf.synth.SynthLookAndFeel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<% String city = request.getParameter("City"); %>
<% String guests = request.getParameter("guests"); %>
<% String date_in = request.getParameter("date_in"); %>
<% String date_out = request.getParameter("date_out");
    String login=(String)session.getAttribute("userLogin");
%>
<%
    String[][] allRooms = (String[][]) request.getAttribute("allRoom");
%>

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
                <a href="login-all.jsp" class="nav-link link">Login</a>
            </li>
            <li class="nav-item">
                <a href="signup.jsp" class="nav-link link">Sign-up</a>
            </li>
        </ul>
    </div>
</nav>

<div class="main">
    <div class = "row">
        <div class="col-sm">
            <h1 class="search-hotel-name">de Vieras <%=city %> <%=login%></h1>
        </div>
        <div class="col-sm" id="cart-button">
            <button type="button" class="cart-button">
                <span class="glyphicon glyphicon-shopping-cart"></span> My cart
            </button>
        </div>
    </div>
    <div class="modal-cart">
        <div class="modal-content">
            <div class="modal-header">
                <h3>My cart</h3>
                <span class="close">&times;</span>
            </div>
            <div class="modal-body">

            </div>

            <div class="modal-confirmation">
                <button type="submit" class="btn" id="confirm-btn">
                    Confirm
                </button>
            </div>
        </div>
    </div>
    <c:set var="val" value="<%=guests%>"/>
    <%
        if(guests.equals("2")){
    %>
    <div class="container">
        <div class="booking-item">
            <div class="row">
                <div class="col-sm">
                    <div class="booking-item-pic">
                        <img src="images/room.png" class="booking-item-img">
                    </div>
                </div>
                <div class="col-sm">
                    <div class="booking-item-description" id="double">
                        <h3 class="room-type">Double</h3>
                        <ul class="facilities-list">
                            <li class="facility-item"><%=guests%> guest(s)</li>
                            <li class="facility-item"><%=allRooms[1][3]%> bed(s)</li>
                            <li class="facility-item"> Mountains</li>
                        </ul>
                        <p class="room-description">A good room with all-included features needed for couples stay.
                        </p>
                        <h3 class="room-price"><%=allRooms[1][2]%>$ per night</h3>
                        <h3 class="date-interval"> <%=date_in%> - <%=date_out%> </h3>
                        <%if(allRooms[1][1].equals('0')){%>
                            <p class="no-rooms"> No available rooms. </p>
                        <%}%>
                        <div class="bookings-quantity">
                            <label for="quantity"></label>
                            <select name="quantity" id="input-quantity double">
                                <option value="0">Choose</option>
                                <%for(int i = 1; i < (Integer.parseInt(allRooms[1][1])+1); i++){ %>
                                <option value="<%=i%>"><%=i%> room(s)</option>
                                <%}%>
                            </select>
                        </div>
                        <button class="book-btn" onclick="bookNow(this)">Add to the cart</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%
}
else if(guests.equals("1")){

%>
<div class="container">
    <div class="booking-item">
        <div class="row">
            <div class="col-sm">
                <div class="booking-item-pic">
                    <img src="images/room.png" class="booking-item-img">
                </div>
            </div>
            <div class="col-sm">
                <div class="booking-item-description" id="single">
                    <h3 class="room-type">Single</h3>
                    <ul class="facilities-list">
                        <li class="facility-item"><%=guests%> guest(s)</li>
                        <li class="facility-item"><%=allRooms[0][3]%> bed(s)</li>
                        <li class="facility-item"> Mountains</li>
                    </ul>
                    <p class="room-description">A room offering everything necessary for a comfortable stay.
                    </p>
                    <h3 class="room-price"><%=allRooms[0][2]%>$ per night</h3>
                    <h3 class="date-interval"> <%=date_in%> - <%=date_out%> </h3>
                    <%if(allRooms[0][1].equals('0')){%>
                    <p class="no-rooms"> No available rooms. </p>
                    <%}%>
                    <div class="bookings-quantity">
                        <select name="quantity" id="input-quantity single">
                            <option value="0">Choose</option>
                            <%for(int i = 1; i < (Integer.parseInt(allRooms[0][1])+1); i++){ %>
                            <option value="<%=i%>"><%=i%> room(s)</option>
                            <%}%>
                        </select>
                    </div>
                    <button class="book-btn" onclick="bookNow(this)">Add to the cart</button>
            </div>
        </div>
    </div>
</div>

<%
}
else if(guests.equals("3")){

%>
<div class="container">
    <div class="booking-item">
        <div class="row">
            <div class="col-sm">
                <div class="booking-item-pic">
                    <img src="images/room.png" class="booking-item-img">
                </div>
            </div>
            <div class="col-sm">
                <div class="booking-item-description" id="triple">
                    <h3 class="room-type">Triple</h3>
                    <ul class="facilities-list">
                        <li class="facility-item"><%=guests%> guest(s)</li>
                        <li class="facility-item"><%=allRooms[2][3]%> bed(s)</li>
                        <li class="facility-item"> Mountains</li>
                    </ul>
                    <p class="room-description">A room perfectly equipped for traveling friends or business partners.
                    </p>
                    <h3 class="room-price"><%=allRooms[2][2]%>$ per night</h3>
                    <h3 class="date-interval"> <%=date_in%> - <%=date_out%> </h3>
                    <%if(allRooms[2][1].equals('0')){%>
                    <p class="no-rooms"> No available rooms. </p>
                    <%}%>
                    <div class="bookings-quantity">
                        <label for="quantity"></label>
                        <select name="quantity" id="input-quantity triple">
                            <option value="0">Choose</option>
                            <%for(int i = 1; i < (Integer.parseInt(allRooms[2][1])+1); i++){ %>
                            <option value="<%=i%>"><%=i%> room(s)</option>
                            <%}%>
                        </select>
                    </div>
                    <button class="book-btn" onclick="bookNow(this)">Add to the cart</button>
                </div>
            </div>
        </div>
    </div>
</div>

<%
}
else if(guests.equals("4")){
%>
<div class="container">
    <div class="booking-item">
        <div class="row">
            <div class="col-sm">
                <div class="booking-item-pic">
                    <img src="images/room.png" class="booking-item-img">
                </div>
            </div>
            <div class="col-sm">
                <div class="booking-item-description" id="quad">
                    <h3 class="room-type">Quad</h3>
                    <ul class="facilities-list">
                        <li class="facility-item"><%=guests%> guest(s)</li>
                        <li class="facility-item"><%=allRooms[3][3]%> bed(s)</li>
                        <li class="facility-item"> Mountains</li>
                    </ul>
                    <p class="room-description">Great choice for a relaxing vacation for families with children or a group of friends.
                    </p>
                    <h3 class="room-price"><%=allRooms[3][2]%>$ per night</h3>
                    <h3 class="date-interval"> <%=date_in%> - <%=date_out%> </h3>
                    <%if(allRooms[3][1].equals('0')){%>
                    <p class="no-rooms"> No available rooms. </p>
                    <%}%>
                    <div class="bookings-quantity">
                        <label for="quantity"></label>
                        <select name="quantity" id="input-quantity quad">
                            <option value="0">Choose</option>
                            <%for(int i = 1; (i < Integer.parseInt(allRooms[3][1])+1); i++){ %>
                            <option value="<%=i%>"><%=i%> room(s)</option>
                            <%}%>
                        </select>
                    </div>
                    <button class="book-btn" onclick="bookNow(this)">Add to the cart</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%}
else if (guests.equals("6") || guests.equals("5")){
%>

<div class="container">
    <div class="booking-item">
        <div class="row">
            <div class="col-sm">
                <div class="booking-item-pic">
                    <img src="images/room.png" class="booking-item-img">
                </div>
            </div>
            <div class="col-sm">
                <div class="booking-item-description" id="president">
                    <h3 class="room-type">President Suite</h3>
                    <ul class="facilities-list">
                        <li class="facility-item"><%=guests%> guest(s)</li>
                        <li class="facility-item"><%=allRooms[4][3]%> bed(s)</li>
                        <li class="facility-item"> Mountains</li>
                    </ul>
                    <p class="room-description">A lux type room which offers breathtaking views from every aspect.
                    </p>
                    <h3 class="room-price"><%=allRooms[4][2]%>$ per night</h3>
                    <h3 class="date-interval"> <%=date_in%> - <%=date_out%> </h3>
                    <%if(allRooms[4][1].equals('0')){%>
                    <p class="no-rooms"> No available rooms. </p>
                    <%}%>
                    <div class="bookings-quantity">
                        <label for="quantity"></label>
                        <select name="quantity" id="input-quantity president">
                            <option value="0">Choose</option>
                            <%for(int i = 1; i < (Integer.parseInt(allRooms[4][1])+1); i++){ %>
                            <option value="<%=i%>"><%=i%> room(s)</option>
                            <%}%>
                        </select>
                    </div>
                    <button class="book-btn" onclick="bookNow(this)">Add to the cart</button>
                </div>
            </div>
        </div>
    </div>
</div>

<%
    }
%>
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

<script src="constants/catalog.js"></script>
<script src="bookingsStorage.js"></script>
<script src="searchNew.js"></script>

</body>
</html>
