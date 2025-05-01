<form action="game.php?village={$village.id}&amp;screen=settings&amp;action=change_profile&amp;h={$hkey}" enctype="multipart/form-data" method="post">
    <table class="vis">
	
        <tr>
            <th colspan="2">
                Perfil</th>
        </tr>
        <tr>
            <td>
                Data de nascimento:
            </td>
            <td>
                <input name="day" type="text" size="2" maxlength="2" value="{$profile.b_day}" />
                    <select name="month">
                        <option label="Janeiro" value="1" {if $profile.b_month==1}selected{/if}>Janeiro</option>
                        <option label="Fevereiro" value="2" {if $profile.b_month==2}selected{/if}>Fevereiro</option>
                        <option label="Março" value="3" {if $profile.b_month==3}selected{/if}>Março</option>
                        <option label="Abril" value="4" {if $profile.b_month==4}selected{/if}>Abril</option>
                        <option label="Maio" value="5" {if $profile.b_month==5}selected{/if}>Maio</option>
                        <option label="Junho" value="6" {if $profile.b_month==6}selected{/if}>Junho</option>
                        <option label="Julho" value="7" {if $profile.b_month==7}selected{/if}>Julho</option>
                        <option label="Agosto" value="8" {if $profile.b_month==8}selected{/if}>Agosto</option>
                        <option label="Setembro" value="9" {if $profile.b_month==9}selected{/if}>Setembro</option>
                        <option label="Outubro" value="10" {if $profile.b_month==10}selected{/if}>Outubro</option>
                        <option label="Novembro" value="11" {if $profile.b_month==11}selected{/if}>Novembro</option>
                        <option label="Dezembro" value="12" {if $profile.b_month==12}selected{/if}>Dezembro</option>
                    </select>
                <input name="year" type="text" size="4" maxlength="4" value="{$profile.b_year}" />
            </td>
        </tr>
        <tr>
            <td>
                Sexo:
            </td>
            <td>
                <label>
                    <input type="radio" name="sex" value="f" {if $profile.sex=='f'}checked="checked"{/if} />
                        feminino
                </label>
                <label>
                <input type="radio" name="sex" value="m" {if $profile.sex=='m'}checked="checked"{/if} />
                        masculino
                </label>
              <label>
                    <input type="radio" name="sex" value="x" {if $profile.sex=='x'}checked="checked"{/if} />
                  n&atilde;o especificado              </label>
            </td>
        </tr>
        <tr>
            <td>
                Localidade:
            </td>
            <td>
                <input name="home" type="text" size="40" maxlength="32" value="{$profile.home}" />
            </td>
        </tr>

        
	<tr><th colspan="2">Avatar</th></tr>
	        <tr><td colspan="2">
                {if !empty($user.image)}
                    <img src="graphic/player/{$user.image}" alt="Avatar" />
                    <br />
                    <input name="del_image" type="checkbox" />
                    Apagar avatar 
                    <br />
                {/if}
                   <input name="image" type="file" size="40" accept="image/*" maxlength="1048576" />
                <br />
                <span style="font-size: xx-small">max. 240x180, max. 120kByte, (jpg, jpeg, png, gif)</span>
            </td>
        </tr>
	<tr>
            <td colspan="2">
                <input type="submit" value="OK" />
            </td>
        </tr>
    </table>
    <br />
</form>

	

<form action="game.php?village={$village.id}&amp;screen=settings&amp;action=change_text&amp;h={$hkey}" method="post">
    <table class="vis">
        <tr>
            <th colspan="2">
                Texto pessoal </th>
        </tr>
		<tr><td colspan="2"> {php}
		$id = $this->_tpl_vars['user']['id'];
		
		$select_Text = mysql_fetch_array(mysql_query("SELECT personal_text FROM users WHERE id = '$id'"));
		$select = $select_Text[0];
		echo '<center>'.stripslashes(nl2br(bb_format(htmlspecialchars(urldecode($select))))).'</center>';{/php}</td></tr>
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
            <td colspan="2">
                <textarea id="message" name="personal_text" cols="50" rows="10">{$profile.personal_text}</textarea>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" name="send" value="OK" />
            </td>
            <td align="right">
        <a onclick="javascript:popup_scroll('help.php?mode=bb', 700, 400); return false;" href="help.php?mode=bb" target="_blank"></a>      </td>
      
        </tr>
    </table>
</form> 
