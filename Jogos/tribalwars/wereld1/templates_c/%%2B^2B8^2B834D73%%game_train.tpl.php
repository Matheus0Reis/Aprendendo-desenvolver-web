
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'entparse', 'game_train.tpl', 19, false),array('modifier', 'format_time', 'game_train.tpl', 241, false),array('modifier', 'format_date', 'game_train.tpl', 245, false),array('modifier', 'round', 'game_train.tpl', 373, false),)), $this); ?>
<?php if ($this->_tpl_vars['get']['action'] == 'train_mass' && $this->_tpl_vars['recruited'] != array ( )): ?>
<table>
	<tr>
		<td>
			<h2>Recrutar em massa</h2>
			Nesta visualização você pode produzir qualquer tipo de unidade, desde que todos os requerimentos de tais unidades tenham sido preenchidos (edfícios e tecnologias).
		</td>
	</tr>
</table>
<b>&raquo; Você ordenou os seguintes recrutamentos:</b>
<table class="vis" width="50%">
	<tr>
		<th>Aldeia</th>
		<th>Unidade</th>
	</tr>
	<?php $_from = $this->_tpl_vars['recruited']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['current_village'] => $this->_tpl_vars['single_recruit']):
?>
	<?php $this->_tpl_vars['cur_vil_info'] = $GLOBALS['db']->fetch($GLOBALS['db']->query("SELECT * FROM `villages` WHERE `id`='".$this->_tpl_vars['current_village']."'")); ?>
	<tr>
		<td><a href="game.php?village=395&amp;screen=info_village&amp;id=395"><?php echo ((is_array($_tmp=$this->_tpl_vars['cur_vil_info']['name'])) ? $this->_run_mod_handler('entparse', true, $_tmp) : entparse($_tmp)); ?>
 (<?php echo $this->_tpl_vars['cur_vil_info']['x']; ?>
|<?php echo $this->_tpl_vars['cur_vil_info']['y']; ?>
) K<?php echo $this->_tpl_vars['cur_vil_info']['continent']; ?>
</a></td>
		<td><?php $_from = $this->_tpl_vars['single_recruit']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['single_unit'] => $this->_tpl_vars['single_count']):
?><img title="<?php echo $this->_tpl_vars['cl_units']->get_name($this->_tpl_vars['single_unit']); ?>
" src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/unit/unit_<?php echo $this->_tpl_vars['cl_units']->get_graphicName($this->_tpl_vars['single_unit']); ?>
.png"/><?php echo $this->_tpl_vars['single_count']; ?>
<?php endforeach; endif; unset($_from); ?></td>
	</tr>
	<?php endforeach; endif; unset($_from); ?>
</table>
<a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=train&amp;mode=mass">&raquo; Voltar</a>
<?php else: ?>
<script type='text/javascript'>
<?php if ($this->_tpl_vars['get']['mode'] == 'mass'): ?>
	var trainManagers=new Array();
