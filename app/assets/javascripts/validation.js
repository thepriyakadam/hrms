
$(function(){

  $.validator.addMethod("loginRegex", function(value, element) {
          return this.optional(element) || /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/.test(value);
  }, "Email address must be in the format of name@domain.com");

  $("#company").validate({
    rules: {
      "company[name]":{
        required: true,
        maxlength: 30
        // <!--loginRegex: true-->
      },
      "company[registration_no]":{
        maxlength: 15,
        required: true
      },
  
      "company[contact_no]":{
          maxlength: 13,
          required: true
      },

      "company[address]":{
          maxlength: 100,
          required: true
      },

      "company[tax_no]":{
          maxlength: 5,
          required: true
      },

      "company[email]":{
        loginRegex: true
      },
  
      "company[professional_tax_no]":{
          maxlength: 10,
          required: true
      }
    },
    messages: {
      "company[name]":{
        required: "Please specify company",
        maxlength: "Name allows upto 30 alphabets"
      },
      "company[registration_no]":{
        required: "Please Specify Registration No",
        maxlength: "Registration allows upto 30 alphabets"
      },
 
     "company[contact_no]":{
      required: "Please Specify Contact No",
        maxlength: "Enter the Correct contact number"
      },
  
      "company[tax_no]":{
        required: "Please Specify Tax No",
          maxlength: "Enter the Valid Tax number"
      },
     
     "company[address]":{
        required: "Please Specify Address",
          maxlength: "Enter the Address"
      },

      "company[email]":{
       required: "Please Specify Email ID",
        maxlength: "Email address can't exceed max limit"
      },

      "company[professional_tax_no]":{
        required: "Please Specify Professional Tax number",
          maxlength: "Enter the Valid Professional Tax number"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }
  });


$("#company_location").validate({
    rules: {
      "company_location[name]":{
        required: true,
        maxlength: 30
      },

     "company_location[email]":{
        loginRegex: true,
        required: true
      }, 

     "company_location[contact_no]":{
        maxlength: 13,
        required: true
      },

      "company_location[district]":{
        maxlength: 100,
        required: true
      },

     "company_location[city]":{
        maxlength: 50,
        required: true
      },

      "company_location[pin_code]":{
        maxlength: 6,
        required: true
      },

      "company_location[address]":{
        maxlength: 100,
        required: true
      }
    },
    messages: {
      "company_location[name]":{
        required: "Please specify company Name",
        maxlength: "Name allows upto 30 alphabets"
      },
      "company_location[email]":{
       required: "Please Specify Email ID",
        maxlength: "Email address can't exceed max limit"
      },

    "company_location[district]":{
      required: "Please Specify District",
        maxlength: "Cant exceed more than 100 char"
      },

     "company_location[contact_no]":{
      required: "Please Specify Contact No",
        maxlength: "Enter the Correct contact number"
      },
      
       "company_location[city]":{
      required: "Please Specify Your City",
        maxlength: "Cant exceed more than 50 char"
      },
      
      "company_location[address]":{
      required: "Please Specify Address",
        maxlength: "Enter the Address upto 100 char max"
      },

      "company_location[pincode]":{
      required: "Please Enter your Pincode Details",
        maxlength: "Please Enter Valid Pincode Details"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });


$("#company_type").validate({
    rules: {
      "company_type[name]":{
        required: true,
        maxlength: 30
      }
    },
    messages: {
      "company_type[name]":{
        required: "Please specify company Name",
        maxlength: "Name allows upto 30 alphabets"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });



$("#department").validate({
    rules: {
      "department[name]":{
        required: true,
        maxlength: 30
      },

  "department[email]":{
        loginRegex: true,
        required: true
      },
  "department[pin_code]":{
        maxlength: 6,
        required: true
      },

  "department[address]":{
        maxlength: 100,
        required: true
      },

   "department[head_of_department]":{
        maxlength: 50,
        required: true
      },
      "department[contact_no]":{
      maxlength: 13,
        required: true
      },
      "department[manager]":{
        maxlength: 50,
        required: true
      },
      "department[hr]":{
        maxlength: 50,
        required: true
      }





    },
    messages: {
      "department[name]":{
        required: "Please specify Dept name ",
        maxlength: "Dept Name allows upto upto 30 char maxs"
    },
      "department[email]":{
       required: "Please Specify Email ID",
        maxlength: "Email address can't exceed max limit"
      },

     "department[pincode]":{
      required: "Please Enter your Pincode Details",
        maxlength: "Please Enter Valid Pincode Details"
      },

      "department[address]":{
       required: "Please Specify Address",
        maxlength: "Enter the Address upto 100 char max"
      },
      "department[head_of_department]":{
       required: "Please Head Of Department",
        maxlength: "Enter the Address upto 50 char max"
      },
      "department[contact_no]":{
      required: "Please Specify Contact No",
        maxlength: "Enter the Correct contact number"
      },
      "department[manager]":{
       required: "Please Specify Manager Details",
        maxlength: "Enter the Manager detail upto 50 char max"
      },
      "department[hr]":{
       required: "Please Specify HR Details",
        maxlength: "Enter the HR detail upto 50 char max"
      }

    },


    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });

$("#department_type").validate({
    rules: {
      "department_type[name]":{
        required: true,
        maxlength: 30
      }
    },
    messages: {
      "department_type[name]":{
        required: "Please specify Dept Name",
        maxlength: "Name allows upto 30 alphabets"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });



$("#employee").validate({
    rules: {
      "employee[first_name]":{
        required: true,
        maxlength: 30
      },
      "employee[last_name]":{
        required: true,
        maxlength: 30
      },
      "employee[adhar_no]":{
        required: true,
        maxlength: 12
      }
    },
    messages: {
      "employee[first_name]":{
        required: "Please specify Your First Name",
        maxlength: "Name allows upto 30 alphabets"
      },
      "employee[last_name]":{
        required: "Please specify Your Middle Name",
        maxlength: "Name allows upto 30 alphabets"
      },
      "employee[adhar_no]":{
        required: "Please specify 12 digit Adhar No",
        maxlength: "Adhar no allows upto 12 characters"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });


});
