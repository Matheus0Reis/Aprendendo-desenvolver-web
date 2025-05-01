<br />
<form method="post" action="game.php?village={$village.id}&screen=ally&mode=intro_igm&action=intro_igm&h=5568">
  <table class="vis" width="100%">
    <tbody>
      <tr>
        <th> Mensagem de boas vindas a novos jogadores: </th>
      </tr>
      <tr id="bbcode">
          <td>
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
      <tr>
      <td><textarea id="message" name="text"  cols="95" rows="20"/>{$allyIgm}</textarea></td>
      </tr>
      <tr><td>
          <input type="submit" value="Salvar"/></td>
      </tr>
    </tbody>
  </table>
</form> 