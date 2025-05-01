<script type="text/javascript">
function set_found_right() {ldelim}
  check_and_disable("lead", gid("found").checked);
  set_lead_right();
{rdelim}

function set_lead_right() {ldelim}
  var checked = gid("lead").checked;
  check_and_disable("invite", checked);
  check_and_disable("diplomacy", checked);
  check_and_disable("mass_mail", checked);
  check_and_disable("forum_mod", checked);
  check_and_disable("internal_forum", checked);
{rdelim}

function check_and_disable(name, check) {ldelim}
  gid(name).disabled = check;
  if(check == true) {ldelim}
    gid(name).checked = check;
  {rdelim}
{rdelim}
</script>

<h3>mudar privilegios do jogador {$rights.username}</h3>
<p>Aqui pode seleccionar as permiss&otilde;es concedidas aos membros de sua tribo.   Para evitar problemas deve conceder permiss&otilde;es de Duque apenas para   jogadores da sua total confian&ccedil;a.</p>
<form action="game.php?village={$village.id}&amp;screen=ally&amp;mode=rights&amp;action=edit_rights&amp;player_id={$rights.id}&amp;h={$hkey}" method="post">

<label>
<h5><input type="checkbox" name="found" id="found" onchange="set_found_right()" {if $rights.ally_found==1}checked="checked"{/if} {if $user.ally_found==0}disabled="disabled"{/if}> <img src="graphic/ally_rights/found.png" alt="Stammesgr&uuml;nder" title="Duque" /> Duque </h5>
</label>
<p>Nomear o jogador Duque da tribo. Ele possuir&aacute; com isso todos os direitos   dentro da tribo, incluindo poder&aacute; dissolver, alterar o nome, mudar a   p&aacute;gina e canal de IRC, administrar o f&oacute;rum interno, editar os direitos   de todos os outros membros e at&eacute; mesmo nomear outros Duques.</p>

<label>
<h5><input type="checkbox" name="lead" id="lead" onchange="set_lead_right()" {if $rights.ally_found==1}disabled="disabled"{/if} {if $rights.ally_lead==1}checked="checked"{/if}> <img src="graphic/ally_rights/lead.png" alt="Stammesführung" title="Barão" /> Bar&atilde;o </h5>
</label>
<p>Os Bar&otilde;es possuem autoridade sobre os membros da tribo, alterar t&iacute;tulos, permiss&otilde;es e inclusive dispensar membros da tribo.</p>

<label>
<h5><input type="checkbox" name="invite" id="invite" {if $rights.ally_found==1 || $rights.ally_lead==1}disabled="disabled"{/if} {if $rights.ally_invite==1}checked="checked"{/if}> <img src="graphic/ally_rights/invite.png" alt="Einladen" title="Convidar" />Convidar</h5>
</label>
<p>O jogador pode convidar outros jogadores para a tribo.</p>

<label>
<h5><input type="checkbox" name="diplomacy" id="diplomacy" {if $rights.ally_found==1 || $rights.ally_lead==1}disabled="disabled"{/if} {if $rights.ally_diplomacy==1}checked="checked"{/if}> <img src="graphic/ally_rights/diplomacy.png" alt="Diplomatie" title="Diplomacia" /> Diplomacia</h5>
</label>
<p>Este privil&eacute;gio permite alterar o perfil da tribo, assim como alian&ccedil;as, PNAs e Inimigos.</p>

<label>
<h5><input type="checkbox" name="mass_mail" id="mass_mail" {if $rights.ally_found==1 || $rights.ally_lead==1}disabled="disabled"{/if} {if $rights.ally_mass_mail==1}checked="checked"{/if}> <img src="graphic/ally_rights/mass_mail.png" alt="Rundschreiben" title="Circular" /> Circular </h5>
</label>
<p>O jogador pode enviar mensagens a todos os membros da tribo.</p>

<h3>T&iacute;tulo</h3>
<p>T&iacute;tulo na tribo: 
  <input type="text" name="title" maxlength="24" value="{$rights.ally_titel}"></p>
<p><input type="submit" value="OK"></p>
</form>