<?php endif; ?>
<?php echo '
	function trainManager(){
		this.arrc = 0;
		this.village = false;

		this.v_wood = 0;
		this.v_stone = 0;
		this.v_iron = 0;

		this.name = new Array();
		this.wood = new Array();
		this.iron = new Array();
		this.stone = new Array();
		this.bh = new Array();
		this.maxs = new Array();
		this.arrc = 0;
		this.freebh = 0;

		this.price = new Array();

		this.price["wood"] = new Array();
		this.price["iron"] = new Array();
		this.price["stone"] = new Array();
		this.price["bh"] = new Array();

		this.setNumber = function (name,count){
			if(!this.village)
				var element = document.getElementsByName(name);
			else
				var element = document.getElementsByName("units["+this.village+"]["+name+"]");
			if(!element[0].value || element[0].value == "")
				element[0].value = 0;
			element[0].value = Number(parseInt(element[0].value))+Number(count);
		}; 
		this.setVillage = function(setvil){
			this.village = setvil;
		};
		this.reset = function(name){
			if(!this.village)
				var element = document.getElementsByName(name);
			else
				var element = document.getElementsByName("units["+this.village+"]["+name+"]");
			if(!element[0].value || element[0].value == "")
				element[0].value = 0;
			element[0].value = 0;
		};
		this.fetchMax = function(name){
			var id;
			for(var tid=0;tid<this.arrc;tid++){
				if(this.name[tid] == name){
					id = tid;
					break;
				}
			}
			if(this.maxs[id] == null)
				return 0;
			return this.maxs[id];
		};
		this.addUnit = function(name,wood,iron,stone,bh){
			this.name[this.arrc] = name;
			this.wood[this.arrc] = wood;
			this.iron[this.arrc] = iron;
			this.stone[this.arrc] = stone;
			this.bh[this.arrc] = bh;

			this.price["wood"][this.arrc] = 0;
			this.price["iron"][this.arrc] = 0;
			this.price["stone"][this.arrc] = 0;
			this.price["bh"][this.arrc] = 0;

			this.arrc++;
		};
		this.setBh = function(bh){
			this.freebh = bh;
		};
		this.setRessis = function(wood,iron,stone){
			this.v_wood = wood;
			this.v_iron = iron;
			this.v_stone = stone;
		};
		this.getUsedRess = function(name){
			var out = 0;
			for(var c=0;c<this.arrc;c++){
				if(name == "wood")
					out += this.price[\'wood\'][c];
				else if(name == "iron")
					out += this.price[\'iron\'][c];
				else if(name == "stone")
					out += this.price[\'stone\'][c];
				else if(name == "bh")
					out += this.price[\'bh\'][c];
			}
			return out;
		};
		this.reCalcAll = function(){
			for(var c=0;c<this.arrc;c++){
				this.reCalc(this.name[c]);
			}
		};
		this.tick = function(){
			this.reCalcAll();
		};
		this.reCalc = function(name){
			if(!this.village)
				var max = document.getElementsByName(name);
			else
				var max = document.getElementsByName(\'units[\'+this.village+\'][\'+name+\']\');
				var max = parseInt(max[0].value);

			if(!max)
				max = 0;

			var id = 0;
			for(var tid=0;tid<this.arrc;tid++){
				if(this.name[tid] == name){
					id = tid;
					break;
				}
			}

			var wood = this.wood[id];
			var iron = this.iron[id];
			var stone = this.stone[id];
			var bh = this.bh[id];

			var c_wood = this.v_wood;
			var c_iron = this.v_iron;
			var cstone = this.v_stone;

			var bonus_wood = max*wood;
			var bonus_iron = max*iron;
			var bonus_stone = max*stone;
			var bonus_bh = max*bh;

			if(!this.village)
				var link = document.getElementById(name+"_0_a");
			else
				var link = document.getElementById(name+"_"+this.village+"_a");

			this.price["wood"][id] = bonus_wood;
			this.price["iron"][id] = bonus_iron;
			this.price["stone"][id] = bonus_stone;
			this.price["bh"][id] = bonus_bh;

			var calc_wood = (c_wood-this.getUsedRess("wood"))/wood;
			var calc_iron = (c_iron-this.getUsedRess("iron"))/iron;
			var calc_stone = (cstone-this.getUsedRess("stone"))/stone;
			var calc_bh = (this.freebh-this.getUsedRess("bh"))/bh;

			var new_value = Math.floor(Math.min(calc_wood,calc_iron,calc_stone,calc_bh));
			if(!isNaN(new_value) && new_value >= 0){
'; ?>

<?php if ($this->_tpl_vars['get']['mode'] == 'mass'): ?>
				link.href = 'javascript:trainManagers['+this.village+'].setNumber("'+name+'","'+new_value+'")';
<?php else: ?>
				link.href = 'javascript:trainManager.setNumber("'+name+'","'+new_value+'")';
<?php endif; ?>
<?php echo '

				this.maxs[id] = new_value;
'; ?>

				<?php if ($this->_tpl_vars['get']['mode'] == 'mass'): ?>new_value = "("+new_value+")";<?php endif; ?>
<?php echo ' 

				link.firstChild.wholeText = new_value;
				link.firstChild.nodeValue = new_value;
			}else if(new_value < 0){
'; ?>

				<?php if ($this->_tpl_vars['get']['mode'] == 'mass'): ?>new_value = "("+new_value+")";<?php endif; ?>
<?php echo ' 
				link.firstChild.wholeText = 0;
				link.firstChild.nodeValue = 0;
				this.maxs[id] = 0;
				link.href = \'javascript:trainManager.setNumber("\'+name+\'","0")\';
			}
		};
	};
'; ?>

</script>
<?php if ($this->_tpl_vars['get']['mode'] != 'mass'): ?>
<?php 
	$tmp = new getvillagedata();
	$this->_tpl_vars['cur_vil_inf'] = $tmp->getbyid($this->_tpl_vars['village']['id'],array("farm","r_bh","r_wood","r_iron","r_stone"));
    $tmp_farm = $this->_tpl_vars['cur_vil_inf']['farm'];
    $this->_tpl_vars['cur_vil_inf']['farmLimits'] = $this->_tpl_vars['arr_farm'][$tmp_farm]-$this->_tpl_vars['cur_vil_inf']['r_bh'];
 ?>
<script type="text/javascript">
    trainManager = new trainManager;
	trainManager.setBh(<?php echo $this->_tpl_vars['cur_vil_inf']['farmLimits']; ?>
);
	trainManager.setRessis(<?php echo $this->_tpl_vars['cur_vil_inf']['r_wood']; ?>
,<?php echo $this->_tpl_vars['cur_vil_inf']['r_iron']; ?>
,<?php echo $this->_tpl_vars['cur_vil_inf']['r_stone']; ?>
);
</script>
<table width="100%">
	<tr>
		<td>
			<h2>Recrutar</h2>
			Nesta visualização você pode produzir qualquer tipo de unidade, desde que todos os requerimentos de tais unidades tenham sido preenchidos (edfícios e tecnologias).
		</td>
	</tr>
</table><br />
	<?php if (count ( $this->_tpl_vars['recruit_units'] ) > 0): ?>
<table class="vis" width="100%">
	<tr>
		<th width="150">Unidade</th>
		<th width="120">Duração</th>
		<th width="150">Término</th>
		<th width="100">Cancelar *</th>
	</tr>
		<?php $_from = $this->_tpl_vars['recruit_units']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['value']):
?>
    <tr <?php if ($this->_tpl_vars['recruit_units'][$this->_tpl_vars['key']]['lit']): ?>class="lit"<?php endif; ?>>
		<td><?php echo $this->_tpl_vars['recruit_units'][$this->_tpl_vars['key']]['num_unit']; ?>
 <?php echo $this->_tpl_vars['cl_units']->get_name($this->_tpl_vars['recruit_units'][$this->_tpl_vars['key']]['unit']); ?>
</td>
			<?php if ($this->_tpl_vars['recruit_units'][$this->_tpl_vars['key']]['lit'] && $this->_tpl_vars['recruit_units'][$this->_tpl_vars['key']]['countdown'] > -1): ?>
		<td><span class="timer"><?php echo ((is_array($_tmp=$this->_tpl_vars['recruit_units'][$this->_tpl_vars['key']]['countdown'])) ? $this->_run_mod_handler('format_time', true, $_tmp) : format_time($_tmp)); ?>
</span></td>
			<?php else: ?>
	   	<td><?php echo ((is_array($_tmp=$this->_tpl_vars['recruit_units'][$this->_tpl_vars['key']]['countdown'])) ? $this->_run_mod_handler('format_time', true, $_tmp) : format_time($_tmp)); ?>
</td>
			<?php endif; ?>
		<td><?php echo ((is_array($_tmp=$this->_tpl_vars['recruit_units'][$this->_tpl_vars['key']]['time_finished'])) ? $this->_run_mod_handler('format_date', true, $_tmp) : format_date($_tmp)); ?>
</td>
		<td><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=train&amp;action=cancel&amp;id=<?php echo $this->_tpl_vars['key']; ?>
&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
">cancelar</a></td>
    </tr>
		<?php endforeach; endif; unset($_from); ?>
</table>
<div style="font-size: 7pt;">* (Apenas 90% dos recursos serão devolvidos!)</div><br />
	<?php endif; ?>
	<?php if (! empty ( $this->_tpl_vars['error'] )): ?><div class="error"><?php echo $this->_tpl_vars['error']; ?>
</div><?php endif; ?>
<table class="vis">
	<tr>
		<td <?php if ($this->_tpl_vars['mode'] == ''): ?>class="selected"<?php endif; ?>><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=train"><?php if ($this->_tpl_vars['mode'] == ''): ?>&raquo; <?php endif; ?>Recrutar</a></td>
		<td <?php if ($this->_tpl_vars['mode'] == 'mass'): ?>class="selected"<?php endif; ?>><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=train&amp;mode=mass"><?php if ($this->_tpl_vars['mode'] == 'mass'): ?>&raquo; <?php endif; ?>Recrutamento em massa</a></td>
	</tr>
</table>
<form action="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&screen=train&action=train&h=<?php echo $this->_tpl_vars['hkey']; ?>
" id="train_form" method="post">
	<table class="vis" width="100%">
		<tr>
			<th width="200">Unidade</th>
			<th><center><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/wood.png"></center></th>
			<th><center><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/stone.png"></center></th>
			<th><center><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/iron.png"></center></th>
			<th><center><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/farm.png"></center></th>
			<th class="nowrap" width="120">Duração</th>
			<th class="nowrap">Recrutar</th>
			<th>Recrutar</th>
		</tr>
		<?php $_from = $this->_tpl_vars['units']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['currentunit']):
?>
			<?php echo $this->_tpl_vars['cl_units']->check_needed($this->_tpl_vars['currentunit'],$this->_tpl_vars['village']); ?>

			<?php if (is_numeric ( $this->_tpl_vars['cl_units']->last_error )): ?>
			<script type="text/javascript">trainManager.addUnit('<?php echo $this->_tpl_vars['currentunit']; ?>
',<?php echo $this->_tpl_vars['cl_units']->get_woodprice($this->_tpl_vars['currentunit']); ?>
,<?php echo $this->_tpl_vars['cl_units']->get_stoneprice($this->_tpl_vars['currentunit']); ?>
,<?php echo $this->_tpl_vars['cl_units']->get_ironprice($this->_tpl_vars['currentunit']); ?>
,<?php echo $this->_tpl_vars['cl_units']->get_bhprice($this->_tpl_vars['currentunit']); ?>
);</script>
		<tr class="row_a">
			<td class="nowrap"><a href="javascript:popup('popup_unit.php?unit=<?php echo $this->_tpl_vars['currentunit']; ?>
', 520, 520)" class="unit_link" onclick=""><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/unit/<?php echo $this->_tpl_vars['currentunit']; ?>
.png?1" align="absmiddle" alt="" /><?php echo $this->_tpl_vars['cl_units']->get_name($this->_tpl_vars['currentunit']); ?>
</a></td>
			<td class="nowrap" align="center"><?php echo $this->_tpl_vars['cl_units']->get_woodprice($this->_tpl_vars['currentunit']); ?>
</td>
			<td class="nowrap" align="center"><?php echo $this->_tpl_vars['cl_units']->get_stoneprice($this->_tpl_vars['currentunit']); ?>
</td>
			<td class="nowrap" align="center"><?php echo $this->_tpl_vars['cl_units']->get_ironprice($this->_tpl_vars['currentunit']); ?>
</td>
			<td class="nowrap" align="center"><?php echo $this->_tpl_vars['cl_units']->get_bhprice($this->_tpl_vars['currentunit']); ?>
</td>
			<td><?php echo ((is_array($_tmp=$this->_tpl_vars['cl_units']->get_time($this->_tpl_vars['village']['barracks'],$this->_tpl_vars['currentunit']))) ? $this->_run_mod_handler('format_time', true, $_tmp) : format_time($_tmp)); ?>
</td>
			<td><?php echo $this->_tpl_vars['units_in_village'][$this->_tpl_vars['currentunit']]; ?>
/<?php echo $this->_tpl_vars['units_all'][$this->_tpl_vars['currentunit']]; ?>
</td>
			<td class="nowrap"><input name="<?php echo $this->_tpl_vars['currentunit']; ?>
"  id="<?php echo $this->_tpl_vars['currentunit']; ?>
_0" type="text" size="5" maxlength="5" tabindex="1"/><a id="<?php echo $this->_tpl_vars['currentunit']; ?>
_0_a" onmouseover='trainManager.reCalc("<?php echo $this->_tpl_vars['currentunit']; ?>
")'  href='javascript:trainManager.setNumber("<?php echo $this->_tpl_vars['currentunit']; ?>
","<?php echo $this->_tpl_vars['cl_units']->last_error; ?>
")'><?php echo $this->_tpl_vars['cl_units']->last_error; ?>
</a></td>
		</tr>
        	<?php endif; ?>
		<?php endforeach; endif; unset($_from); ?>
		<script type='text/javascript'><?php if ($this->_tpl_vars['get']['mode'] != 'mass'): ?>window.setInterval("trainManager.tick()", 1000);<?php endif; ?></script>
		<tr><th colspan="8"><div align="right"><input type="submit" value="Recrutar" class="button" /></div></th></tr>
	</table>
</form>
<?php else: ?>
<table>
	<tr>
		<td>
			<h2>Recrutar em massa</h2>
			<p>Nesta visualização você pode produzir qualquer tipo de unidade, desde que todos os requerimentos de tais unidades tenham sido preenchidos (edfícios e tecnologias).</p>
		</td>
	</tr>
</table><br />
<form method="post" action="#" id="mr_all_form">
	<table width="100%" class="vis">
	    <tr><?php $_from = $this->_tpl_vars['units']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['currentunit']):
?><th width="35" style="text-align:center"><img title="<?php echo $this->_tpl_vars['cl_units']->get_name($this->_tpl_vars['currentunit']); ?>
" src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/unit/unit_<?php echo $this->_tpl_vars['cl_units']->get_graphicName($this->_tpl_vars['currentunit']); ?>
.png"></th><?php endforeach; endif; unset($_from); ?></tr>
		<tr><?php $_from = $this->_tpl_vars['units']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['currentunit']):
?><td align="center"><input type="text" size="3" class="unit_input_field" id="unit_input_<?php echo $this->_tpl_vars['currentunit']; ?>
"  value="0"></td><?php endforeach; endif; unset($_from); ?></tr>
	</table>
</form>
<script type="text/javascript">
<?php echo '
	function filler(arg1){
		var units = new Array();
		var vals = new Array();
		var c = 0;
		var buffer,elem,link;
	'; ?>

	<?php $_from = $this->_tpl_vars['units']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['currentunit']):
?>
		units[c] = "<?php echo $this->_tpl_vars['currentunit']; ?>
";
		c++;
	<?php endforeach; endif; unset($_from); ?>
	<?php echo '
		for(var c=0;c<units.length;c++){
			buffer = "unit_input_"+units[c];
			elem = document.getElementById(buffer);
			vals[c] = elem.value;
		}
		for(var i in trainManagers){
			for(var c=0;c<units.length;c++){
				if(arg1 == false){
					trainManagers[i].reset(units[c]);
					trainManagers[i].setNumber(units[c],vals[c]);
				}else{
					trainManagers[i].setNumber(units[c],trainManagers[i].fetchMax(units[c]));
				}
			}
		}
	}
