//var product = document.getElementById("product"), employeeList;
//employeeList = product.getAttribute("data-prodnumber");


let displayEmployeeEdit = [];

displayCards.forEach(({id, name, position, schedule, hours, salary}) => {
    displayEmployeeEdit.push({id, name, position, schedule, hours, salary});
});

function runModal(employeeID){
    var edit = document.getElementById("myEdit" + " " + employeeID);

    var btn = document.getElementById("editBtn" + " " + employeeID);

    var submitSave = document.getElementsByClassName("edit-submit" + " " + employeeID)[0];

    var all = {};

    /*btn.onclick = function() {
        edit.style.display = "block";
    }*/

    submitSave.onclick = function(){
        submitSave.style.backgroundColor = "#44D362";
        submitSave.innerHTML = "Saved";
        console.log('hello');

        all.id = employeeID;
        console.log(all.id);
        all.position = document.getElementsByClassName('positionOptions')[0].innerHTML;
        console.log(all.position);
        all.schedule = [];
        var checkboxes = document.getElementsByName('days[]');
        for (var checkbox of checkboxes){
            if (checkbox.checked)
                all.schedule.push(checkbox.value);
        }
        console.log(all.schedule);
        all.hour = document.getElementsByClassName('hourChanged')[0].value;
        console.log(all.hour);
        all.salary = document.getElementsByClassName('salariesChanged')[0].value;
        console.log(all.salary);
        $.post("/employees", JSON.stringify(all),
            function(response){

            });
    }
}

