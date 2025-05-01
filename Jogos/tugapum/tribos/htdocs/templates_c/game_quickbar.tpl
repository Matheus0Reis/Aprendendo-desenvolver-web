
{php}
$getUser = mysql_query("SELECT userid FROM villages WHERE id = '".$_GET['village']."'");
  while ($fetch = mysql_fetch_assoc($getUser)) {
          $u = $fetch['userid'];
  }
$getQuickbar = mysql_query("SELECT id, name, img, href, target FROM quickbar WHERE uid = $u");
if (mysql_num_rows($getQuickbar) > 0) {
{/php}
	<table class="navi-border" style="margin: 11px auto auto; border-collapse: collapse; text-align: left;">
  <tbody>
  <tr>
  <td>
  <table id="quickbar" class="menu nowrap" align="center">
  <tbody>
  <tr>
      {php}
      $count = 0;
      require("include/config.php");
      {/php}
    {foreach from=$quickbar item=quick}
      {if substr($quick.href, 0, 8) == 'game.php'}
      <td><a href="{$quick.href}&village={$quick.vid}" {if $quick.target == 1} target="_blank"{/if}><img src="{$quick.img}" alt="" />{if $quick.name==Hauptgebäude}Edifício Principal{else}{if $quick.name==Kaserne}Quartel{else}{if $quick.name==Stall}Estábulo{else}{if $quick.name==Werkstatt}Oficina{else}{if $quick.name==Adelshof}Academia{else}{if $quick.name==Schmiede}Ferreiro{else}{if $quick.name==Platz}Praça{else}{if $quick.name==Markt}Mercado{else}{$quick.name}{/if}{/if}{/if}{/if}{/if}{/if}{/if}{/if}</a></td>
      {else}
      <td><a href="{$quick.href}" {if $quick.target == 1} target="_blank"{/if}><img src="{$quick.img}" alt="" />{$quick.name}</a></td>
      {/if}
      {php}
      $count = $count + 1;
      
      
      if (($count % $config['quickbar']) == 0) {
      echo "</tr>";
      echo "<tr>";
      
      }
      {/php}
   {/foreach}
  </tbody>
  </table>
  </td>
  </tr>
  </tbody>
  </table>
{php}
}
{/php}
