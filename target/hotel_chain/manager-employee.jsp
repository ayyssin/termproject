<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="employees.employee_model.employee" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Deque" %>

<%
    List<employee> Employees = (ArrayList<employee>)session.getAttribute("employeeList");
    //List<employee> empList = (ArrayList<employee>)request.getAttribute("employeeList");
    String s = (String) request.getAttribute("jsonEmployee");
    %>




<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employees List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/manager-employee.css">
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

    <div id="cleaning">

        <h2>Cleaning staff</h2>
        <div class="flex">
            <% for(employee em:Employees) {
            %>
            <%if(em.getPosition().equals("Cleaning staff")){%>
            <div class="rect">
                <img src="images/ava.png">
                <div class="staff-name">
                    <%=em.getFirstname()%> <%=em.getLastname()%>
                </div>
                <div class="staff-type"><%=em.getPosition()%></div>
                <div class="hours">Working hours: <%=em.getWorking_hour()%></div>
                <button id="myBtn <%=em.getEmployeeID()%>">See more</button>
            </div>
            <%}
            }%>
        </div>
    </div>

    <div id="reception">
        <h2>Reception</h2>
        <div class="flex">
            <% for(employee em:Employees) {
            %>
            <%if(em.getPosition().equals("Desk clerk")){%>
            <div class="rect">
                <img src="images/ava.png">
                <div class="staff-name">
                    <%=em.getFirstname()%> <%=em.getLastname()%>
                </div>
                <div class="staff-type"><%=em.getPosition()%></div>
                <div class="hours">Working hours: <%=em.getWorking_hour()%></div>
                <button id="myBtn <%=em.getEmployeeID()%>">See more</button>
            </div>
            <%}
            }%>
        </div>
    </div>
</div>

<!--POP UP WINDOW-->
<div class="modals">

</div>

<!-- edit page -->
<div class="edits">

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
    var json ='<%= request.getAttribute("jsonEmployee") %>';

    var list = JSON.parse(json);
</script>
<script src="manager-employee.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script src="edit-employee.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>



</body>
</html>