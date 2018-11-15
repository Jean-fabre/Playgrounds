import "bootstrap";
import $ from "jquery";
import { fullcalendar } from "fullcalendar";

$(function () {
$('#calendar').fullCalendar({
  events: '/calendar_events',
  header:{
    left: "month,agendaWeek, agendaDay",
    center: "title",
    right: "today, prevYear,prev,next,nextYear"
  }
});
})




function toggle_div_hide(id) {
var divelement = document.getElementById(id);
  console.log(divelement)
  if(divelement.style.display == 'none') {
    divelement.style.display = 'block';
  }
  else {
    divelement.style.display = 'none'
  }
}
document.getElementById('hide-calendar').addEventListener('click', function() { toggle_div_hide('calendar') })
