$(function(){

  $.validator.addMethod("loginRegex", function(value, element) {
          return this.optional(element) || /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/.test(value);
  }, "Email address must be in the format of name@domain.com");

  $("#company").validate({
    rules: {
      "company[name]":{
        required: true,
        maxlength: 30,
        loginRegex: true
      },
      "company[registration_no]":{
        maxlength: 30
      }
    },
    messages: {
      "company[name]":{
        required: "Please specify company",
        maxlength: "Name allows upto 30 alphabets"
      },
      "company[registration_no]":{
        maxlength: "Registration allows upto 30 alphabets"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }
  });
});