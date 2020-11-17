<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign-up Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/signin.css">

</head>
<body>
<div id="bg">
    <nav class="navbar navbar-expand-sm " id="navbar">
        <a href="index.jsp" class="navbar-brand link">de Vieras</a>
        <button class="navbar-toggler navbar-dark" data-toggle="collapse" data-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarMenu">
            <ul class="navbar-nav ml-auto">
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
            </ul>
        </div>
    </nav>

    <div class="container form-outer-container">
        <h2 class="form-header">Create an account</h2>
        <form action="<%= request.getContextPath() %>/register" method="post" >
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <label>First Name: </label>
                    <input type="text" name="first_name" class="form-control" placeholder="Enter your first name..."
                           required>
                </div>

                <div class="col-lg-6 col-md-6">
                    <label>Last Name: </label>
                    <input type="text" name="last_name" class="form-control" placeholder="Enter your last name..." required>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                        <label class="control-label" for="date">Date of Birth:</label>
                        <input class="form-control" id="date" name="date_of_birth" placeholder="MM/DD/YYYY" type="text"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <label>E-mail:</label>
                    <input type="text" name="email" class="form-control" placeholder="Enter your email.." required>
                </div>
                <div class="col-lg-6 col-md-6">
                    <label>Confirm e-mail:</label>
                    <input type="text" name="email" class="form-control" placeholder="Re-type your email.." required>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <label>Password: </label>
                    <input type="password" name="password" class="form-control" placeholder="Enter your password..."
                           required>
                </div>

                <div class="col-lg-6 col-md-6">
                    <label>Confirm Password: </label>
                    <input type="password" name="password" class="form-control" placeholder="Re-type your password..."
                           required>
                </div>
            </div>
            <hr>
            <div class="form-check">
                <div class="row">
                    <div class="col-8">
                        <input type="checkbox" class="form-check-input" id="Ñheck1">
                        <label class="form-check-label" for="check1">I agree with the <a class="terms-ud" href="terms.html">Terms
                            and Conditions</a></label>
                    </div>
                </div>
            </div>
            <div class="login-btn">
                <button type="submit" class="btn" id="login-btn">Sign-up</button>
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
                <li>
                    <h6 class="link">©SWE project 2020. All rights reserved</h6>
                </li>
            </ul>
        </div>
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
</body>
</html>