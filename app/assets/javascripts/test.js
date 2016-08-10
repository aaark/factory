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
        alert(power);

        document.getElementById("vehicle_wt_oc").value = parseFloat(power / 2.00);
        document.getElementById("vehicle_wt_oc").setAttribute('readonly','readonly');
        document.getElementById("vehicle_power_rating").readonly = true;
    }
}

/*function validatedate()
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


}*/


$("#vehicle_st_date").datepicker({
  minDate: 0,
  onSelect: function(date) {
    $("vehicle_del_date").datepicker('option', 'minDate', date);
  }
});

$("#vehicle_del_date").datepicker({});