'; ?>

   </script>
<div style="text-align:center">
	<input type="button" value="Inserir tropas" onclick="return filler(false);" class="button" alt="" />
	<input type="button" value="Inserir máximo" onclick="return filler(true);" class="button" alt="" />
</div>
<?php if (! empty ( $this->_tpl_vars['error'] )): ?><div class="error"><?php echo $this->_tpl_vars['error']; ?>
</div><?php endif; ?>
<table class="vis">
	<tr>
		<td <?php if ($this->_tpl_vars['mode'] == ''): ?>class="selected"<?php endif; ?>><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=train"><?php if ($this->_tpl_vars['mode'] == ''): ?>&raquo; <?php endif; ?>Recrutar</a></td>
		<td <?php if ($this->_tpl_vars['mode'] == 'mass'): ?>class="selected"<?php endif; ?>><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=train&amp;mode=mass"><?php if ($this->_tpl_vars['mode'] == 'mass'): ?>&raquo; <?php endif; ?>Recrutamento em massa</a></td>
	</tr>
</table>
<form method="post" action="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=train&amp;mode=mass&amp;group=0&amp;action=train_mass&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
&amp;site=<?php echo $this->_tpl_vars['get']['site']; ?>
" id="mass_train_form">
	<table class="vis" width="100%">
		<tr>
			<th width="100%">Aldeias (<?php  echo count($this->_tpl_vars['villages']);  ?>)</th>
			<th><center><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/wood.png"></center></th>
			<th><center><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/stone.png"></center></th>
			<th><center><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/iron.png"></center></th>
			<th><center><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/farm.png"></center></th>
			<?php $_from = $this->_tpl_vars['units']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['currentunit']):
