/**
 * Created by rahul on 2/8/16.
 */


function validateform()
{
    
    if(document.getElementById("vehicle_type_name").value == "truck")
    {
        var power = document.getElementById("vehicle_power_rating").value;
         power = parseFloat(power/1.00);
        

        document.getElementById("vehicle_wt_oc").value = parseFloat(power / 2.00);
        document.getElementById("vehicle_wt_oc").setAttribute('readonly','readonly');
        //document.getElementById("vehicle_power_rating").readonly = true;
    }
    else
    {
      document.getElementById("vehicle_wt_oc").readOnly=false;
    }
}

function validatedate()
{

    //var st_date = ;
    if(document.getElementById("vehicle_st_date").value >= document.getElementById("vehicle_del_date").value)
    {
        document.getElementById("vehicle_st_date").focus();
        return false;
    }
    else
    {
        return true;
    }


}

function validate()
{
 alert("hello");
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




function f()
{
  alert("hello");
}



function submit(){
  alert("hello");
 /* var uname = document.getElementById("user_name").value;
    
  if( uname == "" )
  {
    document.form.name.focus() ;
    document.getElementById("errorBox").innerHTML = "Enter the Name";
    return false;
  }
  */
      
}
