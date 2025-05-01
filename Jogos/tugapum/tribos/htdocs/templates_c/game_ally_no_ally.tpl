<h2 align="">Tribo</h2>
<div align="left">{if !empty($error)}
</div>
<div style="color:red; font-size:large">
<div align="left">
{php}
include ("include/config.php");
if ($config['create_ally'] == 0) {echo "ATENÇÃO: Não pode criar uma nova tribo "; } else {
{/php}
  {$error|replace:"Der Name muss mindestens 4 Zeichen lang sein!":"O nome da tribo tem de conter no mínimo 4 carácteres! "|replace:"Der Tag muss mindestens 2 Zeichen lang sein!":"A TAG da tribo tem de conter no mínimo 2 carácteres! "|replace:"Name schon vergeben!":"O nome já existe! "|replace:"Tag schon vergeben!":"A TAG já existe! "|replace:"Das erstellen von Stämmen wurde deaktiviert!":"Criar novas tribos está desativado !"}
{php}}{/php}
</div>
</div>
<div align="left">{/if}
</div>
<p align="left">Precisa ser convidado para afiliar-se a uma tribo.</p>

<form action="game.php?village={$village.id}&amp;screen=ally&amp;action=create&amp;h={$hkey}" method="post">
  <div align="left">
  <table width="451" class="vis">
    <tr>
      <th colspan="2">Criar tribo </th>
    </tr>
    <tr>
      <td width="89">Nome da tribo :</td>
      <td width="261"><div align="left">
            <input type="text" name="name" /></div></td>
    </tr>
    <tr>
      <td>TAG da tribo :</td>
      <td><div align="left">
            <input type="text" name="tag" maxlength="6" /></div></td>
    </tr>
  </table>
  <input type="submit" value="Criar" style="font-size:10pt;" />
  </div>
</form>
<div align="left"><br />
  
  <table class="vis">
    <tr>
      <th colspan="3" width="{$user.window_width}">Convites<br>
    </th></tr>
      {foreach from=$invites item=arr key=id}
      <tr>
        <td><a href="game.php?village={$village.id}&amp;screen=info_ally&amp;id={$arr.from_ally}">{$arr.tag}</a></td>
	    <td align="left"><a href="game.php?village={$village.id}&amp;screen=ally&amp;action=accept&amp;id={$id}&amp;h={$hkey}">Aceitar</td>
	    <td align="left"><a href="game.php?village={$village.id}&amp;screen=ally&amp;action=reject&amp;id={$id}&amp;h={$hkey}">Recusar</td>
    </tr>
      {/foreach}
  </table>
  <br />
</div>
