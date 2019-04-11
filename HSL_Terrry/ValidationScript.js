function userValid() {
    var Username, Password
    Username = document.getElementById("username").value;
    Password = document.getElementById("pwd").value;

    if (Username == '' && Password == '') {
        alert("Enter All Fields");
        return false;
    }
    if (Username == '') {
        alert("Please Enter Login ID");
        return false;
    }
    if (Password == '') {
        alert("Please Enter Password");
        return false;
    }
    return true;
}


function Validate() {

    var isValid = true;

    //Reference all INPUT elements in the Table.
    var inputs = document.getElementsByTagName('input');

    //Loop through all INPUT elements.
    for (var i = 0; i < inputs.length; i++) {

        //Check whether the INPUT element is TextBox.
        if (inputs[i].type == "text") {
            //Check whether its Value is not BLANK and Validation is required.
            if (inputs[i].value == '') {

                //If Validation has FAILED, show error message.
                isValid = false;

                inputs[i].style.borderColor = "red";
                //return isValid;
            } else {
                //If Validation is SUCCESS, hide error message.
                //isValid = true;
                inputs[i].style.borderColor = "";
            }
        }
    }
    if (isValid == false) {
        alert('Please enter all fields');
    } else {
        confirm('Do you want to submit?')
    }
    return isValid;
};