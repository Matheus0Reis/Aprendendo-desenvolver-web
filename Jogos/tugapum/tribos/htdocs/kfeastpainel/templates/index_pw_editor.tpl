<h2>Passwort &auml;ndern leicht gemacht!<div align="right"><i><font size="1">Tool by knollenmax</font></div></i></h2><br><br>
<form action="index.php?screen=pw_editor&amp;action=edit" method="Post">
1. Gib hier dein Passwort ein, welches du gerne haben m&ouml;chtest: <font size="2" color="red"><i>ACHTUNG! Wenn du das Feld leer l&auml;sst, wird das Passwort auch in "" (nichts) ge&auml;ndert.</i></font><br>
<input type="text" name="new_pw"><br><br>

2. W&auml;hle hier den Spieler, von dem das Passwort ge&auml;ndert werden soll:<br>
    <select name="player" size="5">
{php}
$verbindung = mysql_connect ("localhost",
"root", "");

mysql_select_db("lan");

$sql = "SELECT username FROM users";
$query = mysql_query($sql);
while($result = mysql_fetch_object($query))
   {
   echo "<option>$result->username</option>";
   }

{/php}

    </select><br><br>

    3. Klicke nun auf "&Auml;ndern"... ;-)<br>
    <input type="submit" value="&Auml;ndern">
    </form><br><br><h3>

{php}
$action = $_GET["action"];

if($action=='edit')
{
$new_pw = $_POST["new_pw"];
$username = $_POST["player"];

if($username == "")
{ echo "<font color=\"red\">Bitte das Feld \"Benutzer\" ausf&uuml;llen!</font><br><br>"; }
else
{
$new_pw = md5($new_pw);

$update = "UPDATE users Set password = '$new_pw' WHERE username = '$username'";
$query = mysql_query($update);

if($query == true)
{ echo "<font color=\"green\"><i>Erfolgreich ge&auml;ndert!</i></font>"; }
else
{ echo "<font color=\"red\">Fehler beim &auml;ndern... :-(</font>";}
}
}

{/php}
</h3>