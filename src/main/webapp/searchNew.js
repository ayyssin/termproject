
let list = bookingsStorage.getBookings();

function bookNow(el){
    let roomtype = el.parentNode.id;
    bookingsStorage.addBooking(roomtype);

    el.style.backgroundColor = "red";
    el.innerHTML = "Cancel";
    el.className = "cancel-btn";
    el.setAttribute( "onclick", "javascript: cancelBooking(this);" );
};

function cancelBooking(el){
    let roomtype = el.parentNode.id;
    bookingsStorage.removeBooking(roomtype);

    el.className = "book-btn";
    el.style.backgroundColor = "#14213D";
    el.innerHTML = "Book now";
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
            list.forEach((el) => {
                if(id == el){
                    htmlCatalog += `
                                    <div class="row">
                                        <div class="col-sm">
                                            <h5>${name}</h5>
                                        </div>
                                        <div class="col-sm">
                                            <h5>${price}</h4>
                                        </div>
                                        <div class="col-sm">
                                            <h5>Number</h5>
                                        </div>
                                    </div>
                                    `;

                    totalPrice += price;
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