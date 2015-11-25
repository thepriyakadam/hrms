
$(function(){

  $.validator.addMethod("loginRegex", function (value, element) {
          return this.optional(element) || /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|))?$/.test(value);
  }, "Email address must be in the format of name@domain.com");

  $.validator.addMethod("lettersOnly", function (value, element) {
    return this.optional(element) || /^[a-zA-Z]+$/i.test(value);
}, "Please enter letters only.");

  $.validator.addMethod("numbersOnly", function (value, element) {
    return this.optional(element) || /^[0-9]+$/i.test(value);
}, "Please enter numbers only.");


  $.validator.addMethod("passportNo", function (value, element) {
    return this.optional(element) || /^[a-zA-Z0-9-]+$/i.test(value);
}, "Please enter Valid Passport No.");

  $.validator.addMethod("textOnly", function (value, element) {
    return !/[0-9]*/.test(value);
},"Alpha Characters Only.");

$.validator.addMethod("mobileNo", function (value, element) {
    return /^[0-9-]+$/.test(value);
},"Please Input Valid Mobile No.");


/*jQuery.validator.addMethod(
  "selectNone",
  function (value, element) {
    if (element.value == "none")
    {
      return false;
    }
    else return true;
  },
  "Please select an option."
);
$(document).ready(function() {
  $("#qualification").validate({
    rules: {
      ssc: {
        selectNone: true
      }
    },
  });
});*/


/*$.validator.addMethod("cus_url", function(value, element)
    {
        //return this.optional(element) || /^[A-Z]{5}\d{4}[A-Z]{1}$/.test(value);
        return this.optional(element) || /^(www\.)?[a-zA-Z0-9-\-]{3,}(\.(com|net|org|in))?$/.test(value);
    }, "Invalid URL");*/

/*$.validator.addMethod("cus_url", function(value, element)
    {
        //return this.optional(element) || /^[A-Z]{5}\d{4}[A-Z]{1}$/.test(value);
        return this.optional(element) || /(www+\.)?[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/.test(value);
    }, "Invalid URL");*/


$.validator.addMethod("cus_url", function(value, element)
    {
        //return this.optional(element) || /^[A-Z]{5}\d{4}[A-Z]{1}$/.test(value);
        return this.optional(element) || /^(www\.)?[a-zA-Z0-9\-]{3,}(\.(com|net|org))?$/.test(value);
    }, "Invalid URL");

/*$.validator.addMethod("mobileNo", function (value, element) {
    return /^\+?([0-9]{2})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/.test(value);
},"Please Input Valid Mobile No.");   (http(s)?\/\/:)?*/

$.validator.addMethod("pan", function(value, element)
    {
        //return this.optional(element) || /^[A-Z]{5}\d{4}[A-Z]{1}$/.test(value);
        return this.optional(element) || /^([A-Z]{5})(\d{4})([A-Z]{1})$/.test(value);
    }, "Invalid Pan Number");

/*
$.validator.addMethod("cus_url", function(value, element)
    {
        //return this.optional(element) || /^[A-Z]{5}\d{4}[A-Z]{1}$/.test(value);
        return this.optional(element) || /^(www\.)?[a-zA-Z\-]{3,}(\.(com|net|org))?$/.test(value);
    }, "Invalid URL");*/

// custom method for url validation with or without http://
/*$.validator.addMethod("cus_url", function (value, element) { 
  if(value.substr(0,7) != 'www'){
    value = 'www' + value;
  }
  if(value.substr(value.length-1, 1) != '/'){
    value = value + '/';
  }
  return this.optional(element) || /^(www)\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/i.test(value); 
}, "Not valid url.");

$.validator.addMethod("website", function (value, element) {
    return /(http(s)?:\\)?([\w-]+\.)+[\w-]+[.com|.in|.org]+(\[\?%&=]*)?/.test(value);
},"Please Enter Valid Website Name.");

 /* $.validator.addMethod("textOnly", function (value, element) {
    return ! /^(http|https)?:\/\/[a-zA-Z0-9-\.]+\.[a-z]{2,4}/.test(value);
},"PLease Enter Valid Website Name.");*/

/*$.validator.addMethod("address", function (value, element) {
    return /^[0-9a-zA-Z]+$/.test(value);
},"Alpha Characters Only.");*/

