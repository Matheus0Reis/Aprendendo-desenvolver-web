{php}
if($_GET['lipe'] == 'size') {
	$size_map = ($_POST['map_size']);
    $winter = ($_POST['winter']);
	$lipe_jog = $this->_tpl_vars['user']['id'];
	$lipe_ald = $this->_tpl_vars['village']['id'];
	$alterar = mysql_query("UPDATE users SET map_size = '$size_map' WHERE id = '$lipe_jog'") or die(mysql_error());
{/php}
	<meta http-equiv="refresh" content="0;URL=game.php?village={php}echo $lipe_ald{/php}&screen=map" />
{php} }
	require_once("graphic.php");
	if ($w == 'winter') {
		$graphic = "winter";
	} else {
		$graphic = "graphic";
	}
	$lipe = date("H");
	if($lipe >= 20 || $lipe < 8) {
		$map = "map_night";
	} else {
		$map = "map";
	}
{/php}
<div id="info" style="position:absolute; top:0px; left:0px; width:350px; height:1px; visibility: hidden; z-index:10">
    {php}if($lipe >= 20 || $lipe < 8) {{/php}
	<table class="vis" style="background-color: #000000; width:auto">
		<tr><td rowspan="13" id="bonusbild"></td><th colspan="2" id="info_title"">Bonus</th></tr>
		<tr><td id="bonus" colspan="2"></td></tr>
		<tr><td>Pontos:</td><td id="info_points">Points</td></tr>
		<tr id="info_owner_row"><td>Proprietario:</td><td id="info_owner">owner</td></tr>
		<tr id="info_left_row"><td colspan="2">abandonada</td></tr>
		<tr id="info_ally_row"><td>Tribo:</td><td id="info_ally">ally</td></tr>
		<tr id="info_village_groups_row"><td>Grupo:</td><td id="info_village_groups">village_groups</td></tr>
	</table>
{php} }else{ {/php}
	<table class="vis" style="background-color: #e5d7b2; width:auto">
		<tr><td rowspan="13" id="bonusbild"></td><th colspan="2" id="info_title"">title</th></tr>
		<tr><td id="bonus" colspan="2"></td></tr>
		<tr><td>Pontos:</td><td id="info_points">Points</td></tr>
		<tr id="info_owner_row"><td>Proprietario:</td><td id="info_owner">owner</td></tr>
		<tr id="info_left_row"><td colspan="2">abandonada</td></tr>
		<tr id="info_ally_row"><td>Tribo:</td><td id="info_ally">ally</td></tr>
		<tr id="info_village_groups_row"><td>Grupo:</td><td id="info_village_groups">village_groups</td></tr>
	</table>
{php} } {/php}
</div>
<h2>Continente {$continent}</h2>

<table collspacing="1" collpadding="0"><tr><td valign="top">

	<table>
		<tr>
			<td valign="top">
				<table class="main" cellspacing="1" cellpadding="0" style="background-color: #DED3B9; border: 2px solid rgb(0, 0, 0);">
					<tr>
						<td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x-$map.size+1}&amp;y={$map.y+$map.size-1}"><img src="graphic/map/map_nw.png" style="z-index:1; position:relative;" alt="map/map_nw.png"/></a></td>
						<td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x}&amp;y={$map.y+$map.size-1}"><img src="graphic/map/map_n.png" style="z-index:1; position:relative;" alt="map/map_n.png"/></a></td>
						<td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x+$map.size-1}&amp;y={$map.y+$map.size-1}"><img src="graphic/map/map_ne.png" style="z-index:1; position:relative;" alt="map/map_ne.png"/></a></td>
					</tr>
					<tr>
						<td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x-$map.size+1}&amp;y={$map.y}"><img src="graphic/map/map_w.png" style="z-index:1; position:relative;" alt="map/map_w.png"/></a></td>
						<td>	
							<table style="background-color: #f8edce; border: 1px solid #f8edce;" cellspacing="0" cellpadding="0" class="map">
		{foreach from=$y_coords item=y}
			<tr>
				<td width="20">{$y}</td>
			{foreach from=$x_coords item=x}
				{php}
					$rand = rand(0,30);
				{/php}
				{if !$cl_map->getVillage($x,$y)}
					<td id="tile_{$x}_{$y}" class="{$cl_map->getClass($x,$y)}"><img src="{php}echo $graphic; {/php}/{php}echo $map; {/php}/{php}
					if($rand <=28)
					{
						echo "gras4.png";
					}					
					else if($rand==29)
					{
						echo "forest0000.png";
					}
					if ($rand==30)
					{
						echo "see.png";
					}
				{/php}" alt="" /></td>
				{else}
					<td id="tile_{$x}_{$y}" class="{$cl_map->getClass($x,$y)}" style="background-color:rgb({$cl_map->getColor($x,$y)})"><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$cl_map->getvillageid($x,$y)}"><img src="{php}echo $graphic; {/php}/{php}echo $map; {/php}/{$cl_map->graphic($x,$y)}{php}if (get_bonus($this->_tpl_vars[x], $this->_tpl_vars[y])) echo 'b.png';{/php}" onmouseover="map_popup('{$cl_map->getVillage($x,$y,"name")} ({$x}|{$y}) K{$cl_map->getcon($x,$y)}', {$cl_map->getvillage($x,$y,points)}, {$cl_map->playerinfo($x,$y)|replace:"Punkte":"Pontos"}, {$cl_map->getally($x,$y)|replace:"Punkte":"Pontos"}, false, {$x}, {$y}, {$village.id}, {$cl_map->getvillage($x,$y)})" onmouseout="map_kill()" alt="" /></a></td>	
				{/if}
			{/foreach}
		</tr>
		{/foreach}
		<tr>
			<td height="20"></td>
			{foreach from=$x_coords item=x}
				<td>{$x}</td>
			{/foreach}
		</tr>
	</table>