function generateModal(employeeID, name, position, schedule, hours, salary){
<<<<<<< HEAD
    var all = {};
=======
>>>>>>> 0f4a428a141c0fada6472b83136d23dabcc8f59a

    let main = document.getElementById("main");
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

    let staff = document.createElement("div");
    staff.className += "staff";
    header.appendChild(staff);

    let staffName = document.createElement("div");
    staffName.className += "staff-name";
    staff.appendChild(staffName);

    let nameSpan = document.createElement("h3");
    nameSpan.className += "nameSpan";
    nameSpan.innerHTML = name;
    staffName.appendChild(nameSpan);

    let form = document.createElement('form');
    form.className += 'form';
    /*form.action = "<%= request.getContextPath() %>/checkRooms";*/
    form.method = "post";
    staff.appendChild(form);

    let staffID = document.createElement("div");
    staffID.className += "flex";
    form.appendChild(staffID);

    let staffIdL = document.createElement('div');
    staffIdL.className = 'staffId-label';
    staffIdL.innerHTML = 'Employee ID: ';
    staffID.appendChild(staffIdL);

    let stafffID = document.createElement('input');
    stafffID.value = employeeID;
    stafffID.disabled = true;
    staffID.appendChild(stafffID);

<<<<<<< HEAD
    all.id = employeeID;
=======
>>>>>>> 0f4a428a141c0fada6472b83136d23dabcc8f59a

    let posClean = document.createElement("div");
    posClean.className += "flex";
    form.appendChild(posClean);

    let positionDiv = document.createElement("div");
    positionDiv.className += ("position-label");
    positionDiv.innerHTML = "Position: ";
    posClean.appendChild(positionDiv);

    let positions = document.createElement("div");
    posClean.appendChild(positions);

    let positionSelect = document.createElement('select');
    positions.className += 'positionOptions';
    positions.appendChild(positionSelect);

    let positionOptions = document.createElement('option');
    if (position === 'Cleaning staff'){
        let positionOptions2 = document.createElement('option');
        positionOptions2.innerHTML = position;
        positionOptions2.value = position;
        positionOptions.innerHTML = 'Desk clerk';
        positionOptions.value = 'Desk clerk';
        positionSelect.appendChild(positionOptions2);
    }
    else {
        let positionOptions2 = document.createElement('option');
        positionOptions2.innerHTML = position;
        positionOptions2.value = position;
        positionOptions.innerHTML = 'Cleaning staff';
        positionOptions.value = 'Cleaning staff';
        positionSelect.appendChild(positionOptions2);
    }
    positionSelect.appendChild(positionOptions);

    let sched = document.createElement("div");
    sched.className += "flex";
    form.appendChild(sched);

    let schedulesDiv = document.createElement("div");
    schedulesDiv.className += ("schedule-label");
    schedulesDiv.innerHTML = "Working Schedule: ";
    sched.appendChild(schedulesDiv);

    let days = document.createElement('div');
    days.className = 'schedule';
    sched.appendChild(days);

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

    let label1 = document.createElement('label');
    label1.htmlFor = 'monday';
    label1.innerHTML = 'M';
    days.appendChild(label1);

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

    let label2 = document.createElement('label');
    label2.htmlFor = 'tuesday';
    label2.innerHTML = 'T';
    days.appendChild(label2);

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

    let label3 = document.createElement('label');
    label3.htmlFor = 'wednesday';
    label3.innerHTML = 'W';
    days.appendChild(label3);

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

    let label4 = document.createElement('label');
    label4.htmlFor = 'thursday';
    label4.innerHTML = 'R';
    days.appendChild(label4);

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

    let label5 = document.createElement('label');
    label5.htmlFor = 'friday';
    label5.innerHTML = 'F';
    days.appendChild(label5);

    let scheduleDay6 = document.createElement("input");
    scheduleDay6.type = 'checkbox';
    scheduleDay6.id = 'saturday';
    scheduleDay6.value = 'St';
    scheduleDay6.name = 'days[]';
    scheduleDay6.className = 'days-circle';
    for (var i = 0; i < schedule.length; i++){
        if (schedule.charAt(i) === scheduleDay6.value[0] && schedule.charAt(i+1) === scheduleDay6.value[1])
            scheduleDay6.checked = true;
    }
    days.appendChild(scheduleDay6);

    let label6 = document.createElement('label');
    label6.htmlFor = 'saturday';
    label6.innerHTML = 'St';
    days.appendChild(label6);

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

    let label7 = document.createElement('label');
    label7.htmlFor = 'sunday';
    label7.innerHTML = 'S';
    days.appendChild(label7);

    let hourr = document.createElement("div");
    hourr.className += "flex";
    form.appendChild(hourr);

    let hourDiv = document.createElement("div");
    hourDiv.className += ("hours-label");
    hourDiv.innerHTML = "Working hours: ";
    hourr.appendChild(hourDiv);

    let hour = document.createElement("input");
    hour.className = 'hourChanged';
    hour.value = hours;
    hourr.appendChild(hour);

    let salar = document.createElement("div");
    salar.className += "flex";
    form.appendChild(salar);

    let salariesDiv = document.createElement("div");
    salariesDiv.className += ("salary-label");
    salariesDiv.innerHTML = "Salary: ";
    salar.appendChild(salariesDiv);

    let salaries = document.createElement("input");
    salaries.className = 'salariesChanged';
    salaries.type = 'number';
    salaries.value = salary;
    salar.appendChild(salaries);

    let save = document.createElement("button");
    /*save.type = 'submit';*/
    save.className += ("edit-submit" + " " + employeeID);
    save.innerHTML = "Save";
    form.appendChild(save);
<<<<<<< HEAD

    save.onclick = () => {
=======
/*
    document.getElementsByClassName('edit-submit').onclick = () => {
>>>>>>> 0f4a428a141c0fada6472b83136d23dabcc8f59a
        all.position = document.getElementsByClassName('positionOptions').innerHTML;
        console.log(all.position);
        var checkboxes = document.getElementsByName('days[]');
        for (var checkbox of checkboxes){
            if (checkbox.checked)
                all.schedule += checkbox.value + ' ';
        }
<<<<<<< HEAD
        all.hour = document.getElementsByClassName('hourChanged').value;
        all.salary = document.getElementsByClassName('salariesChanged').value;
        $.get("/employees", JSON.stringify(all),
            function(response){

            });
    }
=======
        console.log(all.schedule);
        all.hour = document.getElementsByClassName('hourChanged').value;
        console.log(all.hour);
        all.salary = document.getElementsByClassName('salariesChanged').value;
        console.log(all.salary);
        $.post("/employees", JSON.stringify(all),
            function(response){

            });
    }*/
>>>>>>> 0f4a428a141c0fada6472b83136d23dabcc8f59a
}
function runEdit(el){
    displayEmployeeEdit.forEach(({id, name, position, schedule, hours, salary}) => {
        if(id == el.id){
            let cleaning = document.getElementById("cleaning");
            let reception = document.getElementById("reception");
            let prevModal = document.getElementById("myModal" + " " + id);

            prevModal.style.display = "none";
            cleaning.style.display = "none";
            reception.style.display = "none";
            generateModal(id, name, position, schedule, hours, salary);
            runModal(id);
        }
    });
}
