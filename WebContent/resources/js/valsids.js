 function validLogin() 
            { 
                if(document.frm.username.value == "")
                {
                    alert ( "Please enter Login Name." );
                    document.frm.username.focus(); 
                    return false;
                } 
               if (document.frm.password.value == "") 
                { 
                    alert ( "Please Enter your secret password" ); 
                    document.frm.password.focus(); 
                    return false; 
                } 
            }