function validationsregister()
{

    var EmailId = document.getElementById('ctl00_ContentPlaceHolder1_txtMail');

    if (document.getElementById('ctl00_ContentPlaceHolder1_txtMail').value == "")
     {
        alert("Email Id can not be blank");
        document.getElementById('ctl00_ContentPlaceHolder1_txtMail').focus();
        return false;
    }

    function validateEmail() 
    {
        var emailPat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
        var emailid = document.getElementById('ctl00_ContentPlaceHolder1_txtMail').value;
        var matchArray = emailid.match(emailPat);
        if (matchArray == null)
         {
            alert("Your email address seems incorrect. Please try again.");
            document.getElementById('ctl00_ContentPlaceHolder1_txtMail').focus();
            return false;
        }
    }

   

}
