<h2>Debugador de Ataques </h2>
Comando utilizado para debugar ataques fantasma. <br />
<br />
	
{if $done=='attacks'}
	Ataques recalculados {elseif $done=='reload_events'}
	Dados Recalculados {else}
	<a href="index.php?screen=debugger&action=attacks">RE-CALCULAR ATAQUES </a><br />

{/if}