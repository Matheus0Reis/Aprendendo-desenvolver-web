{php}
$subject = $_POST['subject'];
$subject_encode = urlencode($_POST['subject']);
$message = $_POST['message'];
$message_encode = urlencode($_POST['message']);

$trib = $this->_tpl_vars['user']['ally'];
$select_users = mysql_query("SELECT * FROM users WHERE ally = '$trib'");
while ($send_to = mysql_fetch_array($select_users)){
$id = $send_to['id'];
$username = $send_to['username'];
$timp = time();
if(isset($_GET['send'])){
if (strlen($subject) > 32){ $error = 'Subiectul trebuie sa contina intre 4 si 32 de caractere'; } else { $error = ''; 
if (strlen($subject) < 4){ $error = 'Subiectul trebuie sa contina intre 4 si 32 de caractere'; } else { $error = '';
if (strlen($message) <= 4){ $error = 'Mesajul trebuie sa contina minim 4 caractere'; } else { $error = ''; }
}}



if ($error == ''){
$sql4 = "INSERT INTO mail_in
                    (from_id,from_username,to_id,to_username,subject,text,is_read,is_answered,output_id,time)
                    VALUES ('-1','Trib','".$id."','".$username."','$subject_encode','$message_encode','0','0','-1','".$timp."')";
					mysql_query("UPDATE users SET new_mail = '1' WHERE id = '$id'");
            $res4 = mysql_query($sql4) or die(mysql_error());
			}
			$idvillage = $_GET['village'];
			header("Location: game.php?village=$idvillage&screen=ally&mode=tribe_mass&succes_send");
			
			
}
}
if (isset($_GET['succes_send'])){ $succes = '<tr><td colspan="2"><span style="color: green;">Ati trimis mesajul tuturor din trib cu succes</span></td></tr>'; }
{/php}
Pe pagina aceasta po&#355;i trimite mesaje in masa tuturor din trib.<br>
<br />
<form method="post" action="game.php?village={$village.id}&screen=ally&mode=tribe_mass&send">
  <table class="vis" width="100%">
    <tbody>
      <tr>
        <th colspan="2">Mesaj in masa</th>
      </tr>
	  {php} echo $succes; {/php}
	  {php}if ($error){ {/php}
	  <tr><td colspan="2"><span style="color: red;"><B>{php} echo $error; {/php}</b></span></td></tr>{php} } {/php}
	  <tr><td >Subiect: </td><td ><input type="text" name="subject" size="100%" /></td></tr>
      <tr id="bbcode">
          <td colspan="2">
              <div style="text-align: left; overflow: visible;">
                  <a id="bb_button_bold" title="Bold" href="#" onclick="BBCodes.insert('[b]', '[/b]');return false;"> 
                    <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll 0px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_italic" title="Italic" href="#" onclick="BBCodes.insert('[i]', '[/i]');return false;"> 
            <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -20px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_underline" title="Subliniat" href="#" onclick="BBCodes.insert('[u]', '[/u]');return false;"> 
                    <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -40px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_strikethrough" title="T&#259;iat" href="#" onclick="BBCodes.insert('[s]', '[/s]');return false;"> 
                    <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -60px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_quote" title="Citat" href="#" onclick="BBCodes.insert('[quote=Author]', '[/quote]');return false;"> 
            <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -140px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                  <a id="bb_button_img" title="Imagine" href="#" onclick="BBCodes.insert('[img]', '[/img]');return false;"> 
            <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -180px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_url" title="URL" href="#" onclick="BBCodes.insert('[url]', '[/url]');return false;"> 
                    <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -160px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_spoiler" title="Spoiler" href="#" onclick="BBCodes.insert('[spoiler]', '[/spoiler]');return false;"> 
                    <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -260px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_player" title="Juc&#259;tori" href="#" onclick="BBCodes.insert('[player]', '[/player]');return false;"> 
            <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -80px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_tribe" title="Triburi" href="#" onclick="BBCodes.insert('[ally]', '[/ally]');return false;"> 
                    <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -100px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_coord" title="Coordonate" href="#" onclick="BBCodes.insert('[village]', '[/village]');return false;"> 
                    <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -120px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
      
                  {literal}
                  <script type="text/javascript">
                      $(document).ready(function(){
                          BBCodes.init({target : '#message'});
                      });
                  </script>
                  {/literal}
      
              </div>            
        </td>
      </tr>
      <tr>
      <td colspan="2"><textarea id="message" name="message"  cols="90" rows="20"/>{$allyIgm}</textarea></td>
      </tr>
      <tr><td colspan="2">
          <input type="submit" value="Trimite"/></td>
      </tr>
    </tbody>
  </table>
</form> 