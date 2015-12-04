
$(function(){

  $.validator.addMethod("loginRegex", function (value, element) {
          return this.optional(element) || /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|))?$/.test(value);
  }, "Email address must be in the format of name@domain.com");

  $.validator.addMethod("lettersOnly", function (value, element) {
    return this.optional(element) || /^[a-zA-Z]+$/i.test(value);
}, "Please enter letters only,no blank space allowed.");

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

$.validator.addMethod("bankName", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_ ]+$/i.test(value);
},"Please Input Letters Only.");

$.validator.addMethod("contactNo", function (value, element) {
    return /^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$/.test(value);
},"Please Input Valid Mobile No.");

$.validator.addMethod("iifcCode", function (value, element) {
    return /^([A-Z]{4})(\d{7})$/.test(value);
},"Please Input Proper IIFC Code Format eg:ABHY1234567.");

$.validator.addMethod("branchCode", function (value, element) {
    return this.optional(element) || /^[0-9]+$/i.test(value);
}, "Branch Code must be in the format of eg:123456");

$.validator.addMethod("micrCode", function (value, element) {
    return this.optional(element) || /^[0-9]+$/i.test(value);
}, "MICR Code must be in the format of eg:123456789");

$.validator.addMethod("cityName", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_]+$/i.test(value);
},"Please Input Letters Only,no blank spaces allowed.");

$.validator.addMethod("stateName", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_]+$/i.test(value);
},"Please Input Letters Only.");

$.validator.addMethod("CertName", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_ ]+$/i.test(value);
},"Please Input Letters Only.");

$.validator.addMethod("AwardName", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_ ]+$/i.test(value);
},"Please Input Letters Only.");


$.validator.addMethod("AwardFrom", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_ ]+$/i.test(value);
},"Please Input Letters Only.");

$.validator.addMethod("ReffFrom", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_ ]+$/i.test(value);
},"Please Input Letters Only.");

$.validator.addMethod("status", function (value, element) {
    return this.optional(element) || /^[0-9a-zA-Z_ ]+$/i.test(value);
},"Please Input  Correct Status.");

$.validator.addMethod("probPeriod", function (value, element) {
    return this.optional(element) || /^[0-9a-zA-Z_ ]+$/i.test(value);
},"Please Input  correct format eg:90 days.");

$.validator.addMethod("noticePeriod", function (value, element) {
    return this.optional(element) || /^[0-9a-zA-Z_ ]+$/i.test(value);
},"Please Input  correct format eg:90 days.");

$.validator.addMethod("pincode", function (value, element) {
    return this.optional(element) || /^[0-9]+$/i.test(value);
},"Please Input Digits Only Eg:400703.");


  $.validator.addMethod("adharNO", function (value, element) {
    return this.optional(element) || /^[0-9]+$/i.test(value);
}, "Please enter valid Adhar No Format eg:123456789101.");


$.validator.addMethod("cus_url", function(value, element)
    {
        //return this.optional(element) || /^[A-Z]{5}\d{4}[A-Z]{1}$/.test(value);
        return this.optional(element) || /^(www\.)?[a-zA-Z0-9\-]{3,}(\.(com|net|org|in))?$/.test(value);
    }, "Invalid URL");

