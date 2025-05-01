<table class="vis" border="1" style=border:1px solid">
 <th><h4>Editar Jogador :</h4></th>
 <th>&nbsp;{$username}</th>
 <th>&nbsp;&nbsp;<a href="index.php?screen=users">&raquo;Lista de Usuarios </a></th>
 <tr>
  <td><b>&raquo; Alterar Nome </b></td>
  <td> <form method="post" action="index.php?screen=users&action=edit&mode=change_name&name={$username}&id={$id}">
                              <input type="text" name="username" size="13">
                              </input>
  </td>
  <td>
                              <input type="submit" name="submit" value="Alterar Nome">
                              </input>
      </form>
  </td>
   </tr>
   <tr>
   <td><b>&raquo; Kickar Player </b>
   </td>
   <td colspan="2">
   <a href="index.php?screen=users&action=edit&mode=kick&id={$id}">&raquo; Kickar </a>
  
   (encerrar sess&atilde;o) </td>
   </tr>
   <tr>
    <td>
    <b>&raquo; Apagar Conta </b>    </td>
    <td colspan="2">
    <a href="index.php?screen=users&action=edit&mode=delete&id={$id}">&raquo; Apagar </a>
    </td>
   </tr>
   <tr>
    <td>
    <b>&raquo; Tirar da Tribo </b>
    </td>
    <td colspan="2">
    <a href="index.php?screen=users&action=edit&mode=kick_tribe&id={$id}">&raquo; Remover da Tribo </a></td>
   </tr>
   <tr> 
    <td><b>Aldeias:</b>
    </td>
    <td colspan="3">
    <table class="vis" border="1" style=border:1px solid">
 <tr>
  <th>ID</th>
  <th>Nome</th>
  <th>Coordenadas</th>
  <th>Pontos</th>
  <th>Continente</th>
  <th></th>
 </tr>
{foreach from=$villages item=village}
<td>
{$village.id}
</td>
<td>
{$village.name}
</td>
<td>
&nbsp;&nbsp;&nbsp;{$village.x}|{$village.y}
</td>
<td>
&nbsp;&nbsp;&nbsp;{$village.points}
</td>
<td>
&nbsp;&nbsp;&nbsp;{$village.continent}
</td>
<td>
<a href="index.php?screen=users&action=edit&mode=village&id={$id}&village_id={$village.id}">Retirar Aldeia </a>
</tr>
<tr>
{/foreach}
</table>
</td>
   </tr> 
</table>

<p align="right">&copy; by pL4n3</p>
