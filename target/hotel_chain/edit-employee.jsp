<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit employee information</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/edit-employee.css">
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
                <a href="manager-profile.jsp" class="nav-link link">My profile</a>
            </li>
            <li class="nav-item">
                <a href="index.jsp" class="nav-link link">Log-out</a>
            </li>
        </ul>
    </div>
</nav>

<div id="main">
    <h1>Edit information</h1>
    <form action="#">
        <div id="staff">
            <div class="staff-name">Anne Summers</div>
            <div class="flex">
                <div class="position-label">Position:</div>
                <div class="position light">Cleaning staff</div>
            </div>
            <div class="flex">
                <div class="schedule-label">Work schedule</div>
                <div class="schedule light">
                    <input type="checkbox" id="monday" value="M" name="days[]" class="days-circle" checked><label for="monday">M</label>
                    <input type="checkbox" id="tuesday" value="T" name="days[]" class="days-circle"><label for="tuesday">T</label>
                    <input type="checkbox" id="wednesday" value="W" name="days[]" class="days-circle" checked><label for="wednesday">W</label>
                    <input type="checkbox" id="thursday" value="R" name="days[]" class="days-circle"><label for="thursday">R</label>
                    <input type="checkbox" id="friday" value="F" name="days[]" class="days-circle" checked><label for="friday">F</label>
                    <input type="checkbox" id="saturday" value="St" name="days[]" class="days-circle"><label for="saturday">St</label>
                    <input type="checkbox" id="sunday" value="S" name="days[]" class="days-circle"><label for="sunday">S</label>
                </div>
            </div>
            <div class="flex">
                <div class="hours-label">Working hours</div>
                <div class="hours light">
                    <input type="number" value="3">
                </div>
            </div>
            <div class="flex">
                <div class="salary-label">Salary ($/hour)</div>
                <div class="salary light">
                    <input type="number" value="10">
                </div>
            </div>
        </div>
        <input type="submit" value="Save" id="edit-submit">
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
</body>
</html>