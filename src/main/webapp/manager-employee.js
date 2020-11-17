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

    let header = document.createElement("div");
    header.className += "modal-header";
    content.appendChild(header);

    let edit = document.createElement("a");
    edit.href = "edit.html"
    edit.className += ("edit" + " " + employeeID);
    edit.innerHTML = "Edit";
    header.appendChild(edit);

    let staffName = document.createElement("div");
    staffName.className += "staffName";
    header.appendChild(staffName);

    let nameSpan = document.createElement("h3");
    nameSpan.className += "nameSpan";
    nameSpan.innerHTML = name;
    staffName.appendChild(nameSpan);

    let close = document.createElement("div");
    close.className += ("close" + " " + employeeID);
    close.innerHTML = "&times;"
    header.appendChild(close);

    let body = document.createElement("div");
    body.className += "modal-body";
    content.appendChild(body);

    let positionDiv = document.createElement("div");
    positionDiv.className += ("positions");
    positionDiv.innerHTML = "Position: ";
    body.appendChild(positionDiv);

    let positions = document.createElement("span");
    positions.innerHTML = position;
    positionDiv.appendChild(positions);

    let schedulesDiv = document.createElement("div");
    schedulesDiv.className += ("schedules");
    schedulesDiv.innerHTML = "Working Schedule: ";
    body.appendChild(schedulesDiv);

    let schedules = document.createElement("span");
    schedules.innerHTML = schedule;
    schedulesDiv.appendChild(schedules);

    let hourDiv = document.createElement("div");
    hourDiv.className += ("hour");
    hourDiv.innerHTML = "Working hours: ";
    body.appendChild(hourDiv);

    let hour = document.createElement("span");
    hour.innerHTML = hours;
    hourDiv.appendChild(hour);

    let salariesDiv = document.createElement("div");
    salariesDiv.className += ("salaries");
    salariesDiv.innerHTML = "Salary: "
    body.appendChild(salariesDiv);

    let salaries = document.createElement("div");
    salaries.innerHTML = salary;
    salariesDiv.appendChild(salaries);

    let totalDiv = document.createElement("div");
    totalDiv.className += ("total");
    totalDiv.innerHTML = "Total payroll: ";
    body.appendChild(totalDiv);

    let total = document.createElement("div");
    total.innerHTML = total_payroll;
    totalDiv.appendChild(total);

    let payroll = document.createElement("button");
    payroll.className = "payroll"
    payroll.innerHTML = "Make payroll";
    body.appendChild(payroll);
}

displayCards.forEach(({id, name, position, schedule, hours, salary, total_payroll, img}) => {
    
    //we have to pass some variables to generate specific modals and make sure they're working
    generateModal(id, name, position, schedule, hours, salary, total_payroll);
    runModal(id);
});