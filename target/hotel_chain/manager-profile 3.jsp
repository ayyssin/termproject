<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
%>
<%
String surname = (String)request.getAttribute("managerSurname");
String name = (String)request.getAttribute("managerName");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>deVieras</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/manager-profile.css">
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

    <div class="container">
        <div id="greetings">
            <h2>Hello, <span id="name"><%=name%> <%=surname%></span></h2>
            <hr width="500px" color="#C4C4C4" opacity="90%";>
        </div>

        <div class="container-btn">
            <div class="row">
                <div class="col-sm">
                    <div class="choose-btn">
                        <form action="<%=request.getContextPath()%>/employees" method="post">
                        <a href="manager-employee.jsp"><button type="submit" name="showEmployees" class="btn" id="employees-btn">See employee list</button></a>
                        </form>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="choose-btn">
                        <form action="<%=request.getContextPath()%>/seasonalRates" method="get">
                        <a href="seasons.jsp"><button type="submit" class="btn" id="season-btn">See seasonal rates</button></a>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm">
                    <div class="choose-btn">
                        <a href="manager_adv.jsp"><button type="submit" class="btn" id="advisory-btn">Issue advisory </button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>