</td>
<td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x+$map.size-1}&amp;y={$map.y}"><img src="graphic/map/map_e.png" style="z-index:1; position:relative;" alt="map/map_e.png"/></a></td>
</tr>
<tr>
	<td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x-$map.size+1}&amp;y={$map.y-$map.size+1}"><img src="graphic/map/map_sw.png" style="z-index:1; position:relative;" alt="map/map_sw.png"/></a></td>
	<td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x}&amp;y={$map.y-$map.size+1}"><img src="graphic/map/map_s.png" style="z-index:1; position:relative;" alt="map/map_s.png"/></a></td>
	<td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x+$map.size-1}&amp;y={$map.y-$map.size+1}"><img src="graphic/map/map_se.png" style="z-index:1; position:relative;" alt="map/map_se.png"/></a></td>
</tr></table></td>
<td valign="top"></td>
</tr></table></td>
<td valign="top">
	<table><tr><td valign="top">
		<table class="main" cellspacing="1" cellpadding="0" style="background-color: #DED3B9; border: 2px solid rgb(0, 0, 0);">
			<tr>
				<td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x-50}&amp;y={$map.y+50}"><img src="graphic/map/map_nw.png" style="z-index:1; position:relative;" alt="map/map_nw.png"/></a></td><td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x}&amp;y={$map.y+50}"><img src="graphic/map/map_n.png" style="z-index:1; position:relative;" alt="map/map_n.png"/></a></td><td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x+50}&amp;y={$map.y+50}"><img src="graphic/map/map_ne.png" style="z-index:1; position:relative;" alt="map/map_ne.png"/></a></td></tr><tr><td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x-50}&amp;y={$map.y}"><img src="graphic/map/map_w.png" style="z-index:1; position:relative;" alt="map/map_w.png"/></a></td>
				<td>
					<form method="POST" action="game.php?village={$village.id}&screen=map&action=bigMapOnclick">	
						<input type="hidden" name="startX" id="startX" value="{$xs}" />
						<input type="hidden" name="startY" id="startY" value="{$ys}" />
					<div style="position:relative; padding:0px">
						<div style="position:absolute;z-index:100">
							<input type="image" class="noneStyle" src="graphic/map/empty.png" style="width:251px;height:250px;margin:0px;padding:0px" />
						</div>
						<img src="graphic/continent/{$user.id}-{$conmap}-{$contime}.png">
						<div id="bigMapRect" style="z-index:10; position:absolute; top:{$bigMapRectTop}px; left:{$bigMapRectLeft}px; width:{$mapSize*5-1}px; height:{$mapSize*5-1}px; border: 1px solid rgb(213, 227, 174);">
						</div>
					</div>
					</form>
				</td>
				<td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x+50}&amp;y={$map.y}"><img src="graphic/map/map_e.png" style="z-index:1; position:relative;" alt="map/map_e.png"/></a></td>
			</tr>
			<tr>
				<td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x-50}&amp;y={$map.y-50}"><img src="graphic/map/map_sw.png" style="z-index:1; position:relative;" alt="map/map_sw.png"/></a></td>
				<td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x}&amp;y={$map.y-50}"><img src="graphic/map/map_s.png" style="z-index:1; position:relative;" alt="map/map_s.png"/></a></td>
				<td align="center"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$map.x+50}&amp;y={$map.y-50}"><img src="graphic/map/map_se.png" style="z-index:1; position:relative;" alt="map/map_se.png"/></a></td>
				</tr>
			</table>
		</td>
	<td valign="top"></td>
