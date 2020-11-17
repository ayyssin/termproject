<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Issue Advisories</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/manager_adv.css">
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
                    <a href="bookings.jsp" class="nav-link link">Your Bookings</a>
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
    <div id="main-title">
        Advisories list
    </div>
    <div id="rectangles">
        <div class="rect" id="covid">
            <img src="images/covid-icon.png">
            <div class="card-title">
                Covid-2019 Precautions
            </div>
            <button id="cov-myBtn" >More details</button>
            <div class="on-off"><button id="on">On</button><button id="off">Off</button></div>
        </div>
        <div class="rect" id="winter">
            <img src="images/winter-icon.png">
            <div class="card-title">
                Winter
            </div>
            <button id="wtr-myBtn" >More details</button>
            <div class="on-off"><button id="on">On</button><button id="off">Off</button></div>
        </div>
        <div class="rect" id="summer">
            <img src="images/summer.png">
            <div class="card-title">
                Summer
            </div>
            <button id="smr-myBtn" >More details</button>
            <div class="on-off"><button id="on">On</button><button id="off">Off</button></div>
        </div>
        <div class="rect" id="fall">
            <img src="images/autumn-icon.png">
            <div class="card-title">
                Fall
            </div>
            <button id="fl-myBtn" >More details</button>
            <div class="on-off"><button id="on">On</button><button id="off">Off</button></div>
        </div>
        <div class="rect" id="spring">
            <img src="images/spring-icon.png">
            <div class="card-title">
                Spring
            </div>
            <button id="spr-myBtn" >More details</button>
            <div class="on-off"><button id="on">On</button><button id="off">Off</button></div>
        </div>
    </div>

</div>
<!--POP UP WINDOW-->
<div class="modal" id="cov-myModal">
    <!-- Modal content - COVID -->
    <div class="modal-content">
        <span class="close" id="close">&times;</span>
        <div class="modal-body">
            <div class="m-title">COVID-19 precautionary measures</div>
            <div class="m-img">
                <img src="images/covid.png">
            </div>
            <div class="text1">
                <div class="title">To prevent the spread of COVID-19:</div>
                <div class="text">- Clean your hands often. Use soap and water, or an alcohol-based hand rub.</div>
                <div class="text">- Maintain a safe distance from anyone who is coughing or sneezing.</div>
                <div class="text">- Wear a mask when physical distancing is not possible.</div>
                <div class="text"> - Don’t touch your eyes, nose or mouth.</div>
                <div class="text" id="pre-last"> - Cover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.</div>
                <div class="text" id="last">- Stay home if you feel unwell.</div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="wtr-myModal">
    <!-- Modal content - WINTER -->
    <div class="modal-content" >
        <span class="close" id="close">&times;</span>
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
                <div class="text"><span class="discount">20% off</span> on president suite during 
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
        <span class="close" id="close">&times;</span>
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
            <span class="close" id="close">&times;</span>
            <div class="m-title">Fall discounts are here!</div>
            <div class="fl-text1">
                <div class="text">Your favourite Fall ingredient is back! </div>
                <div class="text">We offer you <span class="discount">15% discount</span> for all the twin rooms this Fall!
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
        <span class="close" id="close">&times;</span>
        <div class="modal-body">
            <div class="m-title">Spring offers</div>
            <div class="spr-img">
                <img src="images/spring-im.jpg">
            </div>
            <div class="text1">
                <div class="text">The days are getting longer and the milder weather is the perfect excuse for a breath of fresh air. It's the perfect time to enjoy a relaxing stay in one of our great destinations.</div>
                <div class="text">Book your getaway and get up to <span class="discount">30% off</span> on a huge range of hotels and resorts all over the world.
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
<script src="manager_adv.js"></script>
</body>
</html>