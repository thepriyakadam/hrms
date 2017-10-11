jQuery ->
  $('.best_in_place').best_in_place();

  $('#calendar').fullCalendar({
    employee_attendences: '/employee_attendences.json'
});