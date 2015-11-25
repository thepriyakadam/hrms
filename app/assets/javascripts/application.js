// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require_tree .


$(function () {
  $("#example1").DataTable();
  $('#example2').DataTable({
    "paging": true,
    "lengthChange": false,
    "searching": false,
    "ordering": true,
    "info": true,
    "autoWidth": false
  });
});

$(function () {
  //Initialize Select2 Elements
  $(".select2").select2();
});

$(function () {
  //Datemask dd/mm/yyyy
  $(".datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
  //Datemask2 mm/dd/yyyy
  $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
  //Money Euro
  $("[data-mask]").inputmask();
});

// Automatic hide alert
$(function(){
  $("#success-alert").alert();
  $("#success-alert").fadeTo(3000, 500).slideUp(500, function(){
  $("#success-alert").alert('close');
  });   
});

$(function () {
  $('#btnAdd').click(function () {
      var num     = $('.clonedInput').length, 
          newNum  = new Number(num + 1),      
          newElem = $('#entry' + num).clone().attr('id', 'entry' + newNum).fadeIn('slow'); // 
      newElem.find('.input_award_name').attr('name','award['+ newNum +'][award_name]').attr('id', newNum + '_award_award_name').val('');
      newElem.find('.input_year').attr('name','award['+ newNum +'][year]').attr('id', newNum + '_award_year').val('');
      newElem.find('.input_award_from').attr('name','award['+ newNum +'][award_from]').attr('id', newNum + '_award_award_from').val('');

      $('#entry' + num).after(newElem);
      $('#ID' + newNum + '_title').focus();

      $('#btnDel').attr('disabled', false);

      if (newNum == 5)
      $('#btnAdd').attr('disabled', true).prop('value', "You've reached the limit"); // value here updates the text in the 'add' button when the limit is reached 
  });

  $('#btnDel').click(function () {
  // Confirmation dialog box. Works on all desktop browsers and iPhone.
      if (confirm("Are you sure you wish to remove this section? This cannot be undone."))
          {
              var num = $('.clonedInput').length;
              // how many "duplicatable" input fields we currently have
              $('#entry' + num).slideUp('slow', function () {$(this).remove();
              // if only one element remains, disable the "remove" button
                  if (num -1 === 1)
              $('#btnDel').attr('disabled', true);
              // enable the "add" button
              $('#btnAdd').attr('disabled', false).prop('value', "add section");});
          }
      return false; // Removes the last section you added
  });
  // Enable the "add" button
  $('#btnAdd').attr('disabled', false);
  // Disable the "remove" button
  $('#btnDel').attr('disabled', true);
});