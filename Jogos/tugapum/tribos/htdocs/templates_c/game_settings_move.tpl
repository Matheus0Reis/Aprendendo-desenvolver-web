<h3>Recome&ccedil;ar</h3>
<p> Caso perceba que n&atilde;o ter&aacute; hip&oacute;tese de sobreviver ou crescer com sucesso em sua &aacute;rea, tem a possibilidade de recome&ccedil;ar com uma nova aldeia. A sua antiga aldeia ser&aacute; abandonada e seus habitantes poder&atilde;o recome&ccedil;ar a vida numa nova aldeia. </p>
<p> Ap&oacute;s um recome&ccedil;ar dever&aacute; esperar 14 dias para poder recome&ccedil;ar novamente. &Eacute; apenas poss&iacute;vel recome&ccedil;ar enquanto se possui exactamente 1 aldeia. </p>
<form method="post" action="game.php?village={$village.id}&screen=settings&mode=move&action=move&hkey={$hkey}">
Senha: 
  <input type="password" name="password">
                                  <input type="submit" value="OK">
</form>
{if $get == 'move'}
  {if $pwError != ''}
  <font class="error">{$pwError}</font>
  {/if}
{/if}