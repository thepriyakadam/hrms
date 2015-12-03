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

// $(function () {
  
//     setTimeout(updateComments, 10000);
  
// });

// function updateComments() {
//   $.getScript('/employee_leav_requests');
//   setTimeout(updateComments, 10000);
// }

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
  //Date range picker
  $('#reservation').daterangepicker();
  //Date range picker with time picker
  $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'DD/MM/YYYY h:mm A'});
  
});

// Automatic hide alert
$(function(){
  $("#success-alert").alert();
  $("#success-alert").fadeTo(3000, 500).slideUp(500, function(){
  $("#success-alert").alert('close');
  });   
});

$(function () {
  $('#btnAdd1').click(function () {
      var num     = $('.clonedInput').length, 
          newNum  = new Number(num + 1),      
          newElem = $('#entry' + num).clone().attr('id', 'entry' + newNum).fadeIn('slow'); // 
      newElem.find('.input_award_name').attr('name','award['+ newNum +'][award_name]').attr('id', newNum + '_award_award_name').val('');
      newElem.find('.input_year').attr('name','award['+ newNum +'][year]').attr('id', newNum + '_award_year').val('');
      newElem.find('.input_award_from').attr('name','award['+ newNum +'][award_from]').attr('id', newNum + '_award_award_from').val('');

      $('#entry' + num).after(newElem);
      $('#ID' + newNum + '_title').focus();

      $('#btnDel1').attr('disabled', false);

      if (newNum == 5)
      $('#btnAdd1').attr('disabled', true).prop('value', "You've reached the limit"); // value here updates the text in the 'add' button when the limit is reached 
  });

  $('#btnDel1').click(function () {
  // Confirmation dialog box. Works on all desktop browsers and iPhone.
      if (confirm("Are you sure you wish to remove this section? This cannot be undone."))
          {
              var num = $('.clonedInput').length;
              // how many "duplicatable" input fields we currently have
              $('#entry' + num).slideUp('slow', function () {$(this).remove();
              // if only one element remains, disable the "remove" button
                  if (num -1 === 1)
              $('#btnDel1').attr('disabled', true);
              // enable the "add" button
              $('#btnAdd1').attr('disabled', false).prop('value', "add section");});
          }
      return false; // Removes the last section you added
  });
  // Enable the "add" button
  $('#btnAdd1').attr('disabled', false);
  // Disable the "remove" button
  $('#btnDel1').attr('disabled', true);
});




//Skilleset

// $(function () {
//   $("#example1").DataTable();
//   $('#example2').DataTable({
//     "paging": true,
//     "lengthChange": false,
//     "searching": false,
//     "ordering": true,
//     "info": true,
//     "autoWidth": false
//   });
// });

// $(function () {
//   //Initialize Select2 Elements
//   $(".select2").select2();
// });

// $(function () {
//   //Datemask dd/mm/yyyy
//   $(".datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
//   //Datemask2 mm/dd/yyyy
//   $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
//   //Money Euro
//   $("[data-mask]").inputmask();
//   //Date range picker
//   $('#reservation').daterangepicker();
//   //Date range picker with time picker
//   $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'DD/MM/YYYY h:mm A'});
  
// });

// // Automatic hide alert
// $(function(){
//   $("#success-alert").alert();
//   $("#success-alert").fadeTo(3000, 500).slideUp(500, function(){
//   $("#success-alert").alert('close');
//   });   
// });

// $(function () {
//   $('#btnAdd').click(function () {
//       var num1     = $('.clonedInput').length, 
//           newNum1  = new Number(num1 + 1),      
//           newElem1 = $('#entry' + num1).clone().attr('id', 'entry' + newNum1).fadeIn('slow'); // 
//       newElem1.find('.input_name').attr('name','skillset['+ newNum1 +'][name]').attr('id', newNum1 + '_skillset_name').val('');
//       newElem1.find('.input_skill_level').attr('skill_level','skillset['+ newNum1 +'][skill_level]').attr('id', newNum1 + '_skillset_skill_level').val('');
      
//       $('#entry' + num1).after(newElem1);
//       $('#ID' + newNum1 + '_title').focus();

//       $('#btnDel').attr('disabled', false);

