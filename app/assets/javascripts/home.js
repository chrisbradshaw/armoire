# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

var months = ['January','February','March','April','May','June','July','August','September','October','November','December'];       
var today = new Date();
today.setTime(today.getTime());       
document.getElementById("day").innerHTML = today.getDate();
document.getElementById("month").innerHTML = months[today.getMonth()];