

<table width="100%"><tr><td valign="top">
        
    <table class="vis" width="100%">
    {if $num_pages>1}
        <tr>
            <td align="center" colspan="3">
                {section name=countpage start=1 loop=$num_pages+1 step=1}
                    {if $site==$smarty.section.countpage.index}
                        <strong> >{$smarty.section.countpage.index}< </strong>
                    {else}
                        <a href="game.php?village={$village.id}&amp;screen=ally&amp;site={$smarty.section.countpage.index}"> [{$smarty.section.countpage.index}] </a>
                    {/if}
                {/section}
            </td>
        </tr>
    {/if}
    <tr><th>Data</th>
    <th>Enventos</th>
    </tr>

        {foreach from=$events item=arr key=id}
            <tr>
                <td>{$arr.time}</td>
                <td>{php}
$text_f = $this->_tpl_vars['arr']['message'];
$text_f = str_replace("Der Stamm wurde von","A tribo foi criada por",$text_f);
$text_f = str_replace(" gegründet","",$text_f);
$text_f = str_replace("ist dem Stamm beigetreten","entrou na tribo",$text_f);
$text_f = str_replace("a modificat diplomatia tribului.","modificou a diplomacia.",$text_f);
$text_f = str_replace("hat den Stamm verlassen.","saiu da tribo.",$text_f);
$text_f = str_replace("hat die Einladung abgelehnt.","recusou o convite.",$text_f);
$text_f = str_replace("hat die interne Ankündigung geändert","modificou o anúncio interno da tribo.",$text_f);
$text_f = str_replace("hat die Stammesbeschreibung geändert","modificou a descrição da tribo.",$text_f);
if(preg_match('/eingeladen/', $text_f)) {
   $text_f = str_replace("wurde von","foi convidado por",$text_f);
   $text_f = str_replace(" eingeladen","",$text_f);		
}
if(preg_match('/entlassen/', $text_f)) {
   $text_f = str_replace("wurde von","foi expulso por",$text_f);
   $text_f = str_replace(" entlassen","",$text_f);		
}
if(preg_match('/Die Einladung an/', $text_f)) {
   $text_f = str_replace("Die Einladung an","O convite para",$text_f);
   $text_f = str_replace("wurde von","foi retirado por",$text_f);
   $text_f = str_replace(" zurückgezogen","",$text_f); 	
}

echo $text_f;
//{$arr.message}
{/php}</td>
            </tr>
        {/foreach}

    </table>
        
</td><td valign="top" width="360">
    <table class="vis" width="100%"><tr>
    <td><a href="game.php?village=36841&amp;screen=ally&amp;action=exit&amp;h=cc6f" onclick="javascript:ask('Sigur doriti sa parasiti tribul?', 'game.php?village={$village.id}&amp;screen=ally&amp;action=exit&amp;h={$hkey}'); return false;">Abandonar tribo </a></td>
    </tr></table>
    
            

    {if !empty($preview)}
        <table class="vis" width="100%">
            <tr>
              <th colspan="2">Visualizar</th>
            </tr>
            <tr><td colspan="2" align="center">{php}
$ce1 = Array("Wendet euch bei Fragen an","Este texto pode ser modificado pelos Aristocratas da tribo.");
$cu_ce1 = Array("A tribo foi criada por","Este texto pode ser modificado pelos Aristocratas da tribo.");
echo bb_format(str_replace($ce1,$cu_ce1,$this->_tpl_vars['ally']['intern_text']));
{/php}</td></tr>
        </table>
    {/if}
    
    <script type="text/javascript">
    function bbEdit() {ldelim}
        gid("show_row").style.display = 'none';
        gid("edit_link").style.display = 'none';
        gid("edit_row").style.display = '';
        gid("submit_row").style.display = '';
        gid("bbcode").style.display = '';
    {rdelim}
    </script>

    <form action="game.php?village={$village.id}&amp;screen=ally&amp;action=edit_intern&amp;h={$hkey}" method="post" name="edit_profile">
    <table class="vis" width="100%">
            <tr>
              <th colspan="2" width="100%">An&uacute;ncio interno </th>
            </tr>
        <tr id="show_row" align="center"><td colspan="2">{php}
