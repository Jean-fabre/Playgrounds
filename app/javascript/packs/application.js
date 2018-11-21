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

function sideBar() {
  console.log('AM I REAL')
  $(".sidebar-dropdown > a").click(function() {
    $(".sidebar-submenu").slideUp(200);
      if (
        $(this)
          .parent()
          .hasClass("active")
      ) {
        $(".sidebar-dropdown").removeClass("active");
        $(this)
          .parent()
          .removeClass("active");
      } else {
        $(".sidebar-dropdown").removeClass("active");
        $(this)
          .next(".sidebar-submenu")
          .slideDown(200);
        $(this)
          .parent()
          .addClass("active");
        }
      });
  $("#close-sidebar").click(function() {
    $(".page-wrapper").removeClass("toggled");
  });
  $("#show-sidebar").click(function() {
    $(".page-wrapper").addClass("toggled");
  });
}

sideBar();
