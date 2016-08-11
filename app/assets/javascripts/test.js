/**
 * Created by rahul on 2/8/16.
 */
function validateform()
{
    alert("hello");
    if(document.getElementById("vehicle_type_name").value == "truck")
    {
        var power = document.getElementById("vehicle_power_rating").value;
         power = parseFloat(power/1.00);
        

        document.getElementById("vehicle_wt_oc").value = parseFloat(power / 2.00);
        document.getElementById("vehicle_wt_oc").setAttribute('readonly','readonly');
        document.getElementById("vehicle_power_rating").readonly = true;
    }
}

function validatedate()
{
    alert("validating");
    //var st_date = ;
    if(document.getElementById("vehicle_st_date").value >= document.getElementById("vehicle_del_date").value)
    {
        alert("check your dates");
        document.getElementById("vehicle_st_date").focus();
        return false;
    }
    else
    {
        return true;
    }


}


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



