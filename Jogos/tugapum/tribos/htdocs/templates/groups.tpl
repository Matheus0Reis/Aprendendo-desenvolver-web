<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>www.SpeeDWars.net - Servidor de Tribos em Guerra!</title>
    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="stamm.css" />
    <link rel="stylesheet" type="text/css" href="fonte.css" />
    <script src="script.js?1159978916" type="text/javascript"></script>
    <script src="menu.js?1148466057" type="text/javascript"></script>
  </head>
  <body>
    <table class="navi-border" width="100%" style="margin:auto; margin-top: 5px; border-collapse: collapse;">
      <tr>
		    <td>
          <table class="main" width="100%" align="center">
  				  <tr>
      				<td>
        		    {if isset($fehler)}
        		      {if $fehler == 'wrong_uid'}
        		        <h3 style="color: red;">You do not have permission to do this!</h3>
        		      {elseif $fehler == 'wrong_village'}
        		        <h3 style="color: red;">This is not your village. Loser! :-(</h3>
        		      {/if}
        		    {else}
        		      {if isset($done)}
        		        {if $done == 'village'}
        		          <h3 style="color: green;">Grupos Salvos com Sucesso.</h3>
                    {/if}
        		      {/if}
                  <h3>Grupos de Aldeias</h3>
                  <form method="post" action="/groups.php?mode=village&amp;village_id={$smarty.get.village_id}&amp;action=village&amp;hkey={$smarty.get.hkey}">
  	                <input type="hidden" name="village_id" value="{$smarty.get.village_id}" />
  	                  <table class="vis">
                    		<tr>
                    			<th>Grupos de {$village.name} ({$village.x}|{$village.y})</th>
                    		</tr>
                    		{foreach from=$gruppen item=value key=key}
                      		<tr>
                      			<td><label><input type="checkbox" class="check" name="groups[]" value="{$value.id}" {if $value.group_of_village == 'true'}checked="checked"{/if} />{$value.name}</label></td>
                      		</tr>
                    		{/foreach}
                     	</table>
                    <p><input type="submit" value="Salvar" /></p>
  	              </form>
                {/if}
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </body>
</html>