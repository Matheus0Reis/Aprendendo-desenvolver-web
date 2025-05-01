<form action="game.php?village={$village.id}&amp;screen=report&amp;mode={$mode}&amp;action=del_arch&amp;h={$hkey}" method="post">
	<table class="vis" width="100%">
		{if $num_pages>1}
			<tr>
				<td align="center" colspan="2">
					{section name=countpage start=1 loop=$num_pages+1 step=1}
						{if $site==$smarty.section.countpage.index}
							<strong> &gt;{$smarty.section.countpage.index}&lt; </strong>
						{else}
							<a href="game.php?village={$village.id}&amp;screen=report&amp;mode={$mode}&amp;site={$smarty.section.countpage.index}"> [{$smarty.section.countpage.index}] </a>
						{/if}
					{/section}
				</td>
			</tr>
		{/if}
		<tr>
			<th class="fonte6maior">Assunto</th>
			<th class="fonte6maior" width="140">Recebido</th>
		</tr>
		{if count($reports)>0}
			{foreach from=$reports key=key item=array}
					
				{$ida}{$ida}{$ida}
				<tr>
					<td><input name="id_{$reports.$key.id}" type="checkbox" /> <a href="game.php?village={$village.id}&amp;screen=report&amp;mode={$mode}&amp;view={$reports.$key.id}">
										
					{$reports.$key.title|replace:'greift':'atacou'|replace:' an':''|replace:'unterst√ºtzt':"apoiou"|replace:'Deine':"Seu"|replace:'Unterst√ºtzung':"Apoio"|replace:"aus":"de"|replace:"wurdegegriffen":"Foi atacado"|replace:"in":"em"|replace:"beliefert":"forneceu"|replace:"hat dich em den Stamm":"te convidou para tribo"|replace:" eemgeladen":""|replace:"Angebot von":"You accepted an offer by"|replace:"genommen":""|replace:"Die":"O"|replace:"Eemladung":"convite"|replace:"des":"para"|replace:"Stamm":"tribo"|replace:"wurde":"foi"|replace:"zur√ºckgezogen":"cancelado"|replace:"hat":""|replace:"deemen":"debandou sua"|replace:"aufgel√∂st":""|replace:"um":"solicitou"|replace:"eeme":"uma"|replace:"Urlaubsvertretunggefragt":"substituiÁ„o de fÈrias"}{$reports.$report}
					</a> {if $reports.$key.is_new=="1"}<span class="fonte5">(novo)</span>{/if}{if $reports.$key.is_new=="0"}<span class="fuck_menu">(verificado)</span>{/if}</td>
					<td class="cororido">{$reports.$key.date}</td>
				</tr>
			{/foreach}
			<tr>
				<th><input name="all" type="checkbox" onclick="selectAll(this.form, this.checked)" / ><span class="fonte6maior"> Selecionar Todos</span></th>
				<th></th>
			</tr>
			</table>

			<table class="vis" align="left">
			<tr>
				<td><input type="submit" value="Apagar" name="del" /></td>
			</tr>
		{/if}
	</table>
</form>