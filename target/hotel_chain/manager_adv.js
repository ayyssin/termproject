//To open POPUP windows
let cmodal = document.getElementById("cov-myModal");
let cbtn = document.getElementById("cov-myBtn");
let cspan = document.getElementsByClassName("close")[0];
cbtn.onclick = function() {
    cmodal.style.display = "block";
}
cspan.onclick = function() {
    cmodal.style.display = "none";
}

let wmodal = document.getElementById("wtr-myModal");
let wbtn = document.getElementById("wtr-myBtn");
let wspan = document.getElementsByClassName("close")[1];
wbtn.onclick = function() {
    wmodal.style.display = "block";
}
wspan.onclick = function() {
    wmodal.style.display = "none";
}

let smodal = document.getElementById("smr-myModal");
let sbtn = document.getElementById("smr-myBtn");
let sspan = document.getElementsByClassName("close")[2];
sbtn.onclick = function() {
    smodal.style.display = "block";
}
sspan.onclick = function() {
    smodal.style.display = "none";
}

let fmodal = document.getElementById("fl-myModal");
let fbtn = document.getElementById("fl-myBtn");
let fspan = document.getElementsByClassName("close")[3];
fbtn.onclick = function() {
    fmodal.style.display = "block";
}
fspan.onclick = function() {
    fmodal.style.display = "none";
}

let spmodal = document.getElementById("spr-myModal");
let spbtn = document.getElementById("spr-myBtn");
let spspan = document.getElementsByClassName("close")[4];
spbtn.onclick = function() {
    spmodal.style.display = "block";
}
spspan.onclick = function() {
    spmodal.style.display = "none";
}

// to turn on/off the POPUP Windows by Manager commands
let onCovB = document.getElementById("onCov");
let offCovB = document.getElementById("offCov");
let onWtrB = document.getElementById("onWtr");
let offWtrB = document.getElementById("offWtr");
let onSmrB = document.getElementById("onSmr");
let offSmrB = document.getElementById("offSmr");
let onFlB = document.getElementById("onFl");
let offFlB = document.getElementById("offFl");
let onSprB = document.getElementById("onSpr");
let offSprB = document.getElementById("offSpr");

//чтобы когда я изменяю и ухожу на другую стр и обратно возвращаюсь красный цвет нужной кнопки стоял на месте
if(localStorage.getItem('covidPopup')== 'on'){  //covid
    onCovB.style.color = "red";
}else if(localStorage.getItem('covidPopup')== 'off'){
    offCovB.style.color ="red";
}

if(localStorage.getItem('winterPopup')== 'on'){  //winter
    onWtrB.style.color = "red";
}else if(localStorage.getItem('winterPopup')== 'off'){
    offWtrB.style.color ="red";
}

if(localStorage.getItem('summerPopup')== 'on'){  //summer
    onSmrB.style.color = "red";
}else if(localStorage.getItem('summerPopup')== 'off'){
    offSmrB.style.color ="red";
}

if(localStorage.getItem('fallPopup')== 'on'){  //fall
    onFlB.style.color = "red";
}else if(localStorage.getItem('fallPopup')== 'off'){
    offFlB.style.color ="red";
}

if(localStorage.getItem('springPopup')== 'on'){  //spring
    onSprB.style.color = "red";
}else if(localStorage.getItem('springPopup')== 'off'){
    offSprB.style.color ="red";
}
//  чтобы когда я нажимаю на on/off он сохранил в localStorage что я включила/отключила
//  COVID
onCovB.onclick = function(){
    if(onCovB.style.color == "red"){
        onCovB.style.color = "#888";
        offCovB.style.color ="red";
        localStorage.setItem('covidPopup', 'off');
    }else{
        onCovB.style.color = "red";
        localStorage.setItem('covidPopup', 'on');
        offCovB.style.color ="#888";
    }
}

offCovB.onclick = function(){
    if(offCovB.style.color == "red"){
        onCovB.style.color = "red";
        localStorage.setItem('covidPopup', 'on');
        offCovB.style.color ="#888";
    }else{
        onCovB.style.color = "#888";
        offCovB.style.color ="red";
        localStorage.setItem('covidPopup', 'off');
    }
}
//  WINTER
onWtrB.onclick = function(){
    if(onWtrB.style.color == "red"){
        onWtrB.style.color = "#888";
        offWtrB.style.color ="red";
        localStorage.setItem('winterPopup', 'off');
    }else{
        onWtrB.style.color = "red";
        localStorage.setItem('winterPopup', 'on');
        offWtrB.style.color ="#888";

        //set all 'on' buttons of other seasons to grey
        onSmrB.style.color = "#888"; //summer
        offSmrB.style.color ="red";
        localStorage.setItem('summerPopup', 'off');

        onFlB.style.color = "#888";  //fall
        offFlB.style.color ="red";
        localStorage.setItem('fallPopup', 'off');

        onSprB.style.color = "#888"; //spring
        offSprB.style.color ="red";
        localStorage.setItem('springPopup', 'off');
    }
}
offWtrB.onclick = function(){
    if(offWtrB.style.color == "red"){
        onWtrB.style.color = "red";
        localStorage.setItem('winterPopup', 'on');
        offWtrB.style.color ="#888";
        //set all 'on' buttons of other seasons to grey
        onSmrB.style.color = "#888"; //summer
        offSmrB.style.color ="red";
        localStorage.setItem('summerPopup', 'off');

        onFlB.style.color = "#888"; //fall
        offFlB.style.color ="red";
        localStorage.setItem('fallPopup', 'off');

        onSprB.style.color = "#888"; //spring
        offSprB.style.color ="red";
        localStorage.setItem('springPopup', 'off');
    }else{
        onWtrB.style.color = "#888";
        offWtrB.style.color ="red";
        localStorage.setItem('winterPopup', 'off');
    }
}

