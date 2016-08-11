// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery.turbolinks
//= require jquery-ui





function customRange(input) 
{ 
return {
        minDate: (input.id == "vehicle_del_date" ? $("#vehicle_st_date").datepicker("getDate") : new Date())
      }; 
}

// To set maxdate in startdate
function customRangeStart(input) 
{ 
return {
        maxDate:(input.id == "vehicle_st_date" ? $("#vehicle_del_date").datepicker("getDate") : null)
      }; 
}

$(document).ready(function() {

   $('#vehicle_st_date').datepicker(
   {
       beforeShow: customRangeStart,
       minDate: 0,
       dateFormat: "yy-mm-dd",
       changeYear: true
   });

   $('#vehicle_del_date').datepicker(
   {
       beforeShow: customRange,
       dateFormat: "yy-mm-dd",
       changeYear: true
   });
});



