var months = ['January','February','March','April','May','June','July','August','September','October','November','December'];       
var today = new Date();
today.setTime(today.getTime());       
document.getElementById("day").innerHTML = today.getDate();
document.getElementById("month").innerHTML = months[today.getMonth()];