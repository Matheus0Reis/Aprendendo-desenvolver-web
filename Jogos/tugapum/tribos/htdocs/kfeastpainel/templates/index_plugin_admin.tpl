<!-- 
This ds-lan extension was written by Alexander Thiemann
Visit me: www.agrafix.net
Mail  me: mail@agrafix.net
-->
<h2>Plugin Admin</h2>

{if !empty($action_text)}
<h3>Aktion</h3>
{$action_text}
{/if}

<h3>Installations Datei</h3>
<form action="index.php?screen=plugin_admin" method="post" enctype="multipart/form-data">
<input type="file" name="filen" style="border:1px solid #804000;background-color:#F8F4E8;padding:3px;" /><br />
<input type="submit" name="upload" value="Installieren / Updaten" style="text-align:center;border:2px solid #804000;background-color:#F8F4E8;padding:3px;" /> 
</form>

<h3>Installations Code</h3>
<form action="index.php?screen=plugin_admin" method="post">
<textarea name="input" style="width:90%;height:70%;border:1px solid #804000;background-color:#F8F4E8;padding:3px;"></textarea><br />
<input type="submit" value="Installieren / Updaten" style="text-align:center;border:2px solid #804000;background-color:#F8F4E8;padding:3px;" /> 
</form>


{literal}
<script type="text/javascript">
/**
 * DO NOT REMOVE THIS
 */
 
window.onload = _init_agrafix;

function _init_agrafix() { 
	 var st = document.getElementById("serverTime");
	 var parentP = st.parentNode;
	 
	 parentP.innerHTML = "<a href='http://www.agrafix.net' target='_blank'>Plugin Admin Erweiterung v1.0 von agrafix.net</a><br /> " + parentP.innerHTML;
}
</script>
{/literal}
<!--
End of Extension
-->