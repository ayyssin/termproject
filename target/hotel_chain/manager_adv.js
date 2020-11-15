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

let onBtn = document.getElementById("on");
let offBtn = document.getElementById("off");

onBtn.onclick = function(){
    if(onBtn.style.color === "red"){
        onBtn.style.color = "#888";
    }else{
        onBtn.style.color = "red";
    }
}

offBtn.onclick = function(){
    if(offBtn.style.color === "red"){
        offBtn.style.color = "#888";
    }else{
        offBtn.style.color = "red";
    }
}



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