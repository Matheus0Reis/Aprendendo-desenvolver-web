<h2>Apagar Aldeias de Barbaros </h2>

{if $deleteSuccess != ''}
<font class="error">{$deleteSuccess}</font>
{/if}
{if $fluela == 0}
<font class="error">Aldeias deletadas !</font>
{else}
<form method="post" action="index.php?screen=refugee_camp&action=delete" onSubmit="this.submit.disabled=true;">
    <table class="vis">
      <tr>
        <th colspan="2">Apagar Aldeias de Barbaros </th>
      </tr>
      <tr>
        <td width="200">Aldeias de Barbaros </td>
        <td width="50"><b>{$fluela}</b></td>
      </tr>
      <tr>
        <td width="200">Apagar todas </td>
        <td width="50"><input type="checkbox" name="confirm" value="confirm"></td>
      </tr>
      <tr>
        <td colspan="2"><input type="submit" value="Apagar"</td>
      </tr>
    </table>
</form>
{/if}