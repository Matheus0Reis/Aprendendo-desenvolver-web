{if isset($fehler)}
  {if $fehler == 'no_name'}
    <p style="color: red; font-size: 18px;">Nome não especificado!</p>
  {elseif $fehler == 'wrong_id'}
    <p style="color: red; font-size: 18px;">Grupo não encontrado!</p>
  {/if}
{/if}
{if isset($done)}
  {if $done === 'new_group'}
    <p style="color: green; font-size: 18px;">Grupo criado com sucesso!
</p>
  {elseif $done === 'del_group'}
    <p style="color: green; font-size: 18px;">Grupo apagado com sucesso!</p>
  {elseif $done === 'edit_group'}
    <p style="color: green; font-size: 18px;">O grupo foi modificado com sucesso!</p>
  {/if}
{/if}
<form name="new_group" action="?village={$village.id}&amp;screen=overview_villages&amp;mode=groups&amp;action=new_group" method="post">
  <table class="vis">
    <tr>
      <th>Criar Grupo:</th>
      <td><input type="text" name="group_name" maxlength=35 /></td>
      <td><input type="submit" value="Criar" /></td>
    </tr>
  </table>
</form>
<table class="vis">
  <tr>
    <th width="200">Grupo</th>
    <th width="200">Renomear / Apagar</th>
  </tr>
  {foreach from=$gruppen item=value key=key}
    <form method="post" action="?village={$village.id}&amp;screen=overview_villages&amp;mode=groups&amp;action=edit_group&amp;id={$value.id}" name="edit_group_{$value.id}">
      <tr>
        <td>{$value.name}</td>
        <td>
        <table class="vis">
          <tr>
            <td>
              <table class="vis">
                <tr>
                  <td>
                    <table class="vis">
                      <tr>
                        <th>Renomear:</th>
                        <td><input type="text" name="group_name_{$value.id}" value="{$value.name}" /></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td><input type="checkbox" name="del" />Apagar Grupo</td>
                </tr>
              </table>
            </td>
            <td>
              <input type="submit" name="submit" value="OK" />
          </tr>
        </table>
        </td>
      </tr>
    </form>
  {/foreach}
</table>