</tr></table>
<br />


<table align="center" background="../graphic/background/content.jpg">
<th colspan="4">Opções do mapa</th>
<tr id="menu_row2">
<td background="../graphic/background/content.jpg">
<div id="tableID1_Div">
<a href="#" onclick="showHide(this,'show');">Mostrar</a>
</div>
<div align="center" id="tableID1" style="display:none;">

<p><table class="vis" align="center" cellspacing="1" cellpadding="0" style="background-color: #e2d4b1; border: 1px solid rgb(128, 64, 0);">
	<tbody>
		<form style="text-align:center;"  action="game.php?village={$village.id}&amp;screen=map" method="post">
			<tr>
				<th colspan="2"><center>Centrar mapa:</center></th>
        		</tr>
        		<tr>
				<td class="nowrap">                        
					X: <input type="text" name="x" value="{$map.x}" size="5" />
					Y: <input type="text" name="y" value="{$map.y}" size="5" />
				</td>
				<td>
					<input type="submit" name="go" value=" OK " />
				</td>
        		</tr>
		</form>
		<tr>
			<td colspan="2"><center>&nbsp;&nbsp;</center></td>
		</tr>
		<form style="text-align:center;"  action="game.php?village={$village.id}&amp;screen=map&amp;mode=settings&amp;lipe=size" method="post">
			<tr>
				<th colspan="2"><center>Definir tamanho do mapa:</center></th>
		        </tr>
		        <tr>
				<td class="nowrap">                        
						Tamanho:
							<select name="map_size">
								<option label="Pequeno" value="7" {if $user.map_size==7}selected="selected"{/if}>7x7</option>
								<option label="Padr&atilde;o" value="9" {if $user.map_size==9}selected="selected"{/if}>9x9</option>
								<option label="M&eacute;dio" value="11" {if $user.map_size==11}selected="selected"{/if}>11x11</option>
								<option label="Grande" value="13" {if $user.map_size==13}selected="selected"{/if}>13x13</option>
								<option label="Gigante" value="17" {if $user.map_size==17}selected="selected"{/if}>17x17</option>
							</select>
				</td>
				<td>
					<input type="submit" name="submit" value="OK" />
				</td>
			</tr>
		</form>
        <tr>
			<td colspan="2"><center>&nbsp;&nbsp;</center></td>
		</tr>
        <tr>
				<th colspan="2"><center>Aldeias no mapa</center></th>
        		</tr>
        		<tr>
				<td colspan="15"> <span style="color: #008000;"><b>{php}$a = mysql_fetch_array(mysql_query("SELECT COUNT(id) FROM `villages` WHERE `userid` = '-1'"));
 echo $a[0];0{/php}</span> <i> aldeias bárbaras </i></b></td>
        		</tr>
	</tbody>
</table>

</td></tr></table></p>

</div>
</td>
</tr>
</table>
<script src="js.js" type="text/javascript"></script>

<table class="vis" align="center" cellspacing="1" cellpadding="0" style="background-color: #e2d4b1; border: 1px solid rgb(128, 64, 0);">
	

<br />
<table class="main" cellspacing="1" cellpadding="0" style="background-color: #e2d4b1; border: 1px solid rgb(128, 64, 0); margin-center: 2px;" align="center">
	<tbody>
		<tr class="nowrap">
			<th class="small">Padrão:</th>
			<td width="10" style="background-color: rgb(255, 255, 255);"/>
			<td class="small">Aldeia atual</td>
			<td width="10" style="background-color: rgb(240, 200, 0);"/>
			<td class="small">Suas aldeias</td>
			<td width="10" style="background-color: rgb(0, 0, 244);"/>
			<td class="small">Suas tribo</td>
			<td width="10" style="background-color: rgb(150, 150, 150);"/>
			<td class="small">Aldeias abandonadas</td>
			<td width="10" style="background-color: rgb(180, 0, 0);"/>
			<td class="small">Outras aldeias</td>
		</tr>
		<tr class="nowrap">
			<th class="small">Tribo:</th>
			<td width="10" style="background-color: rgb(0, 160, 244);"/>
			<td class="small">Aliados</td>
			<td width="10" style="background-color: rgb(128, 0, 128);"/>
			<td class="small">Pactos de não-Agressão (PNA)</td>
			<td width="10" style="background-color: rgb(244, 0, 0);"/>
			<td class="small">Inimigos</td>
		</tr>
	</tbody>
</table>