$.validator.addMethod("reg_no", function (value, element) {
    return /^[a-zA-Z0-9-\/] ?([a-zA-Z0-9@.-\/]|[a-zA-Z0-9-\/] )*[a-zA-Z0-9-\/]$/.test(value);
},"Please Enter Valid Reg No.");

$.validator.addMethod("address", function (value, element) {
    return /^[a-zA-Z0-9-\/] ?([a-zA-Z0-9-\/]|[a-zA-Z0-9-\/] )*[a-zA-Z0-9-\/]$/.test(value);
},"Alpha Characters Only.");

 
  $("#company").validate({
    rules: {
      "company[name]":{
        required: true,
        maxlength: 30,
        lettersOnly:true
      },
      "company[registration_no]":{
        maxlength: 15,
        required: true,
      },
  
      "company[contact_no]":{
          maxlength: 14,
          required: true,
          mobileNo: true
      },

      "company[address]":{
          maxlength: 100,
          required: true,
          address: true
      },

      "company[tax_no]":{
          maxlength: 5,
          required: true
      },
      "company[starting_date]":{
          required: true
      },

      "company[email]":{
        loginRegex: true,
        required: true
      },
  
      "company[professional_tax_no]":{
          maxlength: 10,
          required: true
      },
      "company[pan_card_no]":{
          maxlength: 10,
          required: true,
          pan:true
      },
      "company[city]":{
          maxlength: 30,
          required: true,
          lettersOnly:true
      },
      "company[district]":{
          maxlength: 30,
          required: true,
          lettersOnly:true
      },
      "company[pin_code]":{
          maxlength: 6,
          required: true,
          numbersOnly:true
      },
      "company[state]":{
          maxlength: 50,
          required: true,
          lettersOnly:true
      },
      "company[web_site]":{
          maxlength: 30,
          required: true,
          cus_url:true
      },
      "company[ceo_name]":{
          maxlength: 30,
          required: true,
          lettersOnly: true

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
      "company[pan_card_no]":{
        required: "Please Enter Valid Pancard Details",
          maxlength: "Enter the Pancard Details max 9 char"
      },

      "company[email]":{
       required: "Please Specify Email ID",
        maxlength: "Email address can't exceed max limit"
      },
      "company[starting_date]":{
          required: "Date can't be blank",
      },

      "company[professional_tax_no]":{
        required: "Please Specify Professional Tax number",
          maxlength: "Enter the Valid Professional Tax number"
      },
      "company[city]":{
        required: "Please Enter City Details",
          maxlength: "City Details allows max 30 characters"
      },
      "company[district]":{
        required: "Please Enter District Details",
          maxlength: "District Details allows max 30 characters"
      },
      "company[pin_code]":{
        required: "Please Enter Pincode Details",
          maxlength: "Pincode Details allows max 9 digits"
      },
      "company[state]":{
        required: "Please Enter State Details",
          maxlength: "State Details allows max 50 characters"
      },
      "company[web_site]":{
        required: "Please Enter Website Name",
          maxlength: "Website Name allows max 30 characters"
      },
      "company[ceo_name]":{
        required: "Please Enter CEO Name",
          maxlength: "CEO Name allows max 30 characters"
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
        maxlength: 30,
        lettersOnly:true
      },

     "company_location[email]":{
        loginRegex: true,
        required: true,
        loginRegex: true
      }, 

     "company_location[contact_no]":{
        maxlength: 13,
        required: true,
        mobileNo: true
      },

      "company_location[district]":{
        maxlength: 100,
        required: true,
        lettersOnly:true
      },

     "company_location[city]":{
        maxlength: 50,
        required: true,
        lettersOnly:true
      },

      "company_location[pin_code]":{
        maxlength: 6,
        required: true,
        numbersOnly: true

      },

      "company_location[address]":{
        maxlength: 100,
        required: true,
        address: true

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

      "company_location[pin_code]":{
      required: "Please Enter your Pincode Details",
        maxlength: "Please Enter Valid Pincode Details upto 6 digit max"
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
        maxlength: 30,
        lettersOnly:true
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
        maxlength: 30,
        lettersOnly:true
      },

  "department[email]":{
        loginRegex: true,
        required: true,
        maxlength: 30
      },
  "department[pin_code]":{
        maxlength: 6,
        required: true,
        numbersOnly: true
      },

  "department[address]":{
        maxlength: 100,
        required: true,
        address: true
      },

   "department[head_of_department]":{
        maxlength: 50,
        required: true,
        lettersOnly:true
      },
      "department[contact_no]":{
      maxlength: 13,
        required: true,
        mobileNo: true
      },
      "department[manager]":{
        maxlength: 50,
        required: true,
        lettersOnly:true
      },
      "department[hr]":{
        maxlength: 50,
        required: true,
        lettersOnly:true
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
      required: "Please Enter Pincode Details",
          maxlength: "Pincode Details allows max 9 digits"
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
        maxlength: 30,
        lettersOnly:true
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
        maxlength: 30,
        lettersOnly:true
      },
      "employee[last_name]":{
        required: true,
        maxlength: 30,
        lettersOnly:true
      },
      "employee[adhar_no]":{
        required: true,
        maxlength: 12,
        numbersOnly: true
      },
      "employee[pan_no]":{
        required: true,
        maxlength: 10
      },
      "employee[licence_no]":{
        required: true,
        maxlength: 17
      },
      "employee[passport_no]":{
        required: true,
        maxlength: 6
      },
      "employee[permanent_address]":{
        maxlength: 100,
        required: true,
        address: true
      },
      "employee[state]":{
        maxlength: 50,
        required: true,
        lettersOnly:true
      },
      "employee[district]":{
        maxlength: 50,
        required: true,
         lettersOnly:true
      },
      "employee[city]":{
        maxlength: 30,
        required: true,
         lettersOnly:true
      },
      "employee[pin_code]":{
        maxlength: 9,
        required: true,
        numbersOnly: true
      },
      "employee[current_address]":{
        maxlength: 50,
        required: true,
        address: true
      },
      "employee[contact_no]":{
          maxlength: 13,
          required: true,
          mobileNo: true
      },
      "employee[email]":{
        loginRegex: true,
        required: true
      },
      // "joining_detail[reffernce_from]":{
      //   maxlength: 50,
      //   required: true
      // },
      // "joining_detail[admin_hr]":{
      //   maxlength: 50,
      //   required: true
      // },
      // "joining_detail[designation]":{
      //   maxlength: 50,
      //   required: true
      // },
      // "joining_detail[account_no]":{
      //   maxlength: 9,
      //   required: true
      // },
      // "joining_detail[ctc]":{
      //   maxlength: 7,
      //   required: true
      // },
      // "employee[date_of_birth]":{
      //   required: true
      // },
      // "employee[status]":{
      //   maxlength: 15,
      //   required: true
      // },
      // "joining_detail[joining_date]":{
      //   required: true
      // },
      

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
      },
      "employee[pan_no]":{
        required: "Please specify 10 digit Pan No",
        maxlength: "Adhar no allows upto 10 characters"
      },
      "employee[licence_no]":{
        required: "Please specify Licence No",
        maxlength: "Licence No allows upto 17 characters"
      },
      "employee[passport_no]":{
        required: "Please specify  Passport No",
        maxlength: "Passport No allows upto 6 Digits"
      },
      "employee[permanent_address]":{
       required: "Please Specify Address",
        maxlength: "Enter the Address upto 100 char max"
      },
      "employee[state]":{
       required: "Please Specify Your State Details",
        maxlength: "Enter the Stae upto 50 char max"
      },
      "employee[city]":{
       required: "Please Specify Your City Details",
        maxlength: "Enter the City upto 30 char max"
      },
      "employee[district]":{
       required: "Please Specify Your District Details",
        maxlength: "Enter the District upto 50 char max"
      },
      "employee[pin_code]":{
      required: "Please Enter your Pincode Details",
        maxlength: "Please Enter Valid Pincode Details"
      },
        "employee[current_address]":{
       required: "Please Specify Your Current Address",
        maxlength: "Enter the Current Address upto 100 char max"
      },
      "employee[contact_no]":{
      required: "Please Specify Contact No",
        maxlength: "Enter the Correct contact number"
         },
         "employee[email]":{
       required: "Please Specify Email ID",
        maxlength: "Email address can't exceed max limit"
      },
      "employee[date_of_birth]":{
       required: "Please Specify Date Of Birth",
        maxlength: "Date Of Birth can't exceed max limit"
      },
      "employee[status]":{
       required: "Please Specify Status upto 15",
        maxlength: "Status can't exceed max limit"
      }
      // "joining_detail[joining_date]":{
      //  required: "Please Specify Joining Details",
      //  maxlength: "Joining Details can't exceed max limit"
      // },
         
      // "joining_detail[reffernce_from]":{
      //  required: "Please Specify Reference Details",
      //   maxlength: "Enter the Reference Details upto 50 char max"
      // },
      // "joining_detail[admin_hr]":{
      //  required: "Please Specify Admin HR Details",
      //   maxlength: "Enter the Admin HR upto 50 char max"
      // },
      // "joining_detail[tech_hr]":{
      //  required: "Please Specify Tech HR Details",
      //   maxlength: "Enter the Tech HR upto 50 char max"
      // },
      // "joining_detail[designation]":{
      //  required: "Please DESIGNATION Details",
      //   maxlength: "Enter the DESIGNATION upto 50 char max"
      // },
      // "joining_detail[account_no]":{
      //  required: "Please Enter Your Account No Details",
      //   maxlength: "Enter the DESIGNATION upto 9 Digits max"
      // },
      // "joining_detail[ctc]":{
      //  required: "Please Enter Your CTC Details",
      //   maxlength: "Enter the CTC Details"
      // },

    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });

$("#joining_detail").validate({
    rules: {
      "joining_detail[reffernce_from]":{
        maxlength: 50,
        required: true
      },
      "joining_detail[admin_hr]":{
        maxlength: 50,
        required: true
      },
      "joining_detail[designation]":{
        maxlength: 50,
        required: true
      },
      "joining_detail[account_no]":{
        maxlength: 9,
        required: true,
        numbersOnly:true
      },
      "joining_detail[ctc]":{
        maxlength: 7,
        required: true
      },
      "employee[date_of_birth]":{
        required: true
      },
      "employee[status]":{
        maxlength: 15,
        required: true
      },
      "joining_detail[joining_date]":{
        required: true
      }
    },
    messages: {
      "joining_detail[joining_date]":{
       required: "Please Specify Joining Details",
       maxlength: "Joining Details can't exceed max limit"
      },
         
      "joining_detail[reffernce_from]":{
       required: "Please Specify Reference Details",
        maxlength: "Enter the Reference Details upto 50 char max"
      },
      "joining_detail[admin_hr]":{
       required: "Please Specify Admin HR Details",
        maxlength: "Enter the Admin HR upto 50 char max"
      },
      "joining_detail[tech_hr]":{
       required: "Please Specify Tech HR Details",
        maxlength: "Enter the Tech HR upto 50 char max"
      },
      "joining_detail[designation]":{
       required: "Please DESIGNATION Details",
        maxlength: "Enter the DESIGNATION upto 50 char max"
      },
      "joining_detail[account_no]":{
       required: "Please Enter Your Account No Details",
        maxlength: "Enter the DESIGNATION upto 9 Digits max"
      },
      "joining_detail[ctc]":{
       required: "Please Enter Your CTC Details",
        maxlength: "Enter the CTC Details"
      }

    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });

$("#employee_grade").validate({
    rules: {
      "employee_grade[name]":{
        required: true,
        maxlength: 30,
        lettersOnly: true
      }
    },
    messages: {
      "employee_grade[name]":{
        required: "Please specify Employee Name",
        maxlength: "Name allows upto 30 alphabets"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });

$("#employee_physical").validate({
    rules: {
      "employee_physical[employee_id]":{
        required: true,
        maxlength: 30,
        lettersOnly:true
      },
      "employee_physical[hieght]":{
        required: true,
        maxlength: 5,
        numbersOnly:true
      },
      "employee_physical[weight]":{
        required: true,
        maxlength: 6,
        numbersOnly:true
      },
      "employee_physical[size]":{
        required: true,
        maxlength: 6,
        numbersOnly:true
      }
    },
    messages: {
      "employee_physical[name]":{
        required: "Please specify Employee ID",
        maxlength: "Name allows upto 30 alphabets"
      },
      "employee_physical[hieght]":{
        required: "Please specify Employee Height",
        maxlength: "Height allows upto 5 integers"
      },
      "employee_physical[weight]":{
        required: "Please specify Employee Weight",
        maxlength: "Employee Weight allows upto 6 integers"
      },
      "employee_physical[size]":{
        required: "Please specify Size",
        maxlength: "Employee Size allows upto 6 int"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });

$("#experince").validate({
    rules: {
      "experince[employee_id]":{
        required: true,
        maxlength: 30,
        lettersOnly: true
      },
      "experince[no_of_year_experince]":{
        required: true,
        maxlength: 4,
        numbersOnly: true
      },
        "experince[company_name]":{
        required: true,
        maxlength: 30,
        lettersOnly: true
      },
      "experince[designation]":{
        required: true,
        maxlength: 30,
        lettersOnly: true

      },
      "experince[ctc]":{
        required: true,
        maxlength: 6,
        numbersOnly: true
      }
    },
    messages: {
      "experince[employee_id]":{
        required: "Please specify Employee ID",
        maxlength: "Employee ID allows upto 30 alphabets"
      },
      "experince[no_of_year_experince]":{
        required: "Please specify No Of Year Of EXperiences",
        maxlength: "No Of Year Of EXperiencesallows upto 4 integers"
      },
      "experince[company_name]":{
        required: "Please specify Company Name",
        maxlength: "Company Name allows upto 30 characters"
      },
       "experince[designation]":{
        required: "Please specify Designation Details",
        maxlength: "Designation allows upto 30 characters"
      },
      "experince[ctc]":{
        required: "Please specify CTC Details",
        maxlength: "CTC allows upto 6 characters"
      }

    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });

$("#family").validate({
    rules: {
      "family[no_of_member]":{
        required: true,
        maxlength: 2,
        numbersOnly: true
      },
      "family[f_name]":{
        required: true,
        maxlength: 30,
        lettersOnly: true
      },
        "family[m_name]":{
        required: true,
        maxlength: 30,
        lettersOnly: true
         },
      "family[l_name]":{
        required: true,
        maxlength: 30
      },
      "family[date_of_birth]":{
        required: true,
      },
      "family[age]":{
        required: true,
        maxlength: 3,
        numbersOnly: true
      },
      "family[contact_no]":{
        required: true,
        maxlength: 13,
        mobileNo: true
      },
      "family[phone_no]":{
        maxlength: 13,
        numbersOnly: true,
        numbersOnly: true
      },
      "family[permanent_address]":{
        required: true,
        maxlength: 100,
        address: true
      },
      "family[state]":{
        required: true,
        maxlength: 50,
        lettersOnly: true
      },
      "family[dist]":{
        required: true,
        maxlength: 30,
        lettersOnly: true
      },
      "family[city]":{
        required: true,
        maxlength: 30,
        lettersOnly: true
      },
      "family[pin_code]":{
        required: true,
        maxlength: 6,
        numbersOnly: true
      },
        "family[current_address]":{
        required: true,
        maxlength: 100,
        address: true
      },
      "family[email]":{
        required: true,
        maxlength: 50,
        loginRegex: true
      },
      "family[relation]":{
        required: true,
        maxlength: 30,
        lettersOnly: true
      },
      "family[adhar_no]":{
      required: true,
      maxlength: 12
      },
      "family[pan_no]":{
      required: true,
      maxlength: 10,
      pan:true
       },
       "family[passport_no]":{
         required: true,
         maxlength: 8,
         passportNo: true
      },
       "family[status]":{
         required: true,
        maxlength: 30
      },
      "family[religion]":{
        required: true,
       maxlength: 30,
       lettersOnly:true
      },
      "family[profession]":{
       required: true,
        maxlength: 30,
        lettersOnly: true
      }
    },
    messages: {
      "family[no_of_member]":{
        required: "Please specify No. Of Employees",
        maxlength: "Employee ID allows upto 2 digit"
      },
      "family[f_name]":{
        required: "Please specify First Name",
        maxlength: "No Of Year Of EXperiencesallows upto 4 integers"
      },
      "family[m_name]":{
        required: "Please specify MIddle Name",
        maxlength: "Company Name allows upto 30 characters"
      },
       "family[l_name]":{
        required: "Please specify Last Name",
        maxlength: "Designation allows upto 30 characters"
      },
      "family[date_of_birth]":{
        required: "Please Date Of Birth",
        maxlength: "CTC allows upto 6 characters"
      },
      "family[age]":{
        required: "Please specify Age",
        maxlength: "Employee ID allows upto 2 integers"
      },
      "family[contact_no]":{
        required: "Please specify Contact No.",
        maxlength: "Enter the Correct contact number"
      },
      "family[phone_no]":{
        maxlength: "Enter the Correct Phone No"
      },
       "family[permanent_address]":{
        required: "Please Specify Your Permanent Address",
        maxlength: "Permanent Address allows upto 100 characters"
      },
      "family[state]":{
        required: "Enter a valid State Name",
        maxlength: "State Name allows upto 50 characters"
      },
      "family[dist]":{
        required: "Please specify your District",
        maxlength: "District allows upto 50 alphabets"
      },
      "family[city]":{
        required: "Please specify Your City",
        maxlength: "City allows upto 50 integers"
      },
      "family[pin_code]":{
        required: "Please specify Pincode Details",
        maxlength: "Pincode allows upto 6 characters"
      },
       "family[current_address]":{
        required: "Please Specify Your Current Address Details",
        maxlength: "Current Address allows upto 100 characters"
      },
      "family[relation]":{
        required: "Please specify Relation Details",
        maxlength: "Relation allows upto 50 characters"
      },
      "family[adhar_no]":{
        required: "Please specify Adhar No",
        maxlength: "Adhar No allows upto 12 alphabets"
      },
      "family[pan_no]":{
        required: "Please specify Your Pan Card Details",
        maxlength: "Pan Card No allows upto 10 alphanumeric characters"
      },
      "family[passport_no]":{
        required: "Please specify Passport No",
        maxlength: "Passport No allows upto 8 characters"
      },
       "family[status]":{
        required: "Please specify Status Details",
        maxlength: "Status allows upto 30 characters"
      },
      "family[religion]":{
        required: "Please specify Religion Details",
        maxlength: "Religion allows upto 6 characters"
      },
      "family[profession]":{
        required: "Please specify Profession",
        maxlength: "Profession allows upto 30 alphabets"
      },
      "family[no_of_year_experince]":{
        required: "Please specify No Of Year Of EXperiences",
        maxlength: "No Of Year Of EXperiencesallows upto 4 integers"
      },
      "family[company_name]":{
        required: "Please specify Company Name",
        maxlength: "Company Name allows upto 30 characters"
      },
       "family[designation]":{
        required: "Please specify Designation Details",
        maxlength: "Designation allows upto 30 characters"
      },
      "family[ctc]":{
        required: "Please specify CTC Details",
        maxlength: "CTC allows upto 6 characters"
      },
      "family[employee_id]":{
        required: "Please specify Employee ID",
        maxlength: "Employee ID allows upto 30 alphabets"
      },
      "family[no_of_year_experince]":{
        required: "Please specify No Of Year Of EXperiences",
        maxlength: "No Of Year Of EXperiencesallows upto 4 integers"
      },
      "family[company_name]":{
        required: "Please specify Company Name",
        maxlength: "Company Name allows upto 30 characters"
      },
       "family[designation]":{
        required: "Please specify Designation Details",
        maxlength: "Designation allows upto 30 characters"
      },
      "family[ctc]":{
        required: "Please specify CTC Details",
        maxlength: "CTC allows upto 6 characters"
      }

    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });

$("#leav_cate").validate({
    rules: {
      "leav_category[name]":{
        required: true,
        maxlength: 30,
        lettersOnly:true
      }
    },
    messages: {
      "leav_category[name]":{
        required: "Please specify Employee Name",
        maxlength: "Name allows upto 30 alphabets"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });

$("#company_leav").validate({
    rules: {
      "company_leav[no_of_leave]":{
        required: true,
        maxlength: 20
      },
      "company_leav[expire_date]":{
        required: true
      }
    },
    messages: {
      "company_leav[no_of_leave]":{
        required: "Please specify No. Of leaves",
        maxlength: "No. Of leaves allows upto 20 characters"
      },
      "company_leav[expire_date]":{
        required: "Please specify Expiry Details for Leave"
      }

    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });


$("#employee_leav_request").validate({
    rules: {
      "employee_leav_request[satrt_date]":{
        required: true
      },
      "employee_leav_request[end_date]":{
        required: true
      }
    },
    messages: {
      "employee_leav_request[satrt_date]":{
        required: "Please specify Start Date for Leave"
      },
      "employee_leav_request[end_date]":{
        required: "Please specify End Date for Leave"
      }

    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });

$("#skillset").validate({
    rules: {
      "skillset[name]":{
        required: true,
        maxlength: 30,
        lettersOnly:true
      },
      "skillset[skill_level]":{
        required: true
      }
    },
    messages: {
      "skillset[name]":{
        required: "Please specify Employee Name",
        maxlength: "Employee Name allows upto 30 characters"
      },
      "skillset[skill_level]":{
        required: "Please specify Skill Level"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });

$("#award").validate({
    rules: {
      "award[award_name]":{
        required: true,
        maxlength: 30,
        lettersOnly:true
      },
      "award[year]":{
        required: true,
        maxlength: 4,
        numbersOnly:true
      },
      "award[award_from]":{
        required: true,
        maxlength: 30,
        lettersOnly:true
      }
    },
    messages: {
      "award[award_name]":{
        required: "Please specify Awards Name",
        maxlength: "Awards Name allows upto 30 characters"
      },
      "award[year]":{
        required: "Please specify Year When you received award",
        maxlength: "Please input correct year format"
      },
      "award[award_from]":{
        required: "Please specify Organization name,whom you received award",
        maxlength: "Awards from allows upto 30 characters"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });


$("#certification").validate({
    rules: {/*qualification_id*/
      "certification[qualification_id]":{
        required: true,
        maxlength: 30,
        lettersOnly:true
      },
      "certification[name]":{
        required: true,
        maxlength: 30,
        numbersOnly:true
      },
      "certification[year]":{
        required: true,
        maxlength: 4,
        numbersOnly:true
      },/*duration*/
      "certification[duration]":{
        required: true,
        maxlength: 30,
        numbersOnly:true
      },
      "certification[descripation]":{
        required: true,
        maxlength: 200
      }
    },
    messages: {
      "certification[qualification_id]":{
        required: "Please specify Qualification ID",
        maxlength: "Qualification ID allows upto 30 characters"
      },
      "certification[name]":{
        required: "Please specify Certification Name",
        maxlength: "Certification Name allows upto 30 characters"
      },
      "certification[year]":{
        required: "Please Specify Year Detail",
        maxlength: "Please Input Correct Year format"
      },
      "certification[duration]":{
        required: "Please Specify Certification Duration Details",
        maxlength: "Please Input Correct Year format"
      },
      "certification[descripation]":{
        required: "Please Specify Description regarding your Certification",
        maxlength: "Certification Description allows upto 200 char max"
      }

    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });

  // $("#qualification").validate({
  //   rules: {/*qualification_id*/
  //     "qualification[ssc]":{
  //       required: true,
  //       maxlength: 10,
  //       lettersOnly:true
  //     },
  //     "certification[name]":{
  //       required: true,
  //       maxlength: 30,
  //       numbersOnly:true
  //     },
  //     "certification[year]":{
  //       required: true,
  //       maxlength: 4,
  //       numbersOnly:true
  //     },/*duration*/
  //     "certification[duration]":{
  //       required: true,
  //       maxlength: 30,
  //       numbersOnly:true
  //     },
  //     "certification[descripation]":{
  //       required: true,
  //       maxlength: 200
  //     }
  //   },
  //   messages: {
  //     "qualification[ssc]":{
  //       required: "Please specify Your Qualification Details",
  //       maxlength: "ualification Details allows upto 10 characters"
  //     },
  //     "certification[name]":{
  //       required: "Please specify Certification Name",
  //       maxlength: "Certification Name allows upto 30 characters"
  //     },
  //     "certification[year]":{
  //       required: "Please Specify Year Detail",
  //       maxlength: "Please Input Correct Year format"
  //     },
  //     "certification[duration]":{
  //       required: "Please Specify Certification Duration Details",
  //       maxlength: "Please Input Correct Year format"
  //     },
  //     "certification[descripation]":{
  //       required: "Please Specify Description regarding your Certification",
  //       maxlength: "Certification Description allows upto 200 char max"
  //     }

  //   },
  //   errorPlacement: function(error, element) {
  //    error.css('color','red')
  //    error.insertAfter(element.parent(element));
  //   }

  //  });



});
