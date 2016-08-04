/**
 * Created by rahul on 2/8/16.
 */
function validateform()
{
    alert("hello");
    if(document.getElementById("vehicle_type_name").value == "truck")
    {
        var power = document.getElementById("vehicle_power_rating").value;
        alert(power);

        document.getElementById("vehicle_wt_oc").value = power / 2;
        document.getElementById("vehicle_wt_oc").disabled = true;
        document.getElementById("vehicle_power_rating").disabled = true;
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
