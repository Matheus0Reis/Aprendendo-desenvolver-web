<p>Aqui você pode renomear todas as suas aldeias de uma vez.</p>
<p>
 Os seguintes espaços reservados existem:<br />
 {literal}
 <table>
  <tr>
   <th align=left width=100 class="fonte9">Comando</th>
   <th align=left width=300 class="fonte9">Importancia</th>
   <th align=left width=100 class="fonte9">Exemplo</th>
  </tr>
  <tr>
   <td>{NR_0}</td>
   <td>O número da aldeia, com 0.</td>
   <td>001, 002, 003</td>
  </tr>
  <tr>
   <td>{NR}</td>
   <td>O número da aldeia.</td>
   <td>1, 2, 3</td>
  </tr>
  <tr>
   <td>{x}</td>
   <td>A coordenada x da aldeia.</td>
   <td>535, 554, 534</td>
  </tr>
  <tr>
   <td>{y}</td>
   <td>A coordenada y da aldeia.</td>
   <td>553, 545, 543</td>
  </tr>  
 </table>
 {/literal}
</p>
{if $Error != 'Umbenennen fehlgeschlagen.'} 
 {$Error}<br /><br />
{else}
 <br /><br />
{/if}
<form action='game.php?village={$village.id}&screen=overview_villages&mode=rename' method='post'>
 <table>
  <tr>
   <td>Nome:</td>
   <td><input type=text name=name /></td>
  </tr>
  <tr>
   <td><input type='submit' value='Renomear' /></td>
   <td>&nbsp;</td>
  </tr>
 </table>
</form>