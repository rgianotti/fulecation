/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validate(){
            errors = 0;

    if (!/[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum)\b/.test(document.getElementById("email").value))
    {
        errors++;
        document.getElementById("email-error").hidden = false;
    }
    else
    {
        document.getElementById("email-error").hidden = true;
    }
    //Username
    if (/[^a-zA-Z0-9]/.test(document.getElementById("username").value) || document.getElementById("username").value.length < 6 || document.getElementById("username").value.length > 32)
    {
        errors++;
        document.getElementById("username-error").hidden = false;
    }
    else
    {
        document.getElementById("username-error").hidden = true;
    }
    //password
    if (document.getElementById("password").value.length < 6 || document.getElementById("password").value.length > 32)
    {
        errors++;
        document.getElementById("password-error").hidden = false;
    }
    else
    {
        document.getElementById("password-error").hidden = true;
    }
    //confirmpassword
    if (document.getElementById("confirmpassword").value != document.getElementById("password").value)
    {
        errors++;
        document.getElementById("confirmpassword-error").hidden = false;
    }
    else
    {
        document.getElementById("confirmpassword-error").hidden = true;
    }
    //bairro
    if (document.getElementById("bairro").value == "")
    {
        errors++;
        document.getElementById("bairro-error").hidden = false;
    }
    else
    {
        document.getElementById("bairro-error").hidden = true;
    }
    //cidade
    if (document.getElementById("cidade").value == "")
    {
        errors++;
        document.getElementById("cidade-error").hidden = false;
    }
    else
    {
        document.getElementById("cidade-error").hidden = true;
    }
    //estado
    if (document.getElementById("estado").value == "")
    {
        errors++;
        document.getElementById("estado-error").hidden = false;
    }
    else
    {
        document.getElementById("estado-error").hidden = true;
    }

    if (errors > 0)
                return false;
        }

