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
    String beds = (String) request.getAttribute("beds");
    String room_id = (String) request.getAttribute("room_id");
    List<searchRoom> rooms = (ArrayList<searchRoom>)request.getAttribute("roomlist");
    int listSize = rooms.size();
    int countEmpty = 0;
    String prices = null;
    for (searchRoom room:rooms){
        if(room.getOccupied().equals("0")){
            countEmpty++;
        }
        prices = room.getPrice();
    }

%>


<!DOCTYPE html>
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
                <a href="login-all.jsp" class="nav-link link">Login</a>
            </li>
            <li class="nav-item">
                <a href="signup.jsp" class="nav-link link">Sign-up</a>
            </li>
        </ul>
    </div>
</nav>

<div id="header"></div>
<div id="products"></div>
<div id="shopping"></div>
<div id="spinner"></div>
<div id="error"></div>

<!-- Constants and Utils -->
<script src="constants/root.js"></script>
<script src="utils/localStorageUtil.js"></script>

<!-- Header -->
<script src="components/Header/Header.js"></script>
<link rel="stylesheet" href="components/Header/Header.css">

<!-- Products -->
<script src="components/Products/Products.js"></script>
<link rel="stylesheet" href="components/Products/Products.css">

<!-- Shopping -->
<script src="components/Shopping/Shopping.js"></script>
<link rel="stylesheet" href="components/Shopping/Shopping.css">

<!-- Spinner -->
<script src="components/Spinner/Spinner.js"></script>
<link rel="stylesheet" href="components/Spinner/Spinner.css">

<!-- Error -->
<script src="components/Error/Error.js"></script>
<link rel="stylesheet" href="components/Error/Error.css">

<script src="search.js"></script>

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
