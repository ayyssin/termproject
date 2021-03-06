<%@ page import="java.util.Date" %>
<%@ page import="search.hotel_model.searchRoom" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.swing.plaf.synth.SynthLookAndFeel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.text.SimpleDateFormat"%>

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
            <%
                if(login != null){
            %>
            <li class="nav-item">
                <a href="<%= request.getContextPath() %>/bookingServlet" class="nav-link link">My bookings</a>
            </li>
            <%
            } else{
            %>
            <li class="nav-item">
                <a href="signup.jsp" class="nav-link link">Sign-up</a>
            </li>
            <%
                }
            %>
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
            <form action="<%= request.getContextPath() %>/confirm" method="post">
                <input name="user_email" value="<%=login%>" hidden>
                <input name="check_in" value="<%=date_in%>" hidden>
                <input name="check_out" value="<%=date_out%>" hidden>
                <input name="city" value="<%=city %>" hidden>
                <input name="guests" value="<%=guests%>" hidden>
                <input name="url" value="<%=request.getContextPath()%>/search.jsp" hidden>
                <div class="modal-confirmation">
                <button type="submit" class="btn" id="confirm-btn">
                    Confirm
                </button>
                </div>
            </form>
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
                        <%}else{%>
                            <p class="yes-rooms"> Available rooms: <%=allRooms[1][1]%> </p>
                        <%}%>
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
                    <img src="images/single.png" class="booking-item-img">
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
                    <%}else{%>
                    <p class="yes-rooms"> Available rooms: <%=allRooms[0][1]%> </p>
                    <%}%>
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
                    <img src="images/triple.png" class="booking-item-img">
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
                    <%}else{%>
                    <p class="yes-rooms"> Available rooms: <%=allRooms[2][1]%> </p>
                    <%}%>
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
                    <img src="images/quad.png" class="booking-item-img">
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
                    <%}else{%>
                    <p class="yes-rooms"> Available rooms: <%=allRooms[3][1]%> </p>
                    <%}%>
                    <button class="book-btn" onclick="bookNow(this)">Add to the cart</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%}
else if (Integer.parseInt(guests) >= 5){
%>

<div class="container">
    <div class="booking-item">
        <div class="row">
            <div class="col-sm">
                <div class="booking-item-pic">
                    <img src="images/president.png" class="booking-item-img">
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
                    <%}else{%>
                    <p class="yes-rooms"> Available rooms: <%=allRooms[4][1]%> </p>
                    <%}%>
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
<div class="modal" id="wtr-myModal">
    <!-- Modal content - WINTER -->
    <div class="modal-content" >
        <div class="close1">&times;</div>
        <div class="modal-body">
            <div class="m-title">Winter discount</div>
            <div class="m-img">
                <img src="images/winter.jpg">
            </div>
            <div class="text1">
                <div class="title">Winter is coming!</div>
                <div class="text">That’s why invite you to spend your
                    holidays with us and
                    enjoy our discounts!</div>
                <div class="text"><span class="discount">10% off</span> on president suite during
                    New Year period for families!
                </div>
                <div class="text">Unforgettable New Year show with invited  guests, welcome drinks and many more!</div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="smr-myModal">
    <!-- Modal content - SUMMER -->
    <div class="modal-content">
        <div class="close1">&times;</div>
        <div class="modal-body">
            <div class="m-title">Welcome Summer with de Vieras!</div>
            <div class="sm-img">
                <img src="images/summer.png">
            </div>
            <div class="text1">
                <div class="text">This summer, explore a new destination or revisit a favorite place. Book now to lock in our lowest price and instant benefits only at <a>deVieras.com.</a> </div>
                <div class="text">Plus, our members save even more. Not a member? Not a problem – join instantly when you book your stay.
                </div>
                <div class="text">Don’t miss this opportunity!</div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="fl-myModal">
    <!-- Modal content - FALL-->
    <div class="modal-content">
        <div class="modal-body-fl" id="fl">
            <div class="close1" >&times;</div>
            <div class="m-title">Fall discounts are here!</div>
            <div class="fl-text1">
                <div class="text">Your favourite Fall ingredient is back! </div>
                <div class="text">We offer you <span class="discount">10% discount</span> for all the twin rooms this Fall!
                </div>
                <div class="text">Hurry up & book your room now!</div>
                <div id="act">
                    <a href="index.jsp">
                        <button>Book now</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="spr-myModal">
    <!-- Modal content - SPRING -->
    <div class="modal-content">
        <div class="close1" >&times;</div>
        <div class="modal-body">
            <div class="m-title">Spring offers</div>
            <div class="spr-img">
                <img src="images/spring-im.jpg">
            </div>
            <div class="text1">
                <div class="text">The days are getting longer and the milder weather is the perfect excuse for a breath of fresh air. It's the perfect time to enjoy a relaxing stay in one of our great destinations.</div>
                <div class="text">Book your getaway and get up to <span class="discount">10% off</span> on a huge range of hotels and resorts all over the world.
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

<script src="constants/catalog.js"></script>
<script src="bookingsStorage.js"></script>
<script src="searchNew.js"></script>
<script type="text/javascript">
    const _MS_PER_DAY = 1000 * 60 * 60 * 24;
    let checkin = '<%=date_in%>';
    let checkout = '<%=date_out%>';
    let a = new Date(checkin);
    let b = new Date(checkout);

    function dateDiffInDays(a, b) {
        // Discard the time and time-zone information.
        const utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
        const utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());

        return Math.floor((utc2 - utc1) / _MS_PER_DAY);
    }

    data.forEach((el) =>{
        <%for(int i = 0; i < 5; i++){%>
        if(el.id == "<%=allRooms[i][0]%>") {
            el.price = <%=Double.valueOf(allRooms[i][2])%>;
            let days = dateDiffInDays(a, b);
            if(days == 0){
                el.days = 1;
            }else{
                el.days = days;
            }
        }
        <%} %>
    })

    if(!<%=login%>){
        document.getElementById("confirm-btn").onclick = function(){
            alert("Please login to book a room.");
        }
    }

</script>
</body>
</html>