?><th width="35" style="text-align:center"><img title="<?php echo $this->_tpl_vars['cl_units']->get_name($this->_tpl_vars['currentunit']); ?>
" src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/unit/unit_<?php echo $this->_tpl_vars['cl_units']->get_graphicName($this->_tpl_vars['currentunit']); ?>
.png?1"></th><?php endforeach; endif; unset($_from); ?>
		</tr>
		<?php $_from = $this->_tpl_vars['villages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['currentvillage']):
?>
<?php 
	$this->_tpl_vars['cur_vil_inf'] = $GLOBALS['db']->fetch($GLOBALS['db']->query("SELECT * FROM `villages` WHERE `id`='".$this->_tpl_vars['currentvillage']."'"));
	$tmp_farm = $this->_tpl_vars['cur_vil_inf']['farm'];
	$this->_tpl_vars['cur_vil_inf']['farmLimits'] = $this->_tpl_vars['arr_farm'][$tmp_farm]-$this->_tpl_vars['cur_vil_inf']['r_bh'];
 ?>
		<script type="text/javascript">
			trainManagers[<?php echo $this->_tpl_vars['currentvillage']; ?>
]=new trainManager;
			trainManagers[<?php echo $this->_tpl_vars['currentvillage']; ?>
].setVillage(<?php echo $this->_tpl_vars['currentvillage']; ?>
);
			trainManagers[<?php echo $this->_tpl_vars['currentvillage']; ?>
].setBh(<?php echo $this->_tpl_vars['cur_vil_inf']['farmLimits']; ?>
);
			trainManagers[<?php echo $this->_tpl_vars['currentvillage']; ?>
].setRessis(<?php echo $this->_tpl_vars['cur_vil_inf']['r_wood']; ?>
,<?php echo $this->_tpl_vars['cur_vil_inf']['r_iron']; ?>
,<?php echo $this->_tpl_vars['cur_vil_inf']['r_stone']; ?>
);
			window.setInterval("trainManagers[<?php echo $this->_tpl_vars['currentvillage']; ?>
].tick()",1000);
		</script>
		<tr class="row_a selected">
			<td><a href="game.php?village=<?php echo $this->_tpl_vars['currentvillage']; ?>
&amp;screen=overview"><?php echo urldecode($this->_tpl_vars['cur_vil_inf']['name']); ?> (<?php echo $this->_tpl_vars['cur_vil_inf']['x']; ?>
|<?php echo $this->_tpl_vars['cur_vil_inf']['y']; ?>
) K<?php echo $this->_tpl_vars['cur_vil_inf']['continent']; ?>
</a></td>
			<td style="white-space:nowrap; text-align:center;"><?php echo ((is_array($_tmp=$this->_tpl_vars['cur_vil_inf']['r_wood'])) ? $this->_run_mod_handler('round', true, $_tmp) : round($_tmp)); ?>
