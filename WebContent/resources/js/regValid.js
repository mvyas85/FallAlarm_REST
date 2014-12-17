var email = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
var name = /^\w$/;
var phone=/^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/; 
var zip=/^\d{5}$/;
var pid=/^\d $/;
function validate(form){
    var ck_email = regform.email.value;
    var ck_pid = regform.pid.value;
	var ck_zip = regform.zip.value;
       
    var errors = [];
	
	if (!pid.test(ck_pid)) {
        errors[errors.length] = "Patient ID can not be null.";
    }
         
    if (!mail.test(ck_email)) {
        errors[errors.length] = "Not a valid e-mail address. Must follow email@host.domain.";
    }
     
	if(!zip.test(ck_zip))
	{
		errors[errors.length] = "Zip code must be 5 numeric digits";
	} 
	
	if(!phone.test(ck_phone))
	{
		errors[errors.length] = "Phone number must be in form: (XXX) XXX-XXXX";
        }
		
	if ( ( regform.gender[0].checked == false ) && ( regform.gender[1].checked == false ) ) 
	{
		errors[errors.length] = "Select the Gender";
	}
	if (errors.length > 0) {
	reportErrors(errors);
	return false;
}
     
    return true;
}
 
function reportErrors(errors){
    var msg = "There were some problems...\n";
    for (var i = 0; i<errors.length; i++) {
        var numError = i + 1;
        msg += "<br>" + numError + ". " + errors[i];
    }
    document.getElementById("a1").innerHTML=msg;
}