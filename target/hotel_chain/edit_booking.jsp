<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit booking</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/booking_edits.css">
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
                    <a href="index.jsp" class="nav-link link">Log-out</a>
                </li>
            </ul>
        </div>
    </nav>
</div>

<div class="main">
    <div class="title">Edit booking</div>
    <form>
        <div class="available">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <label>Check-in date:</label>
                    <input class="check-in"  name="check-in-date" placeholder="dd/mm/yyyy" type="text"/>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <label>Check-out date:</label>
                    <input class="check-out"  name="check-out-date" placeholder="dd/mm/yyyy" type="text"/>
                </div>
            </div>
            <button id="check-rooms">Check for available rooms</button>
        </div>
        <div class="room-param">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <label class="email">Room ID: </label>
                    <input type="text" id="trgt" name="room-id" placeholder="Select Room ID" required>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <label>Room Type:</label>
                    <input type="text" name="room-type" placeholder="Select Room type" required>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <label>Number of occupants:</label>
                    <input type="text" name="occupants" placeholder="Occupants no." required>
                </div>
            </div>
            <button id="create">Save all</button>
        </div>
    </form>
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
<script>
    $(document).ready(function () {
        var date_input = $('input[name="check-in-date"]'); //our date input has the name "date"
        var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
        var options = {
            format: 'dd/mm/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        };
        date_input.datepicker(options);
    })

    $(document).ready(function () {
        let date_input2 = $('input[name="check-out-date"]'); //our date input has the name "date"
        let container2 = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
        let options2 = {
            format: 'dd/mm/yyyy',
            container: container2,
            todayHighlight: true,
            autoclose: true,
        };
        date_input2.datepicker(options2);
    })
</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- Include Date Range Picker -->
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
</body>
</html>