</td>
			<td style="white-space:nowrap; text-align:center;"><?php echo ((is_array($_tmp=$this->_tpl_vars['cur_vil_inf']['r_stone'])) ? $this->_run_mod_handler('round', true, $_tmp) : round($_tmp)); ?>
</td>
			<td style="white-space:nowrap; text-align:center;"><?php echo ((is_array($_tmp=$this->_tpl_vars['cur_vil_inf']['r_iron'])) ? $this->_run_mod_handler('round', true, $_tmp) : round($_tmp)); ?>
</td>
			<td align="center"><?php echo $this->_tpl_vars['cur_vil_inf']['r_bh']; ?>
/<br /><?php  echo $this->_tpl_vars['farmLimits'][$this->_tpl_vars['cur_vil_inf']['farm']]; ?></td>
			<?php $_from = $this->_tpl_vars['units']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['currentunit']):
?>	
				<?php echo $this->_tpl_vars['cl_units']->check_needed($this->_tpl_vars['currentunit'],$this->_tpl_vars['cur_vil_inf']); ?>

				<?php if (! is_numeric ( $this->_tpl_vars['cl_units']->last_error )): ?><?php $this->_tpl_vars['cl_units']->last_error=-1; ?><?php endif; ?>						
			<td align="center">
				<div style="white-space:nowrap; margin-bottom: 3px;">
					<?php $this->_tpl_vars['prod_tmp'] = $this->_tpl_vars['in_prod'][$this->_tpl_vars['cur_vil_inf']['id']]; ?>
						<?php if (! $this->_tpl_vars['prod_tmp'][$this->_tpl_vars['currentunit']]): ?>
					<a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=train"><span class="dot brown"></a>
						<?php else: ?>
					<a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=train"><span class="dot green"></a>
						<?php endif; ?>
				</div>
				<input type="text" tabindex="" size="3" onmouseover='trainManagers[<?php echo $this->_tpl_vars['currentvillage']; ?>
].reCalcAll()' name="units[<?php echo $this->_tpl_vars['currentvillage']; ?>
][<?php echo $this->_tpl_vars['currentunit']; ?>
]" id="<?php echo $this->_tpl_vars['currentunit']; ?>
_<?php echo $this->_tpl_vars['currentvillage']; ?>
"><br />
						<?php if ($this->_tpl_vars['cl_units']->last_error != -1): ?> 
				<a href='javascript:trainManagers[<?php echo $this->_tpl_vars['currentvillage']; ?>
].setNumber("<?php echo $this->_tpl_vars['currentunit']; ?>
","<?php echo $this->_tpl_vars['cl_units']->last_error; ?>
")' id="<?php echo $this->_tpl_vars['currentunit']; ?>
_<?php echo $this->_tpl_vars['currentvillage']; ?>
_a">(<?php echo $this->_tpl_vars['cl_units']->last_error; ?>
)</a>
				<script type='text/javascript'>trainManagers[<?php echo $this->_tpl_vars['currentvillage']; ?>
].addUnit("<?php echo $this->_tpl_vars['currentunit']; ?>
",<?php echo $this->_tpl_vars['cl_units']->get_woodprice($this->_tpl_vars['currentunit']); ?>
,<?php echo $this->_tpl_vars['cl_units']->get_ironprice($this->_tpl_vars['currentunit']); ?>
,<?php echo $this->_tpl_vars['cl_units']->get_stoneprice($this->_tpl_vars['currentunit']); ?>
,<?php echo $this->_tpl_vars['cl_units']->get_bhprice($this->_tpl_vars['currentunit']); ?>
);</script>
						<?php else: ?>
				<div><br /></div>
						<?php endif; ?>
			</td>
			<?php endforeach; endif; unset($_from); ?>
		</tr>
		<?php endforeach; endif; unset($_from); ?>
		<tr><th colspan="15"><div align="right"><input type="submit" value="Recrutar" class="button" /></div></th></tr>
	</table>
	<div align="center">
    <?php unset($this->_sections['show_sites']);
