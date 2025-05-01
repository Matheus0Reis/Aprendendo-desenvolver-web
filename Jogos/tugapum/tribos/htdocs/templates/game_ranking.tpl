<table width="100%" align="center">
    <tr>
		<td>
			<h2 class="menus">{if $mode=="ally"}Classificação das Tribos{/if}{if $mode=="player"}Classificação dos Jogadores{/if}{if $mode=="kill_player"}Classificação de O.D.{/if}</h2>
				<table>
					<tr>
						<td valign="top" width="125">
							<table class="vis">
                                
                                
                                
                                
                                
								<tr>
                        			<td {if $mode==ally} class="selected" {/if} width="125">
                                                    <a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally">Tribos</a>
									</td>
                    			</tr>
                                                                
 <tr>
                        			<td {if $mode==player} class="selected" {/if} width="125">
                                                    <a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player">Jogadores</a>
									</td>
                    			</tr>


<tr>
                        			<td {if $mode==kill_player} class="selected" {/if} width="125">
                                                    <a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=kill_player&amp;type=att">Oponentes Derrotados</a>
									</td>
                    			</tr>
				
                                                                
                                                                
                                                                
                                                                
                		</table>
            		</td>
					<td valign="top" align="left">

						{if in_array($mode,$allow_mods)}

							{include file="game_ranking_$mode.tpl" title=foo}

						{/if}
            		</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
