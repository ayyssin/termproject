
let list = bookingsStorage.getBookings();

function bookNow(el){
    let roomtype = el.parentNode.id;
    let count = document.getElementById("input-quantity" + " " + roomtype).value;
    let select = document.getElementById("input-quantity" + " " + roomtype);
    let city

    if(count == 0){
        alert("Error! Choose the number of rooms.");
    }else{
        select.style.display = "none";
        bookingsStorage.addBooking(roomtype, count);


        el.innerHTML = "Remove from cart";
        el.className = "cancel-btn";
        el.setAttribute( "onclick", "javascript: cancelBooking(this);" );
    }
};

function cancelBooking(el){
    let roomtype = el.parentNode.id;
    let select = document.getElementById("input-quantity" + " " + roomtype);

    select.style.display = "block";
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
        data.forEach(({id, name, price}) => {
            list.forEach(({roomtype, number}) => {
                if(id == roomtype){
                    htmlCatalog += `
                                    <div class="row">
                                        <div class="col-sm">
                                            <h5>${name}</h5>
                                        </div>
                                        <div class="col-sm">
                                            <h5>${price} USD </h4>
                                        </div>
                                        <div class="col-sm">
                                            <h5>${number} room(s)</h5>
                                        </div>
                                    </div>
                                    `;
                    totalPrice += (price * number);
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