//       if (newNum1 == 5)
//       $('#btnAdd').attr('disabled', true).prop('value', "You've reached the limit"); // value here updates the text in the 'add' button when the limit is reached 
//   });

//   $('#btnDel').click(function () {
//   // Confirmation dialog box. Works on all desktop browsers and iPhone.
//       if (confirm("Are you sure you wish to remove this section? This cannot be undone."))
//           {
//               var num1 = $('.clonedInput').length;
//               // how many "duplicatable" input fields we currently have
//               $('#entry' + num1).slideUp('slow', function () {$(this).remove();
//               // if only one element remains, disable the "remove" button
//                   if (num1 -1 === 1)
//               $('#btnDel').attr('disabled', true);
//               // enable the "add" button
//               $('#btnAdd').attr('disabled', false).prop('value', "add section");});
//           }
//       return false; // Removes the last section you added
//   });
//   // Enable the "add" button
//   $('#btnAdd').attr('disabled', false);
//   // Disable the "remove" button
//   $('#btnDel').attr('disabled', true);
// });



// //Skilleset

// $(function () {
//   $("#example3").DataTable();
//   $('#example4').DataTable({
//     "paging": true,
//     "lengthChange": false,
//     "searching": false,
//     "ordering": true,
//     "info": true,
//     "autoWidth": false
//   });
// });

// $(function () {
//   //Initialize Select2 Elements
//   $(".select4").select4();
// });

// $(function () {
//   //Datemask dd/mm/yyyy
//   $(".datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
//   //Datemask2 mm/dd/yyyy
//   $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
//   //Money Euro
//   $("[data-mask]").inputmask();
//   //Date range picker
//   $('#reservation').daterangepicker();
//   //Date range picker with time picker
//   $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'DD/MM/YYYY h:mm A'});
  
// });

// // Automatic hide alert
// $(function(){
//   $("#success-alert").alert();
//   $("#success-alert").fadeTo(3000, 500).slideUp(500, function(){
//   $("#success-alert").alert('close');
//   });   
// });

// $(function () {
//   $('#btnAdd').click(function () {
//       var num1     = $('.clonedInput').length, 
//           newNum1  = new Number(num1 + 1),      
//           newElem1 = $('#entry' + num1).clone().attr('id', 'entry' + newNum1).fadeIn('slow'); // 
//       newElem1.find('.input_no_of_year_experince').attr('no_of_year_experince','experince['+ newNum1 +'][no_of_year_experince]').attr('id', newNum1 + '_experince_no_of_year_experince').val('');
//       newElem1.find('.input_company_name').attr('company_name','experince['+ newNum1 +'][company_name]').attr('id', newNum1 + '_experince_company_name').val('');
//       newElem1.find('.input_designation').attr('designation','experince['+ newNum1 +'][designation]').attr('id', newNum1 + '_experince_designation').val('');
//       newElem1.find('.input_ctc').attr('ctc','experince['+ newNum1 +'][ctc]').attr('id', newNum1 + '_experince_ctc').val('');
      
//       $('#entry' + num1).after(newElem);
//       $('#ID' + newNum1 + '_title').focus();

//       $('#btnDel').attr('disabled', false);

//       if (newNum1 == 5)
//       $('#btnAdd').attr('disabled', true).prop('value', "You've reached the limit"); // value here updates the text in the 'add' button when the limit is reached 
//   });

//   $('#btnDel').click(function () {
//   // Confirmation dialog box. Works on all desktop browsers and iPhone.
//       if (confirm("Are you sure you wish to remove this section? This cannot be undone."))
//           {
//               var num1 = $('.clonedInput').length;
//               // how many "duplicatable" input fields we currently have
//               $('#entry' + num1).slideUp('slow', function () {$(this).remove();
//               // if only one element remains, disable the "remove" button
//                   if (num1 -1 === 1)
//               $('#btnDel').attr('disabled', true);
//               // enable the "add" button
//               $('#btnAdd').attr('disabled', false).prop('value', "add section");});
//           }
//       return false; // Removes the last section you added
//   });
//   // Enable the "add" button
//   $('#btnAdd').attr('disabled', false);
//   // Disable the "remove" button
//   $('#btnDel').attr('disabled', true);
// });