$ce1 = Array("Wendet euch bei Fragen an","Dieser Text kann von der Stammesführung geändert werden.");
$cu_ce1 = Array("A tribo foi criada por","Este texto pode ser modificado pelos Aristocratas da tribo.");
echo bb_format(str_replace($ce1,$cu_ce1,$this->_tpl_vars['ally']['intern_text']));
{/php}</td></tr>
    {if $user.ally_found==1}
        <tr id="bbcode">
        <td colspan="2">
            <div style="text-align: left; overflow: visible;">
                <a id="bb_button_bold" title="Negrito" href="#" onclick="BBCodes.insert('[b]', '[/b]');return false;"> 
                    <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll 0px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_italic" title="Italico" href="#" onclick="BBCodes.insert('[i]', '[/i]');return false;"> 
            <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -20px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_underline" title="Sublinhado" href="#" onclick="BBCodes.insert('[u]', '[/u]');return false;"> 
                    <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -40px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_strikethrough" title="Riscado" href="#" onclick="BBCodes.insert('[s]', '[/s]');return false;"> 
                    <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -60px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_quote" title="Citar" href="#" onclick="BBCodes.insert('[quote=Author]', '[/quote]');return false;"> 
            <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -140px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                  <a id="bb_button_img" title="Imagem" href="#" onclick="BBCodes.insert('[img]', '[/img]');return false;"> 
            <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -180px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_url" title="URL" href="#" onclick="BBCodes.insert('[url]', '[/url]');return false;"> 
                    <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -160px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_spoiler" title="Spoiler" href="#" onclick="BBCodes.insert('[spoiler]', '[/spoiler]');return false;"> 
                    <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -260px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_player" title="Jogador" href="#" onclick="BBCodes.insert('[player]', '[/player]');return false;"> 
            <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -80px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_tribe" title="Tribo" href="#" onclick="BBCodes.insert('[ally]', '[/ally]');return false;"> 
                    <div style="display: inline-block; background: url(&quot;graphic/bbcodes/bbcodes.png?1&quot;) no-repeat scroll -100px 0px transparent; padding-left: 0px; padding-bottom: 0px; margin-right: 2px; margin-bottom: 3px; width: 20px; height: 20px;">&nbsp;</div> 
                </a> 
                <a id="bb_button_coord" title="Coordenadas" href="#" onclick="BBCodes.insert('[village]', '[/village]');return false;"> 
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
    <tr id="edit_row"><td colspan="2"><textarea id="message" name="intern" cols="40" rows="15">{$ally.edit_intern_text|replace:"Wendet euch bei Fragen an":"A tribo foi criada por"|replace:"Dieser Text kann von der Stammesführung geändert werden.":"Este texto pode ser modificado pelos Aristocratas da tribo."}</textarea></td></tr>
        <tr id="submit_row"><td><input type="submit" name="edit" value="Salvar" /> <input type="submit" name="preview" value="Visualizar" /></td></tr>
    {/if}
    </table>
    </form>
    {if $user.ally_found==1}<a id="edit_link" href="javascript:bbEdit()" style="display:none">Editar</a><br />{/if}
    
    {if empty($preview)}
        <script type="text/javascript">
          gid("edit_row").style.display = 'none';
            gid("submit_row").style.display = 'none';
            gid("bbcode").style.display = 'none';
            gid("edit_link").style.display = '';
        </script>
    {else}
        <script type="text/javascript">
              gid("edit_row").style.display = '';
              gid("bbcode").style.display = '';
              gid("show_row").style.display = 'none';
            gid("submit_row").style.display = '';
            gid("edit_link").style.display = 'none';
        </script>
    {/if}

</td></tr></table> 