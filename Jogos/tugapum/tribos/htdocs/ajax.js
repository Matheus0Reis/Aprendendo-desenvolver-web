function trimiteMesaj()
{
	var nume=document.getElementById('nume').value;
	var email=document.getElementById('email').value;
	var mesaj=document.getElementById('mesaj').value;
	var captcha=document.getElementById('captcha').value;
	var err="";
	
	if(!nume) err=err+"<br /><img src='img/nume.png' alt='Numele este obligatoriu !'>";
	if(!email) err=err+"<br /><img src='img/mail.png' alt='Mailul trebuie introdus !'>";
	else
	if(!validate(email)) err=err+"<br /><img src='img/mailerror.png' alt='Mailul nu este valid !'>";
	if(!mesaj) err=err+"<br /><img src='img/mesaj.png' alt='Mesajul trebuie introdus !'>";
	if(!captcha) err=err+"<br /><img src='img/cod.png' alt='Codul trebuie introdus !'>";
	
	if(err == "")
	{
		ajax(nume,email,mesaj,captcha);
	}
	else
	document.getElementById('rezultat').innerHTML=err;
	
	return false;
}

function validate(email) {
   var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
   if(reg.test(email) == false) {
      return false;
   }
   return true;
}

function ajax(nume,email,mesaj,captcha)
{
	document.getElementById("rezultat").innerHTML="<img src='graphic/loader.gif'>";
	var url="contact.php?nume="+nume+"&email="+email+"&mesaj="+mesaj+"&captcha="+captcha;

	if (window.XMLHttpRequest)
		xmlhttp=new XMLHttpRequest();
	else
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");

	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4)
			document.getElementById("rezultat").innerHTML=xmlhttp.responseText; 
	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	return false;
}