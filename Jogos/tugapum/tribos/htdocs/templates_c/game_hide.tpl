<table>
	<tr>
		<td style="padding:2px;">
			<table>
				<tr>
					<td>
						<img src="graphic/big_buildings/hide.png" title="Esconderijo" alt="" />
					</td>
					<td>
						<h2><span class="fontevermelha">Esconderijo</span> <span class="cororido3">({$village.hide|stage|replace:"Stufe":"Nível"|replace:"nicht vorhanden":"não construído"})</span></h2>
						{$description}
					</td>
				</tr>
			</table><br />
			<table class="vis">
				<tr>
					<td width="200">
						Capacidade Maxima
					</td>
					<td>
						<b>{$hide_datas.max_hide}</b>
						Unidades de cada recursso
					</td>
				</tr>

				{if ($hide_datas.max_hide_next)==false}

				{else}


					<tr>
						<td>
							Capacidade no (Nivel {$village.hide+1})
						</td>
						<td>
							<b>{$hide_datas.max_hide_next}</b>
							Unidades de cada recursso
						</td>
					</tr>
				<tr>
    			{/if}

					<td>
						Recurssos que podem ser saqueados:</td>
					<td>
						<img src="graphic/holz.png" title="Madeira" alt="" /> {$village.r_wood-$hide_datas.max_hide}
						<img src="graphic/lehm.png" title="Argila" alt="" />{$village.r_stone-$hide_datas.max_hide}
						<img src="graphic/eisen.png" title="Ferro" alt="" />{$village.r_iron-$hide_datas.max_hide}
					</td>
				</tr>
				<tr>
					<td colspan="2">
						Ofertas no mercado tambem podem ser saqueadas.
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>