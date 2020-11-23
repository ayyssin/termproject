<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="booking.booking_model.Booking" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Deque" %>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<% String employee_id = (String)session.getAttribute("userLogin"); %>
<% String hotel_id = (String)session.getAttribute("userLogin"); %>
<%SimpleDateFormat sdfDate = new SimpleDateFormat("dd/mm/yyyy"); %>
<%Date now = new Date();%>
<%String strDate = sdfDate.format(now);%>
<%Date curDate=new SimpleDateFormat("dd/mm/yyyy").parse(strDate);%>
<% %>
<%
    List<Booking> list = (ArrayList<Booking>)request.getAttribute("bookingList");



    for(Booking b:list){
        System.out.println("email: " + b.getUser_email());
    }
    String city = null;
    if(hotel_id == "1"){
        city = "Moscow";
    }
    else if(hotel_id == "2"){
        city = "Astana";
    }
    else if(hotel_id == "3"){
        city = "Almaty";
    }
    else if(hotel_id == "4"){
        city = "Atyrau";
    }
    else if(hotel_id == "5"){
        city = "Petropavlovsk";
    }
    else if(hotel_id == "6"){
        city = "Karaganda";
    }
    else if(hotel_id == "7"){
        city = "Shymkent";
    }
    else if(hotel_id == "8"){
        city = "Ust-Kamenogorsk";
    }
    else if(hotel_id == "9"){
        city = "Taraz";
    }
    else if(hotel_id == "10"){
        city = "Paris";
    }
%>
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
            <button id="create" >Create a new booking</button>
        </a>
    </div>
    <div class="title">
        <div class="city">
            Paris
        </div>
        <div class="srch">
            <form id="searchForm" action="javascript:search();">
                <div class="input-group">
                    <button id="go" class="btn btn-default" type="button"
                            onclick="document.getElementById('searchForm').submit(); return false;">Go
                    </button>
                    <input type="text" id="searchItem" class="form-control" placeholder="Search Guest">
                </div>
            </form>
        </div>
    </div>
    <div id="guests-cont">
        <% for(Booking b:list) {%>
        <div class="guest"><%=b.getUser_email() %></div>
        <div class="guest-container" >
            <div class="rects-cont">
                <%if(curDate.compareTo(sdfDate.parse(b.getCheck_out())) > 0){ %>
                <div class="rect" id="<%=b.getRoom_id()%>">
                    <div class="card-title">
                        <%=b.getCheck_in() %> - <%=b.getCheck_out() %>
                    </div>
                    <ul class="card">
                        <ul class="main-inf">
                            <li class="room-id">Room ID: <span class="val"> <%=b.getRoom_id() %> </span></li>
                            <li class="price">Total price: <span class="val">$<%=b.getTotal_cost() %></span></li>
                        </ul>
                        <li class="ed-b"><a class="edit" href="edit_booking.jsp">
                            Edit booking
                        </a>
                            <a class="cancel" href="#">Cancel booking</a></li>
                    </ul>
                </div>
                <%}else{%>
                <div class="rect past">
                    <div class="card-title">
                        <%=b.getCheck_in() %> - <%=b.getCheck_out() %>
                    </div>
                    <ul class="card">
                        <ul class="main-inf">
                            <li class="room-id">Room ID: <span class="val"><%=b.getRoom_id() %></span></li>
                            <li class="price">Total price: <span class="val">$<%=b.getTotal_cost() %></span></li>
                        </ul>
                        <li class="ed-b">
                            <a class="rebook" href="rebooking.jsp">Rebook</a></li>
                    </ul>
                </div>
                <%}%>
            </div>
        </div>
        <%} %>
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

<script>
    function search() {

        var name = document.getElementById("searchForm").elements["searchItem"].value;
        var divs = document.getElementsByClassName("guest");
        var targetId = "";
        for (var i = 0; i < divs.length; i++){
            if (name === divs[i].innerHTML){
                targetId = divs[i].parentNode.id;
                document.getElementById(targetId).scrollIntoView();
                break;
            }
        }
    }
</script>
<script>
</script>
<script>

</script>
</body>
</html>