$.validator.addMethod("pan", function(value, element)
    {
        //return this.optional(element) || /^[A-Z]{5}\d{4}[A-Z]{1}$/.test(value);
        return this.optional(element) || /^([A-Z]{5})(\d{4})([A-Z]{1})$/.test(value);
    }, "Invalid Pan Number");



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
        maxlength: 30
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
          maxlength: 20,
          required: true
      },
      "company[pan_card_no]":{
          maxlength: 10,
          required: true,
          pan:true
      },
      "company[city]":{
          maxlength: 30,
          required: true
         
      },
      "company[district]":{
          maxlength: 30,
          required: true
         
      },
      "company[pin_code]":{
          maxlength: 6,
          required: true,
          numbersOnly:true
      },
      "company[state]":{
          maxlength: 50,
          required: true
         
      },
      "company[web_site]":{
          maxlength: 30,
          required: true,
          cus_url:true
      },
      "company[ceo_name]":{
          maxlength: 30,
          required: true

      }

    },
    messages: {
      "company[name]":{
        required: "Please specify company",
        maxlength: "Name allows upto 30 Characters"
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
     
      "company[pan_card_no]":{
        required: "Please Enter Valid Pancard Details",
          maxlength: "Enter the Pancard Details max 10 char"
      },

      "company[email]":{
       required: "Please Specify Email ID"
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
      },

     "company_location[email]":{
        // loginRegex: true
      }, 

     "company_location[contact_no]":{
        maxlength: 13,
        required: true,
        mobileNo: true
      },

      "company_location[district]":{
        maxlength: 100,
        required: true,
        
      },

     "company_location[city]":{
        maxlength: 50,
        required: true,
       
      },

      "company_location[pin_code]":{
        maxlength: 6,
        required: true,
        numbersOnly: true

      },

    
    },
    messages: {
      "company_location[name]":{
        required: "Please specify company Name",
        maxlength: "Name allows upto 30 alphabets"
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
     
      "company_location[pin_code]":{
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
        
      },

  "department[email]":{
        loginRegex: true,
        required: true
      },
  "department[pin_code]":{
        maxlength: 6,
        required: true,
        numbersOnly: true
      },
      "department[contact_no]":{
      maxlength: 13,
        required: true,
        mobileNo: true
      }
    


    },
    messages: {
      "department[name]":{
        required: "Please specify Dept name ",
        maxlength: "Dept Name allows upto upto 30 char maxs"
    },
      "department[email]":{
       required: "Please Specify Email ID"
      },

     "department[pin_code]":{
      required: "Please Enter Pincode Details",
          maxlength: "Pincode Details allows max 6 digits"
      },
     "department[contact_no]":{
      required: "Please Specify Contact No",
        maxlength: "Enter the Correct contact number"
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
        maxlength: 12,
        numbersOnly: true
      },
      "employee[pan_no]":{
        required: true,
        maxlength: 10
      },
      "employee[licence_no]":{
        maxlength: 17
      },
      "employee[passport_no]":{
        maxlength: 6
      },
      "employee[state]":{
        maxlength: 50,
        lettersOnly:true
      },
      "employee[district]":{
        maxlength: 50,
         lettersOnly:true
      },
      "employee[city]":{
        maxlength: 30,
         lettersOnly:true
      },
      "employee[pin_code]":{
        maxlength: 6,
        numbersOnly: true
      },
      "employee[contact_no]":{
          maxlength: 13,
          required: true,
          mobileNo: true
      },
      "employee[email]":{
        loginRegex: true
      },
     
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
        maxlength: "Pan no allows upto 10 characters"
      },
      "employee[licence_no]":{
        maxlength: "Licence No allows upto 17 characters"
      },
      "employee[passport_no]":{
        maxlength: "Passport No allows upto 6 Digits"
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
      "employee[contact_no]":{
      required: "Please Specify Contact No",
        maxlength: "Enter the Correct contact number"
         },
         "employee[email]":{
       required: "Please Specify Email ID"
      },
      "employee[date_of_birth]":{
       required: "Please Specify Date Of Birth",
        maxlength: "Date Of Birth can't exceed max limit"
      },
      "employee[status]":{
       required: "Please Specify Status upto 15",
        maxlength: "Status can't exceed max limit"
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
      // "employee_physical[employee_id]":{
      //   required: true,
      //   maxlength: 30,
      //   lettersOnly:true
      // },
      "employee_physical[hieght]":{
        required: true,
        maxlength: 8,
      
      },
      "employee_physical[weight]":{
        required: true,
        maxlength: 6,
       
      },
      "employee_physical[size]":{
        required: true,
        maxlength: 6,
       
      }
    },
    messages: {
      // "employee_physical[name]":{
      //   required: "Please specify Employee ID",
      //   maxlength: "Name allows upto 30 alphabets"
      // },
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
      "family[f_name]":{
        required: true,
        maxlength: 30,
        lettersOnly: true
      },
        "family[m_name]":{
        maxlength: 30,
        lettersOnly: true
         },
      "family[l_name]":{
        required: true,
        maxlength: 30,
        lettersOnly: true
      },
      
      "family[age]":{
       
        maxlength: 3,
        numbersOnly: true
      },
      "family[contact_no]":{
        maxlength: 13,
        contactNo: true
      },
      "family[phone_no]":{
        maxlength: 13,
        contactNo: true
      },
      "family[state]":{
        maxlength: 50,
        stateName: true
      },
      "family[dist]":{
        maxlength: 50,
        lettersOnly: true
      },
      "family[city]":{
        maxlength: 50,
        cityName: true
      },
      "family[pin_code]":{
       
        maxlength: 6,
        pincode: true
      },
      "family[email]":{
        loginRegex: true
      },
      "family[relation]":{
        required: true,
        maxlength: 30,
        lettersOnly: true
      },
      "family[adhar_no]":{
      maxlength: 12,
      adharNO:true
      },
      "family[pan_no]":{
      maxlength: 10,
      pan:true
       },
       "family[passport_no]":{
         maxlength: 8,
         passportNo: true
      },
       "family[status]":{
        
        maxlength: 30
      },
      "family[religion]":{
       
       maxlength: 30,
       lettersOnly:true
      },
      "family[profession]":{
        maxlength: 30,
        lettersOnly: true
      }
    },
    messages: {
      "family[f_name]":{
        required: "Please specify First Name",
        maxlength: "No Of Year Of EXperiencesallows upto 4 integers"
      },
      "family[m_name]":{
        maxlength: "Company Name allows upto 30 characters"
      },
       "family[l_name]":{
        required: "Please specify Last Name",
        maxlength: "Designation allows upto 30 characters"
      },
      "family[date_of_birth]":{
        maxlength: "CTC allows upto 6 characters"
      },
      "family[age]":{
        maxlength: "Employee ID allows upto 2 integers"
      },
      "family[contact_no]":{
        maxlength: "Enter the Correct contact number"
      },
      "family[phone_no]":{
        maxlength: "Enter the Correct Phone No"
      },
      "family[state]":{
        maxlength: "State Name allows upto 50 characters"
      },
      "family[dist]":{
        maxlength: "District allows upto 50 alphabets"
      },
      "family[city]":{
        maxlength: "City allows upto 50 integers"
      },
      "family[pin_code]":{
        maxlength: "Pincode allows upto 6 digits"
      },
      "family[relation]":{
        required: "Please specify Relation Details",
        maxlength: "Relation allows upto 50 characters"
      },
      "family[adhar_no]":{
        maxlength: "Adhar No allows upto 12 digits"
      },
      "family[pan_no]":{
        
        maxlength: "Pan Card No allows upto 10 alphanumeric characters"
      },
      "family[passport_no]":{
        maxlength: "Passport No allows upto 8 characters"
      },
       "family[status]":{
       
        maxlength: "Status allows upto 30 characters"
      },
      "family[religion]":{
        
        maxlength: "Religion allows upto 6 characters"
      },
      "family[profession]":{
        maxlength: "Profession allows upto 30 alphabets"
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
        Name:true
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
        maxlength: 30,
        AwardName:true
      },
      "award[year]":{
        maxlength: 4,
        numbersOnly:true
      },
      "award[award_from]":{
        maxlength: 30,
        AwardFrom:true
      }
    },
    messages: {
      "award[award_name]":{
        maxlength: "Awards Name allows upto 30 characters"
      },
      "award[year]":{
        maxlength: "Please input correct year format"
      },
      "award[award_from]":{
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
        maxlength: 30,
        lettersOnly:true
      },
      "certification[name]":{
        maxlength: 30,
        CertName:true
      },
      "certification[year]":{
        maxlength: 4,
        numbersOnly:true
      },/*duration*/
      "certification[duration]":{
        maxlength: 30,
        numbersOnly:true
      },
      "certification[descripation]":{
        maxlength: 200
      }
    },
    messages: {
      "certification[qualification_id]":{
        
        maxlength: "Qualification ID allows upto 30 characters"
      },
      "certification[name]":{
        
        maxlength: "Certification Name allows upto 30 characters"
      },
      "certification[year]":{
        
        maxlength: "Please Input Correct Year format"
      },
      "certification[duration]":{
        
        maxlength: "Please Input Correct Year format"
      },
      "certification[descripation]":{
        maxlength: "Certification Description allows upto 200 char max"
      }

    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });

  

$("#employee_type").validate({
    rules: {
      "employee_type[name]":{
        required: true,
        maxlength: 30,
        lettersOnly:true
      }
    },
    messages: {
      "employee_type[name]":{
        required: "Please specify Employee Name",
        maxlength: "Name allows upto 30 alphabets"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });


$("#employee_bank_detail").validate({
    rules: {
      "employee_bank_detail[account_no]":{
        maxlength: 15,
        numbersOnly:true
      },
      "employee_bank_detail[bank_name]":{
        maxlength: 30,
        required:true,
        bankName:true
      },
      "employee_bank_detail[branch_name]":{
        maxlength: 30,
        required:true,
        bankName:true
      },
      "employee_bank_detail[contact_no]":{
        maxlength: 13,
        contactNo:true
      },
      "employee_bank_detail[micr_code]":{
        maxlength: 9,
        micrCode:true
      },
      "employee_bank_detail[branch_code]":{
        maxlength: 6,
        branchCode:true
      },
      "employee_bank_detail[ifsc_code]":{
        maxlength: 11,
        iifcCode:true
      }
      
    },
    messages: {
      "employee_bank_detail[account_no]":{
        maxlength: "Account No allows upto 15 Digits"
      },
      "employee_bank_detail[bank_name]":{
        required: "Please Specify Bank Name",
        maxlength: "Bank Name allows upto 30 Characters"
      },
      "employee_bank_detail[branch_name]":{
        required: "Please Specify Bank Name",
        maxlength: "Branch Name allows upto 30 Characters"
      },
     
      "employee_bank_detail[contact_no]":{
        maxlength: "Contact No allows upto 13 Digits"
      },
      "employee_bank_detail[micr_code]":{
        maxlength: "MICR Code allows upto 9 Digits"
      },
      "employee_bank_detail[branch_code]":{
        maxlength: "MICR Code allows upto 9 Digits"
      },
      "employee_bank_detail[ifsc_code]":{
        maxlength: "IFSC Code allows upto 11 Digits"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }

   });

});
