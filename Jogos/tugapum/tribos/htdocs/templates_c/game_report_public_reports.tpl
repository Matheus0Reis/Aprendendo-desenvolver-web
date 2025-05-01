{php}
$id_user = $this->_tpl_vars['user']['id'];
$idsat = $this->_tpl_vars['village']['id'];
if ($_GET['action'] == 'edit'){
$id = $_GET['id'];

$select_details = mysql_fetch_array(mysql_query("SELECT report_fromid FROM public_reports WHERE report_id = '$id'"));

if ($id_user == $select_details[0]){
$enemy_troups = $_POST['public_enemy_troups'];
$enemy_dead = $_POST['public_enemy_dead'];
if ($_POST['public_own_troups']) { $public_t = '1'; } else { $public_t = '0'; }
if ($_POST['public_own_dead']) { $public_d = '1'; } else { $public_d = '0'; }
if ($_POST['public_own_steal']) { $public_s = '1'; } else { $public_s = '0'; }
if ($enemy_dead) { $public_ed = '1'; } else { $public_ed = '0'; }
if ($enemy_troups) { $public_et = '1'; } else { $public_et = '0'; }
if ($_POST[edit]){
mysql_query("UPDATE public_reports SET public_own_troups = '$public_t' where report_id = '$id'");
mysql_query("UPDATE public_reports SET public_own_dead = '$public_d' where report_id = '$id'");
mysql_query("UPDATE public_reports SET public_own_steal = '$public_s' where report_id = '$id'");
mysql_query("UPDATE public_reports SET public_enemy_troups = '$public_et' where report_id = '$id'");
mysql_query("UPDATE public_reports SET public_enemy_dead = '$public_ed' where report_id = '$id'");
}
$select_details1 = mysql_fetch_array(mysql_query("SELECT public_enemy_troups,public_enemy_dead,public_own_troups,public_own_dead,public_own_steal FROM public_reports WHERE report_id = '$id'"));
{/php}
<h3>Relat&oacute;rios p&uacute;blicos </h3>
<p>Aqui pode gerir os relat&oacute;rios publicados e encaminhar os links a outros   jogadores. Os relat&oacute;rios publicados podem ser visualizados por qualquer   jogador que conhe&ccedil;a o link. </p>
<table class="vis">
<tr> 
		<td colspan="2" width="280" valign="top" height="160" style="border: solid 1px black; padding: 4px;"> 
						

<h3>Editar relat&oacute;rio </h3> 
<form action="game.php?village={$village.id}&screen=report&mode=public_reports&action=edit&id={php} echo $_GET['id']; {/php}" method="post"> 
	<ul style="list-style-type:none;"> 
		<li><input type="checkbox" {php} if ($select_details1[public_own_troups] == '1'){ echo 'checked="checked"'; } else { } {/php} name="public_own_troups" value="Y"  />
		<label for="own_units">Ocultar pr&oacute;prias tropas </label>
		</li> 
		<li><input type="checkbox" {php} if ($select_details1[public_own_dead] == '1'){ echo 'checked="checked"'; } else { } {/php}name="public_own_dead" value="Y"  />
		<label for="own_losses">Esconder as suas perdas </label>
		</li> 
		<li><input type="checkbox" {php} if ($select_details1[public_enemy_troups] == '1'){ echo 'checked="checked"'; } else { } {/php} name="public_enemy_troups" value="Y"  />
		<label for="own_units"> Ocultar saque </label>
		</li> 
		<li><input type="checkbox" {php} if ($select_details1[public_enemy_dead] == '1'){ echo 'checked="checked"'; } else { } {/php}name="public_enemy_dead" value="Y"  />
		<label for="own_losses">Esconder tropas inimigas </label>
		</li> 
		<li><input type="checkbox" {php} if ($select_details1[public_own_steal] == '1'){ echo 'checked="checked"'; } else { } {/php}name="public_own_steal" value="Y"  />
		<label for="carry">Esconder perdas inimigas</label>
		</li> 
		</ul> 
	<input type="submit" name="edit" value="OK" /> 
</form>

</td></tr></table>
{php} 	} else { 
echo '<h3>Adresa URL incorecta.</h3';  } 
} else { {/php}
<h3>Rapoarte publice</h3>
<p>Aici poti administra rapoartele pe care le-ai publicat si poti transmite URL-ul altor jucatori. Rapoartele publice vor fi vizibile pentru toti cei carora le-ai transmis URL-ul.</p>
<table class="vis">
	<tr>
	  <th>Assunto</th>
	  <th>Data</th>
	  <th>A&ccedil;&atilde;o</th>
	</tr>
	{php}

$select_reports = mysql_query("SELECT * FROM public_reports WHERE report_fromid = '$id_user'") or die(mysql_error());
	while($select = mysql_fetch_array($select_reports)){
	echo '<tr><td><img src="'.$select[title_image].'"><a href="public_reports.php?report_id='.$select['report_id'].'" target="_blank">'.urldecode($select['title']).'</a></td><td>'.date("d.m.Y H:i:s", $select[time]).'</td>
	<td><a href="game.php?village='.$idsat.'&screen=report&mode=public_reports&action=edit&id='.$select['report_id'].'">Editar</a>';
	}
	{/php}
</table>
{php} } {/php}
