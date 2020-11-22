//var product = document.getElementById("product"), employeeList;
//employeeList = product.getAttribute("data-prodnumber");


for(var i=0; i<list.length; i++){
    console.log(list[i]);
}

let displayCards = [];

list.forEach(({id, name, position, schedule, hours, salary}) => {
    displayCards.push({id, name, position, schedule, hours, salary});
});

function runModal(employeeID){
    var edit = document.getElementById("myEdit" + " " + employeeID);

    var btn = document.getElementById("editBtn" + " " + employeeID);

    var submitSave = document.getElementsByClassName("save" + " " + employeeID)[0];

    /*btn.onclick = function() {
        edit.style.display = "block";
    }*/

    submitSave.onclick = function(){
        submitSave.style.backgroundColor = "#44D362";
        submitSave.innerHTML = "Saved";
    }
}

function generateModal(employeeID, name, position, schedule, hours, salary){
    let main = document.querySelector(".edits");
    let node = document.createElement("div");
    node.className += "edit";
    node.id += ("myEdit" + " " + employeeID);
    main.appendChild(node);

    let content = document.createElement("div");
    content.className += "edit-content";
    node.appendChild(content);

    let header = document.createElement("div");
    header.className += "edit-header";
    content.appendChild(header);

    let editHeader = document.createElement("div");
    editHeader.className += ("editInfo" + " " + employeeID);
    editHeader.innerHTML = "Edit information";
    header.appendChild(editHeader);

    let staffName = document.createElement("div");
    staffName.className += "staffNameEdit";
    header.appendChild(staffName);

    let nameSpan = document.createElement("h3");
    nameSpan.className += "nameSpanEdit";
    nameSpan.innerHTML = name;
    staffName.appendChild(nameSpan);

    let body = document.createElement("div");
    body.className += "edit-body";
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

    let days = document.createElement('div');
    days.className = 'schedule-days';
    body.appendChild(days);

    let scheduleDay1 = document.createElement("input");
    scheduleDay1.type = 'checkbox';
    scheduleDay1.id = 'monday';
    scheduleDay1.value = 'M';
    scheduleDay1.name = 'days[]';
    scheduleDay1.className = 'days-circle';
    for (var i = 0; i < schedule.length; i++){
        if (schedule.charAt(i) === scheduleDay1.value)
            scheduleDay1.checked = true;
    }
    days.appendChild(scheduleDay1);

    let scheduleDay2 = document.createElement("input");
    scheduleDay2.type = 'checkbox';
    scheduleDay2.id = 'tuesday';
    scheduleDay2.value = 'T';
    scheduleDay2.name = 'days[]';
    scheduleDay2.className = 'days-circle';
    for (var i = 0; i < schedule.length; i++){
        if (schedule.charAt(i) === scheduleDay2.value)
            scheduleDay2.checked = true;
    }
    days.appendChild(scheduleDay2);

    let scheduleDay3 = document.createElement("input");
    scheduleDay3.type = 'checkbox';
    scheduleDay3.id = 'wednesday';
    scheduleDay3.value = 'W';
    scheduleDay3.name = 'days[]';
    scheduleDay3.className = 'days-circle';
    for (var i = 0; i < schedule.length; i++){
        if (schedule.charAt(i) === scheduleDay3.value)
            scheduleDay3.checked = true;
    }
    days.appendChild(scheduleDay3);

    let scheduleDay4 = document.createElement("input");
    scheduleDay4.type = 'checkbox';
    scheduleDay4.id = 'thursday';
    scheduleDay4.value = 'R';
    scheduleDay4.name = 'days[]';
    scheduleDay4.className = 'days-circle';
    for (var i = 0; i < schedule.length; i++){
        if (schedule.charAt(i) === scheduleDay4.value)
            scheduleDay4.checked = true;
    }
    days.appendChild(scheduleDay4);

    let scheduleDay5 = document.createElement("input");
    scheduleDay5.type = 'checkbox';
    scheduleDay5.id = 'friday';
    scheduleDay5.value = 'F';
    scheduleDay5.name = 'days[]';
    scheduleDay5.className = 'days-circle';
    for (var i = 0; i < schedule.length; i++){
        if (schedule.charAt(i) === scheduleDay5.value)
            scheduleDay5.checked = true;
    }
    days.appendChild(scheduleDay5);

    let scheduleDay6 = document.createElement("input");
    scheduleDay6.type = 'checkbox';
    scheduleDay6.id = 'saturday';
    scheduleDay6.value = 'St';
    scheduleDay6.name = 'days[]';
    scheduleDay6.className = 'days-circle';
    for (var i = 0; i < schedule.length; i++){
        if (schedule.charAt(i) === scheduleDay6.value)
            scheduleDay6.checked = true;
    }
    days.appendChild(scheduleDay6);

    let scheduleDay7 = document.createElement("input");
    scheduleDay7.type = 'checkbox';
    scheduleDay7.id = 'sunday';
    scheduleDay7.value = 'S';
    scheduleDay7.name = 'days[]';
    scheduleDay7.className = 'days-circle';
    for (var i = 0; i < schedule.length; i++){
        if (schedule.charAt(i) === scheduleDay7.value)
            scheduleDay7.checked = true;
    }
    days.appendChild(scheduleDay7);

    let hourDiv = document.createElement("div");
    hourDiv.className += ("hour");
    hourDiv.innerHTML = "Working hours: ";
    body.appendChild(hourDiv);

    let hour = document.createElement("span");
    hour.innerHTML = hours;
    hourDiv.appendChild(hour);

    let salariesDiv = document.createElement("div");
    salariesDiv.className += ("salaries");
    salariesDiv.innerHTML = "Salary: ";
    body.appendChild(salariesDiv);

    let salaries = document.createElement("span");
    salaries.innerHTML = salary;
    salariesDiv.appendChild(salaries);

    let save = document.createElement("button");
    save.className += ("save" + " " + employeeID);
    save.innerHTML = "Save";
    body.appendChild(save);
}

displayCards.forEach(({id, name, position, schedule, hours, salary}) => {
    generateModal(id, name, position, schedule, hours, salary);
    runModal(id);
});