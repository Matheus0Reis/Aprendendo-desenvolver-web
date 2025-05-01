{php}
$id_user_v1 = mysql_fetch_array(mysql_query("SELECT userid FROM villages WHERE id=".$_GET['village']));
$id_user_v1 = $id_user_v1['userid'];
$select_noob_protection = mysql_fetch_array(mysql_query("SELECT noob_protection FROM users WHERE id = ' $id_user_v1'"));
$noob_protection = $select_noob_protection[0];

$timp = time();
if ($noob_protection >= $timp)
{
{/php}
<table class="main" width="{$user.window_width}" align="center">
	<tr>
	<td style="padding:6px;">
	  Prote&ccedil;&atilde;o vai expirar em {php} echo "data <b>".date("d.m.Y", $noob_protection)."</b>&aacute;s<b>".date("H:i:s", $noob_protection) {/php} </b>	  </td>
  </tr>
	</table>
<br>
{php}
}
{/php}