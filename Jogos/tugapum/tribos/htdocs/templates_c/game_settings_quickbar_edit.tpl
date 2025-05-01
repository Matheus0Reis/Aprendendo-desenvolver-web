<h3>Editar link </h3>
{php}
if (empty($_POST['name']) && $_GET['confirm'] == 'yes') {
      
      echo "<span><font color='red'><h5>Especifique um Nome.</h5></font></span>";
}
if (empty($_POST['href']) && $_GET['confirm'] == 'yes') {
      echo "<span><font color='red'><h5>Coloque um Link.</h5></font></span>";
}
{/php}
<form method="post" action="game.php?village={$village.id}&screen=settings&mode=quickbar&action=edit&confirm=yes&id={$id}">
<table class="vis">
  <tr>
    <td width="70">Nome: </td>
    <td><input type="text" name="name" size="35" value="{$name|replace:"Hauptgebäude":"Edifício Principal"|replace:"Kaserne":"Quartel"|replace:"Stall":"Estábulo"|replace:"Werkstatt":"Oficina"|replace:"Adelshof":"Academia"|replace:"Schmiede":"Ferreiro"|replace:"Platz":"Praça"|replace:"Markt":"Mercado"}"></td>
  </tr>
  <tr>
    <td width="70">URL-imagem</td>
    <td><input type="text" name="img" size="35" value="{$img}"></td>
  </tr>
  <tr>
    <td width="70">URL-Alvo</td>
    <td><input type="text" name="href" size="35" value="{$href}"></td>
  </tr>
  <tr>

    <td colspan="2"><input type="checkbox" name="newWindow" {if $target == 1} checked="checked"{/if}>
    Abrir em nova janela </td>
  </tr>
  <tr>
    <td colspan="2">
      <input type="submit" value="OK">
    </td>
  </tr>
</table>