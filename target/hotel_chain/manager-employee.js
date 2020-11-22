//var product = document.getElementById("product"), employeeList;
//employeeList = product.getAttribute("data-prodnumber");

let displayCards = [];

list.forEach(({id, name, position, schedule, hours, salary, total_payroll}) => {
    displayCards.push({id, name, position, schedule, hours, salary, total_payroll});
});

function runModal(employeeID){
    var modal = document.getElementById("myModal" + " " + employeeID);

    var btn = document.getElementById("myBtn" + " " + employeeID);

    var span = document.getElementsByClassName("close" + " " + employeeID)[0];

    var pay = document.getElementsByClassName("payroll" + " " + employeeID)[0];

    var paymentAmount = document.getElementById("total-span" + " " + employeeID);

    btn.onclick = function() {
        modal.style.display = "block";
    }

    pay.onclick = function(){
        pay.style.backgroundColor = "#44D362";
        pay.innerHTML = "Payment sent!";

        paymentAmount.innerHTML = '0';
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

    let edit = document.createElement("button");
    edit.id = employeeID;
    edit.className += ("editBtn" + " " + employeeID);
    edit.innerHTML = "Edit";
    edit.setAttribute("onclick", "javascript: runEdit(this);")
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

    let salaries = document.createElement("span");
    salaries.innerHTML = salary;
    salariesDiv.appendChild(salaries);

    let totalDiv = document.createElement("div");
    totalDiv.className += ("total");
    totalDiv.innerHTML = "Total payroll: ";
    body.appendChild(totalDiv);

    let total = document.createElement("span");
    total.id += ("total-span" + " " + employeeID);
    total.innerHTML = total_payroll;
    totalDiv.appendChild(total);

    let payroll = document.createElement("button");
    payroll.className += ("payroll" + " " + employeeID);
    payroll.innerHTML = "Make payroll";
    body.appendChild(payroll);
}

displayCards.forEach(({id, name, position, schedule, hours, salary, total_payroll, img}) => {
    generateModal(id, name, position, schedule, hours, salary, total_payroll);
    runModal(id);
});