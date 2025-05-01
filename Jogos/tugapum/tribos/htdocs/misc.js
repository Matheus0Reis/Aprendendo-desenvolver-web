var detect = navigator.userAgent.toLowerCase();
var OS,browser,version,total,thestring;


function getBrowserInfo() {
    if (checkIt('konqueror')) {
        browser = "Konqueror";
        OS = "Linux";
    }
    else if (checkIt('safari')) browser     = "Safari"
    else if (checkIt('omniweb')) browser     = "OmniWeb"
    else if (checkIt('opera')) browser         = "Opera"
    else if (checkIt('webtv')) browser         = "WebTV";
    else if (checkIt('icab')) browser         = "iCab"
    else if (checkIt('msie')) browser         = "Internet Explorer"
    else if (!checkIt('compatible')) {
        browser = "Netscape Navigator"
        version = detect.charAt(8);
    }
    else browser = "An unknown browser";

    if (!version) version = detect.charAt(place + thestring.length);

    if (!OS) {
        if (checkIt('linux')) OS         = "Linux";
        else if (checkIt('x11')) OS     = "Unix";
        else if (checkIt('mac')) OS     = "Mac"
        else if (checkIt('win')) OS     = "Windows"
        else OS                                 = "an unknown operating system";
    }
}

// -----------------------------------------------------

function checkIt(string) {
    place = detect.indexOf(string) + 1;
    thestring = string;
    return place;
}


// -----------------------------------------------------

function toggleBlock(id) {
   var e = document.getElementById(id);

   if(e.style.display == 'block')
	  e.style.display = 'none';
   else{
		if(e.className){
			var f = $$('.'+e.className);
			for(var i=0; i<f.length; i++){
				f[i].style.display = 'none';
			}
		}
		e.style.display = 'block';
		e.focus();
	}
}

// -----------------------------------------------------

function submitenter(myfield,e)
{
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;

    if (keycode == 13)
       {
       myfield.form.submit();
       return false;
       }
    else
       return true;
}


// -----------------------------------------------------

function check_msg_len(field,counter)
{
    if (field.value.length > 500)
    {
        field.value = field.value.substr(0,499);
    }
    if (!(counter == undefined)) {
        counter.value = 500-field.value.length;
    }
}

// -----------------------------------------------------

function createCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
}

// -----------------------------------------------------

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

// -----------------------------------------------------

function eraseCookie(name) {
    createCookie(name,"",-1);
}

// -----------------------------------------------------
function register_player(form_id,status_id,regLoadingId,regLinkId){

	if( status_id == undefined )
		status_id = 'status';
	if( regLoadingId == undefined )
		regLoadingId = 'reg_loading';
	if( regLinkId == undefined )
		regLinkId = 'register_link';

 new Ajax.Request('ajax_registration.php', {
  parameters: $(form_id).serialize(true),

  onSuccess: function(transport){
        var info=transport.responseText.split('#');

        if(parseInt(info[0]) >= 1){
            document.getElementById(status_id).innerHTML=info[6];
          var log_form=document.getElementById('login_form');
          log_form.user.value=info[1];
          log_form.pass.value=info[2];

          log_form.world_select.options[log_form.world_selection.selectedIndex].value = info[5];

          document.getElementById('login_form').action = '' + document.getElementById('worldLinks' + info[5]).value + '/login2.php';

          log_form.insert(new Element('input', {type: 'hidden', name: 'from_reg', value: 1}));
          log_form.submit();
        }else{
     	  document.getElementById(regLoadingId).style.display = 'none';
    	  document.getElementById(regLinkId).style.display = 'block';
          document.getElementById(status_id).innerHTML=info[1];
          document.getElementById(status_id).style.display = 'block';
      }
   },
 onCreate: function(){
	   document.getElementById(regLoadingId).style.display = 'block';
	   document.getElementById(regLinkId).style.display = 'none';
   }
  });

}