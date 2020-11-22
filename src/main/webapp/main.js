
document.querySelector(".btn-search").onclick = function(){
    location.href = "search.html";
}

var cmodal = document.getElementById("cov-myModal");
var cspan = document.getElementsByClassName("close")[0];

var data = localStorage.getItem('covidPopup');
if(data == 'off'){
    cmodal.style.display = "none";
}else if(data == 'on'){
    cmodal.style.display = "block";
}
cspan.onclick = function() {
    cmodal.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == cmodal) {
        cmodal.style.display = "none";
    }
}