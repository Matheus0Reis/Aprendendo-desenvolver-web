<h3>Logins</h3>
<p> Nesta p&aacute;gina pode visualizar os acessos e tentativas de acesso &agrave; sua conta. Caso detecte alguma actividade n&atilde;o autorizada na sua conta, mude imediatamente sua palavra-chave. O seu IP normalmente altera-se com cada acesso &agrave; internet. </p>

<h4>&Uacute;ltimos 20 logins </h4>
<table class="vis">
<tr><th>Data</th><th>IP</th><th>Sitter</th></tr>
{foreach from=$logins item=arr key=id}
	<tr>
	  <td>

{php}
$data_terminare=$this->_tpl_vars['arr']['time'];
$data_terminare = str_replace("heute um","hoje &aacute;s ",$data_terminare);
$data_terminare = str_replace("Uhr","",$data_terminare);
$data_terminare = str_replace("am","Dia",$data_terminare);
$data_terminare = str_replace("um","&aacute;s",$data_terminare);
$data_terminare = str_replace("morgen","maine",$data_terminare);
//Variabila originala tpl: {$arr.time}

echo $data_terminare;

{/php}</td>
	  <td>{$arr.ip}</td><td>{$arr.uv}</td></tr>
{/foreach}

</table>
