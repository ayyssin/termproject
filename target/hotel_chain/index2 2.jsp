<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>deVieras</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/main.css">
</head>
<body>
<div class="bg">
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

    <div class="container main-cnt">
        <div class="search-bar">
            <form action="<%= request.getContextPath() %>/search" method="post">
                <fieldset>
                    <legend>Discover new places with us</legend>
                </fieldset>
                <div class="inner-form">
                    <div class="input-field first-wrap">
                        <label>City</label>
                        <input id="search" type="text" name="City" placeholder="Choose the city">
                    </div>
                    <div class="input-field second-wrap">
                        <label>Check-in date</label>
                        <input class="form-control" id="date" type="date" name="date_in" placeholder="Add dates"/>
                    </div>
                    <div class="input-field third-wrap">
                        <label>Check-out date</label>
                        <input class="form-control" id="date" type="date" name="date_out" placeholder="Add dates"/>
                    </div>
                    <div class="input-field fourth-wrap">
                        <label>Guests</label>
                        <input id="guests" type="text" name="guests" placeholder="Add number of guests">
                    </div>
                    <div class="input-field fifth-wrap">
                        <button class="btn-search" type="submit" name="submitSearch">
                            <svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" data-prefix="fas"
                                 data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path fill="currentColor"
                                      d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
                            </svg>
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <div id="rectangle">
            <div id="main-info">
                <h1 id="main-title">
                    Welcome to <span>de Vieras!</span>
                </h1>
                <div id="main-description">
                    <p>Located in 17 countries, de Vieras Hotel Chains - is a perfect starting point from which to
                        explore the
                        city.</p>
                    <br>
                    <p>The hotels offer guests a range of services and amenities designed to provide comfort and
                        convenience. 24-hour front desk, facilities for disabled guests, luggage storage, Wi-Fi in
                        public areas,
                        car park are on the list of things guests can enjoy. Internet access – wireless, internet access
                        –
                        wireless (complimentary), non smoking rooms, air conditioning, heating can be found in selected
                        guestrooms. The hotel's peaceful atmosphere extends to its recreational facilities which include
                        fitness
                        center, golf course (within 3 km), outdoor pool.</p>
                    <br>
                    <p>Friendly staff, great facilities and close proximity to
                        all that the city has to offer are three great reasons you should stay at de Vieras Hotel
                        Chain.</p>
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

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        var date_input = $('input[name="date"]'); //our date input has the name "date"
        var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
        var options = {
            format: 'mm/dd/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        };
        date_input.datepicker(options);
    })
</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- Include Date Range Picker -->
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<script src="js/main.js"></script>

</body>
</html>