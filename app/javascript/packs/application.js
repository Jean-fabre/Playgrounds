import "bootstrap";
import $ from "jquery";
import { fullcalendar } from "fullcalendar";
$(function () {
$('#calendar').fullCalendar({
  events: '/calendar_events'
});
})
