{if isset($install_done)}
    <h2 style="color: green; text-align: center;">Installation erfolgreich</h2>
{/if}
<h1 style="text-align: center;">Grupos</h1>
{if $install == 'true'}
<h3 style="color: green;">Installation bereits durchgef&uuml;hrt!</h3>
{else}
<h3 style="color: yellow;">Installation wird noch ben&ouml;tigt!</h3>
<a href="?screen=groups&amp;install">Instalar Sistema de Grupos</a>
{/if}