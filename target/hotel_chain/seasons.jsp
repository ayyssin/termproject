<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
            <div class="season">
                <div class="seasons-info">
                    <div class="season-heading">
                        <h2><span id="season-name">Spring</span></h2>
                        <hr width="600px" color="#C4C4C4" opacity="90%" align="left";>
                    </div>
                    <div>
                        <form class="container">
                            <div class="row form-row">
                                <label for="">Days of the week (DOW):</label>
                                <div class="group"  id="input-dows">
                                    <div class="dow-opt">
                                        <input type="checkbox" id="monday" name="monday">
                                        <label for="monday">M</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="tuesday" name="tuesday">
                                        <label for="tuesday">T</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="wednesday" name="wednesday">
                                        <label for="wednesday">W</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="thursday" name="thursday">
                                        <label for="thursday">R</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="friday" name="friday">
                                        <label for="friday">F</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="saturday" name="saturday">
                                        <label for="saturday">St</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="sunday" name="sunday">
                                        <label for="sunday">S</label>
                                    </div>
        
                                </div>
                            </div>
                            <div class="row form-row">
                                <label for="rate-dow">Rate for the DOW (in %):</label>
                                <input type="text" name="rate-dow" id="input-dow-rate" placeholder="Enter a value">
                            </div>
                            <div class="row form-row">
                                <label for="season-rate">Seasonal rate (in %):</label>
                                <input type="text" name="season-rate"  id="input-season-rate" placeholder="Enter a value">
                            </div>
                            <div class="row form-row">
                                <label for="on-off">On/Off</label>
                                <select name="on-off"  id="input-on-off">
                                    <option value="on">On</option>
                                    <option value="off">Off</option>
                                  </select>
                            </div>

                            <div id="save">
                                <button class="btn" type="submit" id="spring-btn">Save</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>

            <div class="season">
                <div class="seasons-info">
                    <div class="season-heading">
                        <h2><span id="season-name">Summer</span></h2>
                        <hr width="600px" color="#C4C4C4" opacity="90%" align="left";>
                    </div>
                    <div>
                        <form class="container">
                            <div class="row form-row">
                                <label for="">Days of the week (DOW):</label>
                                <div class="group"  id="input-dows">
                                    <div class="dow-opt">
                                        <input type="checkbox" id="monday" name="monday">
                                        <label for="monday">M</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="tuesday" name="tuesday">
                                        <label for="tuesday">T</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="wednesday" name="wednesday">
                                        <label for="wednesday">W</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="thursday" name="thursday">
                                        <label for="thursday">R</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="friday" name="friday">
                                        <label for="friday">F</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="saturday" name="saturday">
                                        <label for="saturday">St</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="sunday" name="sunday">
                                        <label for="sunday">S</label>
                                    </div>
        
                                </div>
                            </div>
                            <div class="row form-row">
                                <label for="rate-dow">Rate for the DOW (in %):</label>
                                <input type="text" name="rate-dow" id="input-dow-rate" placeholder="Enter a value">
                            </div>
                            <div class="row form-row">
                                <label for="season-rate">Seasonal rate (in %):</label>
                                <input type="text" name="season-rate"  id="input-season-rate" placeholder="Enter a value">
                            </div>
                            <div class="row form-row">
                                <label for="on-off">On/Off</label>
                                <select name="on-off"  id="input-on-off">
                                    <option value="on">On</option>
                                    <option value="off">Off</option>
                                  </select>
                            </div>
                            
                            <div id="save">
                                <button class="btn" type="submit" id="summer-btn">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="season">
                <div class="seasons-info">
                    <div class="season-heading">
                        <h2><span id="season-name">Autumn</span></h2>
                        <hr width="600px" color="#C4C4C4" opacity="90%" align="left";>
                    </div>
                    <div>
                        <form class="container">
                            <div class="row form-row">
                                <label for="">Days of the week (DOW):</label>
                                <div class="group"  id="input-dows">
                                    <div class="dow-opt">
                                        <input type="checkbox" id="monday" name="monday">
                                        <label for="monday">M</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="tuesday" name="tuesday">
                                        <label for="tuesday">T</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="wednesday" name="wednesday">
                                        <label for="wednesday">W</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="thursday" name="thursday">
                                        <label for="thursday">R</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="friday" name="friday">
                                        <label for="friday">F</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="saturday" name="saturday">
                                        <label for="saturday">St</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="sunday" name="sunday">
                                        <label for="sunday">S</label>
                                    </div>
        
                                </div>
                            </div>
                            <div class="row form-row">
                                <label for="rate-dow">Rate for the DOW (in %):</label>
                                <input type="text" name="rate-dow" id="input-dow-rate" placeholder="Enter a value">
                            </div>
                            <div class="row form-row">
                                <label for="season-rate">Seasonal rate (in %):</label>
                                <input type="text" name="season-rate"  id="input-season-rate" placeholder="Enter a value">
                            </div>
                            <div class="row form-row">
                                <label for="on-off">On/Off</label>
                                <select name="on-off"  id="input-on-off">
                                    <option value="on">On</option>
                                    <option value="off">Off</option>
                                  </select>
                            </div>

                            <div id="save">
                                <button class="btn" type="submit" id="autumn-btn">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="season">
                <div class="seasons-info">
                    <div class="season-heading">
                        <h2><span id="season-name">Winter</span></h2>
                        <hr width="600px" color="#C4C4C4" opacity="90%" align="left";>
                    </div>
                    <div>
                        <form class="container">
                            <div class="row form-row">
                                <label for="">Days of the week (DOW):</label>
                                <div class="group"  id="input-dows">
                                    <div class="dow-opt">
                                        <input type="checkbox" id="monday" name="monday">
                                        <label for="monday">M</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="tuesday" name="tuesday">
                                        <label for="tuesday">T</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="wednesday" name="wednesday">
                                        <label for="wednesday">W</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="thursday" name="thursday">
                                        <label for="thursday">R</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="friday" name="friday">
                                        <label for="friday">F</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="saturday" name="saturday">
                                        <label for="saturday">St</label>
                                    </div>
    
                                    <div class="dow-opt">
                                        <input type="checkbox" id="sunday" name="sunday">
                                        <label for="sunday">S</label>
                                    </div>
        
                                </div>
                            </div>
                            <div class="row form-row">
                                <label for="rate-dow">Rate for the DOW (in %):</label>
                                <input type="text" name="rate-dow" id="input-dow-rate" placeholder="Enter a value">
                            </div>
                            <div class="row form-row">
                                <label for="season-rate">Seasonal rate (in %):</label>
                                <input type="text" name="season-rate"  id="input-season-rate" placeholder="Enter a value">
                            </div>
                            <div class="row form-row">
                                <label for="on-off">On/Off</label>
                                <select name="on-off"  id="input-on-off">
                                    <option value="on">On</option>
                                    <option value="off">Off</option>
                                  </select>
                            </div>

                            <div id="save">
                                <button class="btn" type="submit" id="winter-btn">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>