$this->_sections['show_sites']['name'] = 'show_sites';
$this->_sections['show_sites']['start'] = (int)1;
$this->_sections['show_sites']['loop'] = is_array($_loop=$this->_tpl_vars['sites']+1) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['show_sites']['step'] = ((int)1) == 0 ? 1 : (int)1;
$this->_sections['show_sites']['show'] = true;
$this->_sections['show_sites']['max'] = $this->_sections['show_sites']['loop'];
if ($this->_sections['show_sites']['start'] < 0)
    $this->_sections['show_sites']['start'] = max($this->_sections['show_sites']['step'] > 0 ? 0 : -1, $this->_sections['show_sites']['loop'] + $this->_sections['show_sites']['start']);
else
    $this->_sections['show_sites']['start'] = min($this->_sections['show_sites']['start'], $this->_sections['show_sites']['step'] > 0 ? $this->_sections['show_sites']['loop'] : $this->_sections['show_sites']['loop']-1);
if ($this->_sections['show_sites']['show']) {
    $this->_sections['show_sites']['total'] = min(ceil(($this->_sections['show_sites']['step'] > 0 ? $this->_sections['show_sites']['loop'] - $this->_sections['show_sites']['start'] : $this->_sections['show_sites']['start']+1)/abs($this->_sections['show_sites']['step'])), $this->_sections['show_sites']['max']);
    if ($this->_sections['show_sites']['total'] == 0)
        $this->_sections['show_sites']['show'] = false;
} else
    $this->_sections['show_sites']['total'] = 0;
