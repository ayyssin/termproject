<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="seasons.season_model.season" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Deque" %>
<%
    List<season> list = (ArrayList<season>)request.getAttribute("seasonList");
    for(season s:list){
        System.out.println("name: "+s.getSeason_name());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>deVieras</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/seasons.css">
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
        <div id="header">
            <h2>Seasonal rates</h2>
        </div>
        <div id="seasons-list">
            <form action="<%= request.getContextPath() %>/saveSeasons" method="post" class="container" id="seasons-form">

                <% for(season s:list) {%>
                <div class="season">
                    <div class="seasons-info">
                            <div class="season-heading">
                                <h2><span id="season-name"><%=s.getSeason_name()%></span></h2>
                                <hr width="600px" color="#C4C4C4" opacity="90%" align="left";>
                            </div>
                            <div class="row form-row">
                                <label for="season-rate">Seasonal rate (in %):</label>
                                <input type="text" id="season-rate"  name="input-<%=s.getSeason_name()%>-rate" placeholder="<%=s.getDiscount()%>">
                            </div>
                            <div class="row form-row">
                                <label for="on-off">On/Off</label>
                                <select name="on-off"  id="<%=s.getSeason_name()%>-on-off">
                                    <option value="choose">Choose</option>
                                    <option value="off">Off</option>
                                    <option value="on">On</option>
                                  </select>
                            </div>
                    </div>
                </div>
                <%} %>
                <div id="save">
                    <button class="btn" type="submit" id="save-all-btn">Save</button>
                </div>
            </form>
        </div>
    </div>
</body>

<script type="text/javascript">
    let newDiscounts = []; //хранит те сезоны которые нужно изменить
    seasons = ['Autumn', 'Spring', 'Summer', 'Winter'];

    document.getElementById("save-all-btn").onclick = function(){
        seasons.forEach(s => {
            let discount = document.getElementById("input-" + s + "-rate").value;
            let onoff = document.getElementById(s+"-on-off").value;

            if(onoff == "on"){
                newDiscounts.push(s, discount);
            }
        });
    }
    
</script>
</html>