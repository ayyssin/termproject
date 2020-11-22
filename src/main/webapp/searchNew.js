
let list = bookingsStorage.getBookings();

function bookNow(el){
    let roomtype = el.parentNode.id;
    let count = 1;
    bookingsStorage.addBooking(roomtype, count);


    el.innerHTML = "Remove from cart";
    el.className = "cancel-btn";
    el.setAttribute( "onclick", "javascript: cancelBooking(this);" );

};

function cancelBooking(el){
    let roomtype = el.parentNode.id;

    bookingsStorage.removeBooking(roomtype);

    el.className = "book-btn";
    el.innerHTML = "Add to cart";
    el.setAttribute( "onclick", "javascript: bookNow(this);" );
};

/*modal display*/

let button = document.getElementById("cart-button");
let closeBtn = document.querySelector(".close");
let modal = document.querySelector(".modal-cart");
let modalBody = document.querySelector(".modal-body");
let returnBtn = document.getElementById("return-btn");
let confirmBtn = document.querySelector(".modal-confirmation");

button.onclick = function(){
    modal.style.display = "block";
    let htmlCatalog = '';
    let totalPrice = 0;
    let num_of_days = 0;

    if(list.length == 0){
        confirmBtn.style.display = "none";

        htmlCatalog += ` 
                        <div class="oops">
                            <h2>Oops! Your list is empty.</h2>
                        </div>
        `;

    }else{

        confirmBtn.style.display = "block";
        data.forEach(({id, name, price, days}) => {
            list.forEach(({roomtype, number}) => {
                if(id == roomtype){
                    htmlCatalog += `
                                    <div class="row">
                                        <div class="col-sm">
                                            <h5>${name}</h5>
                                        </div>
                                        <div class="col-sm">
                                            <h5>${number} room(s)</h5>
                                        </div>
                                        <div class="col-sm">
                                            <h5>x ${days} day(s)</h5>
                                        </div>
                                        <div class="col-sm">
                                            <h5>x ${price} USD </h4>
                                        </div>
                                    </div>
                                    `;
                    totalPrice += (price * number * days);
                }
            });
        });

        htmlCatalog += `<div class="total-pay">
                            <h2>In total: <span id="totalSum">${totalPrice}</span> USD</h2>
                        </div>`
        ;
    }
    modalBody.innerHTML = htmlCatalog;
}

closeBtn.onclick = function(){
    modal.style.display = "none";
}

//---- To open/close POPUP windows
let wmodal = document.getElementById("wtr-myModal");
let wspan = document.getElementsByClassName("close1")[0];
wspan.onclick = function() {
    wmodal.style.display = "none";
}

let smodal = document.getElementById("smr-myModal");
let sspan = document.getElementsByClassName("close1")[1];
sspan.onclick = function() {
    smodal.style.display = "none";
}

let fmodal = document.getElementById("fl-myModal");
let fspan = document.getElementsByClassName("close1")[2];
fspan.onclick = function() {
    fmodal.style.display = "none";
}

let spmodal = document.getElementById("spr-myModal");
let spspan = document.getElementsByClassName("close1")[3];
spspan.onclick = function() {
    spmodal.style.display = "none";
}

// ---- to control on/off of POPUP by MANAGER
let winter = localStorage.getItem('winterPopup');
if(winter == 'off'){
    wmodal.style.display = "none";
}else if(winter == 'on'){
    wmodal.style.display = "block";
    // нужно чтобы закрыл все другие модалы
    smodal.style.display = "none";
    fmodal.style.display = "none";
    spmodal.style.display = "none";
}

let summer = localStorage.getItem('summerPopup');
if(summer == 'off'){
    smodal.style.display = "none";
}else if(summer == 'on'){
    smodal.style.display = "block";
    // нужно чтобы закрыл все другие модалы
    wmodal.style.display = "none";
    fmodal.style.display = "none";
    spmodal.style.display = "none";
}

let fall = localStorage.getItem('fallPopup');
if(fall == 'off'){
    fmodal.style.display = "none";
}else if(fall == 'on'){
    fmodal.style.display = "block";
    // нужно чтобы закрыл все другие модалы
    wmodal.style.display = "none";
    smodal.style.display = "none";
    spmodal.style.display = "none";
}

let spring = localStorage.getItem('springPopup');
if(spring == 'off'){
    spmodal.style.display = "none";
}else if(spring == 'on'){
    spmodal.style.display = "block";
    // нужно чтобы закрыл все другие модалы
    wmodal.style.display = "none";
    smodal.style.display = "none";
    fmodal.style.display = "none";
}

//---- to close by touching outside the box
window.onclick = function(event) {
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