// SUMMER
onSmrB.onclick = function(){
    if(onSmrB.style.color == "red"){
        onSmrB.style.color = "#888";
        offSmrB.style.color ="red";
        localStorage.setItem('summerPopup', 'off');
    }else{
        onSmrB.style.color = "red";
        localStorage.setItem('summerPopup', 'on');
        offSmrB.style.color ="#888";
        //set all 'on' buttons of other seasons to grey
        onWtrB.style.color = "#888";  //winter
        offWtrB.style.color ="red";
        localStorage.setItem('winterPopup', 'off');

        onFlB.style.color = "#888";  //fall
        offFlB.style.color ="red";
        localStorage.setItem('fallPopup', 'off');
        onSprB.style.color = "#888"; //spring
        offSprB.style.color ="red";
        localStorage.setItem('springPopup', 'off');
    }
}
offSmrB.onclick = function(){
    if(offSmrB.style.color == "red"){
        onSmrB.style.color = "red";
        localStorage.setItem('summerPopup', 'on');
        offSmrB.style.color ="#888";
        //set all 'on' buttons of other seasons to grey
        onWtrB.style.color = "#888"; //winter
        offWtrB.style.color ="red";
        localStorage.setItem('winterPopup', 'off');

        onFlB.style.color = "#888";  //fall
        offFlB.style.color ="red";
        localStorage.setItem('fallPopup', 'off');
        onSprB.style.color = "#888"; //spring
        offSprB.style.color ="red";
        localStorage.setItem('springPopup', 'off');
    }else{
        onSmrB.style.color = "#888";
        offSmrB.style.color ="red";
        localStorage.setItem('summerPopup', 'off');
    }
}

// Fall
onFlB.onclick = function(){
    if(onFlB.style.color == "red"){
        onFlB.style.color = "#888";
        offFlB.style.color ="red";
        localStorage.setItem('fallPopup', 'off');
    }else{
        onFlB.style.color = "red";
        localStorage.setItem('fallPopup', 'on');
        offFlB.style.color ="#888";
        //set all 'on' buttons of other seasons to grey
        onSmrB.style.color = "#888";  //summer
        offSmrB.style.color ="red";
        localStorage.setItem('summerPopup', 'off');
        onWtrB.style.color = "#888";   // winter
        offWtrB.style.color ="red";
        localStorage.setItem('winterPopup', 'off');
        onSprB.style.color = "#888"; //spring
        offSprB.style.color ="red";
        localStorage.setItem('springPopup', 'off');
    }
}
offFlB.onclick = function(){
    if(offFl.style.color == "red"){
        onFlB.style.color = "red";
        localStorage.setItem('fallPopup', 'on');
        offFlB.style.color ="#888";
        //set all 'on' buttons of other seasons to grey
        onWtrB.style.color = "#888";   //winter
        offWtrB.style.color ="red";
        localStorage.setItem('winterPopup', 'off');
        onSmrB.style.color = "#888";   //summer
        offSmrB.style.color ="red";
        localStorage.setItem('summerPopup', 'off');
        onSprB.style.color = "#888"; //spring
        offSprB.style.color ="red";
        localStorage.setItem('springPopup', 'off');
    }else{
        onFlB.style.color = "#888";
        offFlB.style.color ="red";
        localStorage.setItem('fallPopup', 'off');
    }
}

// Spring
onSprB.onclick = function(){
    if(onSprB.style.color == "red"){
        onSprB.style.color = "#888";
        offSprB.style.color ="red";
        localStorage.setItem('springPopup', 'off');
    }else{
        onSprB.style.color = "red";
        localStorage.setItem('springPopup', 'on');
        offSprB.style.color ="#888";
        //set all 'on' buttons of other seasons to grey
        onSmrB.style.color = "#888";  //summer
        offSmrB.style.color ="red";
        localStorage.setItem('summerPopup', 'off');
        onWtrB.style.color = "#888";   // winter
        offWtrB.style.color ="red";
        localStorage.setItem('winterPopup', 'off');
        onFlB.style.color = "#888";  //fall
        offFlB.style.color ="red";
        localStorage.setItem('fallPopup', 'off');
    }
}
offSprB.onclick = function(){
    if(offSpr.style.color == "red"){
        onSprB.style.color = "red";
        localStorage.setItem('springPopup', 'on');
        offSprB.style.color ="#888";
        //set all 'on' buttons of other seasons to grey
        onWtrB.style.color = "#888";   //winter
        offWtrB.style.color ="red";
        localStorage.setItem('fallPopup', 'off');
        onSmrB.style.color = "#888";   //summer
        offSmrB.style.color ="red";
        localStorage.setItem('summerPopup', 'off');
        onFlB.style.color = "#888";  //fall
        offFlB.style.color ="red";
        localStorage.setItem('fallPopup', 'off');
    }else{
        onSprB.style.color = "#888";
        offSprB.style.color ="red";
        localStorage.setItem('springPopup', 'off');
    }
}


//to close by touching outside the box
window.onclick = function(event) {
    if (event.target == cmodal) {
        cmodal.style.display = "none";
    }
    if (event.target == wmodal) {
        wmodal.style.display = "none";
    }
    if (event.target == smodal) {
        smodal.style.display = "none";
    }
    if (event.target == fmodal) {
        fmodal.style.display = "none";
    }
    if (event.target == spmodal) {
        spmodal.style.display = "none";
    }
}