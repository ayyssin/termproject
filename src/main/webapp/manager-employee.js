let displayCards = [];

employees.forEach(({id, name, position, schedule, hours, salary, total_payroll}) => {
    displayCards.push({id, name, position, schedule, hours, salary, total_payroll});
});

function runModal(employeeID){
    var modal = document.getElementById("myModal" + " " + employeeID);

    var btn = document.getElementById("myBtn" + " " + employeeID);

    var span = document.getElementsByClassName("close" + " " + employeeID)[0];

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
//Script on appending/deleting bookings

//we neeed to pass variables to this function so 
//to make something like city.innerHTML = VARIABLE got from DB & user input
//the id of each generated booking should be different and it passed to modal function as well as well
function generateModal(employeeID, name, position, schedule, hours, salary, total_payroll){
    let main = document.querySelector(".modals");
    let node = document.createElement("div");
    node.className += "modal";
    node.id += ("myModal" + " " + employeeID);
    main.appendChild(node);

    let content = document.createElement("div");
    content.className += "modal-content";
    node.appendChild(content);

    let body = document.createElement("div");
    body.className += "modal-body";
    content.appendChild(body);

    let close = document.createElement("span");
    close.className += ("close" + " " + employeeID);
    close.innerHTML = "&times;"
    body.appendChild(close);

    let title= document.createElement("span");
    title.className += ("staff-name" + " " + employeeID);
    title.innerHTML = name
    body.appendChild(title);

    let edit = document.createElement("a");
    edit.href = "edit.html"
    edit.className += ("edit" + " " + employeeID);
    body.appendChild(edit);

    let info = document.createElement("div");
    info.className += "info-body";
    content.appendChild(info);

    let positions = document.createElement("div");
    positions.className += ("positions" + " " + employeeID);
    positions.innerHTML = position
    info.appendChild(positions);

    let schedules = document.createElement("div");
    schedules.className += ("schedules" + " " + employeeID);
    schedules.innerHTML = schedule
    info.appendChild(schedules);

    let hour = document.createElement("div");
    hour.className += ("hour" + " " + employeeID);
    title.innerHTML = hours
    info.appendChild(hour);

    let salaries = document.createElement("div");
    salaries.className += ("salaries" + " " + employeeID);
    salaries.innerHTML = salary
    info.appendChild(salaries);

    let total = document.createElement("div");
    total.className += ("total" + " " + employeeID);
    total.innerHTML = total_payroll
    info.appendChild(total);

    let payroll = document.createElement("button");
    payroll.className = "payroll"
    payroll.innerHTML = "Make payroll";
    content.appendChild(payroll);
}

displayCards.forEach(({id, name, position, schedule, hours, salary, total_payroll, img}) => {
    
    //we have to pass some variables to generate specific modals and make sure they're working
    generateModal(id, name, position, schedule, hours, salary, total_payroll);
    runModal(id);
});