if ($this->_sections['show_sites']['show']):

            for ($this->_sections['show_sites']['index'] = $this->_sections['show_sites']['start'], $this->_sections['show_sites']['iteration'] = 1;
                 $this->_sections['show_sites']['iteration'] <= $this->_sections['show_sites']['total'];
                 $this->_sections['show_sites']['index'] += $this->_sections['show_sites']['step'], $this->_sections['show_sites']['iteration']++):
$this->_sections['show_sites']['rownum'] = $this->_sections['show_sites']['iteration'];
$this->_sections['show_sites']['index_prev'] = $this->_sections['show_sites']['index'] - $this->_sections['show_sites']['step'];
$this->_sections['show_sites']['index_next'] = $this->_sections['show_sites']['index'] + $this->_sections['show_sites']['step'];
$this->_sections['show_sites']['first']      = ($this->_sections['show_sites']['iteration'] == 1);
$this->_sections['show_sites']['last']       = ($this->_sections['show_sites']['iteration'] == $this->_sections['show_sites']['total']);
?>
	    <?php if ($this->_sections['show_sites']['index'] != $this->_tpl_vars['get']['site']): ?>
			<a href='game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&screen=train&mode=mass&site=<?php echo $this->_sections['show_sites']['index']; ?>
'>[<?php echo $this->_sections['show_sites']['index']; ?>
]</a>
    	<?php else: ?>
			<b>><?php echo $this->_sections['show_sites']['index']; ?>
<</b>
	    <?php endif; ?>
    <?php endfor; endif; ?>
	</div>
</form>
	<?php endif; ?>
<?php endif; ?>