
let oopsMessage = document.querySelector(".oops");

function oopsDisplay(){
    if(bookingsCatalog.length == 0){
        oopsMessage.style.display = "block";
    }else{
        oopsMessage.style.display = "none";
    }
}

function runModal(bookingID){
    var modal = document.getElementById("myModal" + " " + bookingID);

    var btn = document.getElementById("myBtn" + " " + bookingID);

    var span = document.getElementsByClassName("close" + " " + bookingID)[0];

    btn.onclick = function() {
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
}

function runRemove(bookingID){
    let bookingCard = document.getElementsByClassName("rect" + " " + bookingID);

    let btn = document.getElementById("cancel" + " " + bookingID);

    btn.onclick = function() {
        while(bookingCard.length > 0){
            bookingCard[0].parentNode.removeChild(bookingCard[0]);
        }
        let indx = list.indexOf(bookingID);
        if(indx != -1){
            localStorageUtil.removeProduct(bookingID);
        }
    }
}

//Script on appending/deleting bookings

//we neeed to pass variables to this function so 
//to make something like city.innerHTML = VARIABLE got from DB & user input
//the id of each generated booking should be different and it passed to modal function as well as well
function generateModal(bookingID, name, PRICE, CAPACITY, check_in, check_out, city){
    console.log(bookingID, name, PRICE, check_in, check_out, city);
    let main = document.querySelector(".modals");

    let node = document.createElement("div");
    node.className += "modal";
    node.id += ("myModal" + " " + bookingID);

    main.appendChild(node);

    let content = document.createElement("div");
    content.className += "modal-content";
    node.appendChild(content);

    let body = document.createElement("div");
    body.className += "modal-body";
    content.appendChild(body);

    let close = document.createElement("span");
    close.className += ("close" + " " + bookingID);
    close.innerHTML = "&times;"
    body.appendChild(close);

    let imgRoom = document.createElement("img");
    imgRoom.id += "room-img";
    imgRoom.setAttribute("src", "images/popup.png");
    body.appendChild(imgRoom);

    let info = document.createElement("div");
    info.className += "info-body";
    body.appendChild(info);

    let title = document.createElement("div");
    title.className += "info-title";
    info.appendChild(title);

    let room = document.createElement("div");
    room.className += "room-type";
    room.innerHTML = name;
    title.appendChild(room);

    let locationBox = document.createElement("div");
    locationBox.className += "location-box";
    title.appendChild(locationBox);

    let imgLocation = document.createElement("img");
    imgLocation.id += "location-img";
    imgLocation.setAttribute("src", "images/place.svg");
    locationBox.appendChild(imgLocation);

    let locationName = document.createElement("div");
    locationName.className += "location";
    locationName.innerHTML = city;
    locationBox.appendChild(locationName);

    let infoDiv = document.createElement("div");
    infoDiv.id += "info";
    info.appendChild(infoDiv);

    let dates = document.createElement("div");
    dates.id += "dates";
    infoDiv.appendChild(dates);

    let checkIN = document.createElement("div");
    checkIN.className += "check-in";
    dates.appendChild(checkIN);

    let checkInTitle = document.createElement("span");
    checkInTitle.className += "titles";
    checkInTitle.innerHTML = check_in;
    checkIN.appendChild(checkInTitle);

    let checkInDate = document.createElement("div");
    checkInDate.className += "date";
    checkInDate.innerHTML = "Weekday, Date";
    checkIN.appendChild(checkInDate);

    let checkInTime = document.createElement("div");
    checkInDate.className += "time";
    checkInDate.innerHTML = "11 AM";
    checkIN.appendChild(checkInTime);

    let checkOut = document.createElement("div");
    checkOut.className += "check-out";
    dates.appendChild(checkOut);

    let checkOutTitle = document.createElement("span");
    checkOutTitle.className += "titles";
    checkOutTitle.innerHTML = check_out;
    checkOut.appendChild(checkOutTitle);

    let checkOutDate = document.createElement("div");
    checkOutDate.className += "date";
    checkOutDate.innerHTML = "Weekday, Date";
    checkOut.appendChild(checkOutDate);

    let checkOutTime = document.createElement("div");
    checkOutDate.className += "time";
    checkOutDate.innerHTML = "6 PM";
    checkOut.appendChild(checkOutTime);

    let genInfo = document.createElement("div");
    genInfo.className += "gen-info";
    info.appendChild(genInfo);

    let gentitle = document.createElement("div");
    gentitle.className += "titles";
    gentitle.innerHTML = "General information";
    genInfo.appendChild(gentitle);

    let capacity = document.createElement("div");
    capacity.className += "capacity";
    capacity.innerHTML = "Room capacity: ";
    
    let capacityNum = document.createElement("span");
    capacityNum.className += "room-capacity";
    capacityNum.innerHTML = CAPACITY;
    capacity.appendChild(capacityNum);
    genInfo.appendChild(capacity);

    let price = document.createElement("div");
    price.className += "price";
    price.innerHTML = "Price: $";
    
    let priceNum = document.createElement("span");
    priceNum.className += "room-price";
    priceNum.innerHTML = PRICE;
    price.appendChild(priceNum);
    genInfo.appendChild(price);
}

bookingsCatalog.forEach(({bookingID, capacity, check_in, check_out, city, price, room_id, room_type}) => {

    let main = document.querySelector("#rectangles");

    let node = document.createElement("div");
    node.className += ("rect" + " " + bookingID);

    let image = document.createElement("img");
    let img;
    if(room_type == "single"){
        img = "images/single.png";
    }else if(room_type == "double"){
        img = "images/double.png";
    }else if(room_type == "triple"){
        img = "images/triple.png";
    }else if(room_type == "quad"){
        img = "images/quad.png";
    }else if(room_type == "president"){
       img =  "images/president.png"
    }
    image.setAttribute("src", img);

    let cityDIV = document.createElement("div");
    cityDIV.className += "card-title";
    cityDIV.innerHTML = city;

    let date = document.createElement("div");
    date.className += "card-date";
    date.innerHTML = check_in + "-" + check_out;

    let moreDetails = document.createElement("button");
    moreDetails.id += "myBtn" + " " + bookingID;
    moreDetails.innerHTML = "More details";

    let cancel = document.createElement("button");
    cancel.id += ("cancel" + " " + bookingID);
    cancel.className += "cancel" + " " + bookingID;
    cancel.innerHTML = "Cancel booking";

    node.appendChild(image);
    node.appendChild(cityDIV);
    node.appendChild(date);
    node.appendChild(moreDetails);
    node.appendChild(cancel);

    main.appendChild(node);

    //we have to pass some variables to generate specific modals and make sure they're working
    generateModal(bookingID, room_type, price, capacity, check_in, check_out, city);
    runModal(bookingID);
    runRemove(bookingID);
    oopsDisplay();
});