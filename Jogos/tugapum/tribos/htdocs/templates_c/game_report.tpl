<h2>Rapoarte</h2>

<table>
	<tr>
		<td valign="top">
			<table class="vis" width="125">
					{if all==$mode}
						<tr>
							<td class="selected" width="120">
								<a href="game.php?village={$village.id}&amp;screen=report&amp;mode=all">Todos</a>
							</td>
						</tr>
					{else}
		                <tr>
		                    <td width="120">
								<a href="game.php?village={$village.id}&amp;screen=report&amp;mode=all">Todos</a>
							</td>
						</tr>
					{/if}
					{if attack==$mode}
						<tr>
							<td class="selected" width="120">
								<a href="game.php?village={$village.id}&amp;screen=report&amp;mode=attack">Ataque</a>							</td>
						</tr>
					{else}
		                <tr>
		                    <td width="120">
								<a href="game.php?village={$village.id}&amp;screen=report&amp;mode=attack">Ataque</a>
							</td>
						</tr>
					{/if}
					{if defense==$mode}
						<tr>
							<td class="selected" width="120">
								<a href="game.php?village={$village.id}&amp;screen=report&amp;mode=defense">Defesa</a>
							</td>
						</tr>
					{else}
		                <tr>
		                    <td width="120">
								<a href="game.php?village={$village.id}&amp;screen=report&amp;mode=defense">Defesa</a>
							</td>
						</tr>
					{/if}
					{if support==$mode}
						<tr>
							<td class="selected" width="120">
								<a href="game.php?village={$village.id}&amp;screen=report&amp;mode=support">Apoio</a>							</td>
						</tr>
					{else}
		                <tr>
		                    <td width="120"><a href="game.php?village={$village.id}&amp;screen=report&amp;mode=support">Apoio</a>							</td>
						</tr>
					{/if}
					{if trade==$mode}
						<tr>
							<td class="selected" width="120">
								<a href="game.php?village={$village.id}&amp;screen=report&amp;mode=trade">Mercado</a></td>
						</tr>
					{else}
		                <tr>
		                    <td width="120">
								<a href="game.php?village={$village.id}&amp;screen=report&amp;mode=trade">Mercado</a>
							</td>
						</tr>
					{/if}
					{if other==$mode}
						<tr>
							<td class="selected" width="120">
								<a href="game.php?village={$village.id}&amp;screen=report&amp;mode=other">Outros</a></td>
						</tr>
					{else}
		                <tr>
		                    <td width="120">
								<a href="game.php?village={$village.id}&amp;screen=report&amp;mode=other">Outros</a>
							</td>
						</tr>
					{/if}
					
			</table>
		</td>
		<td valign="top" width="700">
			{php} if ($_GET['mode'] == 'public_reports'){ {/php}
			{include file="game_report_public_reports.tpl"}
			{php} } else { {/php}{include file="game_report_$do.tpl"} {php}}{/php}
		</td>
	</tr>
</table>
