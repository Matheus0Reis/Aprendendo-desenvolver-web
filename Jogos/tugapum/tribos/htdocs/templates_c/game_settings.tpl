<table width="100%" align="center">
	<tr>
		<td>
			<h2>Configura&ccedil;&otilde;es</h2>
			{if !empty($error)}
				<h2 class="error">{$error|replace:"Ungültiger Dateiformat. Erlaubt sind JPEG, JPG, PNG und GIF!":"As imagens t&ecirc;m de ser JPEG, JPG, PNG, GIF!"|replace:"Ungültiger Benutzername":"Este jogador n&atilde;o existe! "|replace:"Das Passwort muss mindestens 4 Zeichen lang sein!":"A senha tem de conter pelo menos 4 car&aacute;teres!"|replace:"Du kannst dich nicht selbst als Urlaubsvertretung eintragen":"N&atilde;o se pode auto-adicionar!"}</h2>
			{/if}
				<table width="100%">
					<tr>
						<td valign="top" width="120">
							<table class="vis">
                                
								
								
								{if $mode == 'profile'}
								<tr>
                        			<td class="selected" width="120">
										<a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=profile">Perfil</a></td>
                    			</tr>

									{else}
                    			<tr>
                        		<td width="120">
									<a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=profile">Perfil</a></td>
							</tr>
									{/if}
									
									
									{if $mode == 'vacation'}
								<tr>
                        			<td class="selected" width="120">
										<a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=vacation">Modo de f&eacute;rias</a>
									</td>
                    			</tr>

									{else}
                    			<tr>
                        		<td width="120">
									<a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=vacation">Modo de f&eacute;rias</a>
								</td>
							</tr>
									{/if}
									{if $mode == 'logins'}
								<tr>
                        			<td class="selected" width="120">
										<a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=logins">&Uacute;ltimos logins </a></td>
                    			</tr>

									{else}
                    			<tr>
                        		<td width="120">
									<a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=logins">&Uacute;ltimos logins</a>								</td>
							</tr>
									{/if}
									{if $mode == 'change_passwd'}
								<tr>
                        			<td class="selected" width="120">
										<a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=change_passwd">Alterar senha</a>									</td>
                    			</tr>

									{else}
                    			<tr>
                        		<td width="120">
									<a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=change_passwd">Alterar senha</a>								</td>
							</tr>
									{/if}
								
								
                		</table>
            		</td>
					<td valign="top" align="left">

							{include file="game_settings_$mode.tpl" title=foo}

            		</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
