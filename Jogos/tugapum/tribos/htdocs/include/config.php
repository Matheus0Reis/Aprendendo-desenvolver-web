<?php

/*******************************************/
/*********** KONFIGURATIONSDATEI ***********/
/******* von Die-Staemme Lan Version *******/
/*********** by Thomas Maninger ************/
/********** (Ingame: DBGTMaster) ***********/
/*******************************************/

/**********************************************************

Es wird empfohlen, während des laufen der Runde möglichst
keine Einstellungen in der Konfigurationsdatei zu verändern,
da ansonsten kein 100% funktionsfreies laufen der aktuellen
Runde garantiert werden kann.
Einstellungen des Speedes, Einheitengeschwindigkeit können
aber jederzeit geändert werden.

**********************************************************/ 

// Datenbankverbindung:
$config['db_host'] = 'localhost';
$config['db_user'] = 'root';
$config['db_pw'] = 'kfeastkingxpto';
$config['db_name'] = 'lan';

// Passwort für Administration
$config['master_pw'] = 'kfeastpainel';

// Spielegeschwindigkeit, je höher, desto schneller läuft das Spiel
$config['speed'] = 1600;

// ADDED
/*$steig = "4"; // Alle 5 Sekunden
$start = 1183404063;	// Time to start
$end = 3000;		// Bei wie viel Speed aufh�ren zu steigen?
$more = round((time()-$start)/$steig);
$config['speed'] += $more;
if ($config['speed']>$end) {
	$config['speed'] = 83500;
}*/
////////

// Welches MAP Design soll verwendet werden?
// 0 => Das alte Design
// 1 => Das neue Design
$config['map_design'] = 1;

// Nach wie vielen Dörfern soll immer ein Flüchtlingslager erstellt werden?
// Mit der Angabe "-1" werden keine Flüchtlingslager automatisch erstellt.
$config['count_create_left'] = 6;

// Wie viel Dörfer muss ein Spieler mindestens haben? Wenn z.b.: nun die Zahl
// 5 angegegen wird, so hat der Spieler am Start sofort 5 Dörfer. Sollte er
// eines verlieren, so bekommt er ein 5 wieder dazu!
// Nicht den Wert "0" verwenden!
// übertreibt bitte nicht mit "4000" oder sonst was, da der erste Login
// ansonsten ewig dauert!
$config['min_villages'] = 1;

// ACHTUNG: Diese Einstellung wird erst wirksam, wenn in der Administration ein Reset
// oder Softreset durchgeführt wird.
$config['map_incircle'] = 0;

// Was für einen Namen haben automatisch erstellte Flüchtlingslager?
$config['left_name'] = 'Aldeia abandonada';

// Soll man beim erstellen eines neues Dorfes die Himmelsrichtung aussuchen d�rfen?
// true oder false
$config['village_choose_direction'] = 1;

// Grundverteidiung von jedem Dorf.
$config['reason_defense'] = 50;

// Was für ein Faktor gilt bei Späher? Der Wert "2" beudetet: Wenn der Verteidiger 2x
// mehr Späher als der Angreifer hat, so sterben alle Späher des Angreifers
// (Verhältnis 2:1). Bei Wert "3" ist es dann ein Verhältnis "3:1" und beudetet, dass
// der Verteidiger drei fach mehr Späher braucht, damit der Angreifer alle Späher verliert.
$config['factor_spy'] = 3;

// Bis nach wie vielen Minuten kann ein Angriff / Unterstützung abgebrochen werden?
// ACHTUNG: Dieser Wert ist nicht Speedabhändig! Dass heißt, bei 10 Minuten 
// Abbruchszeit sind es bei einer Spielegeschwindigkeit von 300 immer noch 10 Minuten!
$config['cancel_movement'] = 1;

// Geschwindigkeit der Einheiten. Je kleiner der Wert ist, desto langsamer werden die
// Einheiten. Normalgeschwindigkeit hat den Wert "1".
$config['movement_speed'] = 0.09;

// Soll die Moral aktiv sein oder nicht???
// true => Moral ist aktiv
// false => Moral ist nicht aktiv
$config['moral_activ'] = 1;

// Bis wie viel % darf die Moral maximal sinken?? Der Standartwert ist 35%. Als wert
// bloss die Zahl angeben ohne die das "%" Zeichen!
$config['min_moral'] = 35;

// Um wie viel Zustimmung soll die Zustimmung pro Stunde steigen? Der Standartwert
// ist 1! Um so kleiner die Zahl, desto langsamer steigst die Zustimmung! (z.B.: 0.5)
$config['agreement_per_hour'] = 0.005;

// Wie viel Minuten gilt der Anfängerschutz für ein neues Dorf? Wenn es keinen
// Anfängerschutz geben soll, dann den Wert -1 eingeben.
$config['noob_protection'] = -1;

// Wie viel Minuten brauchen die Händler pro Feld?
$config['dealer_time'] = 5;

// Bis nach wie vielen Minuten können die Händler abgebrochen werden?
// ACHTUNG: Dieser Wert ist nicht Speedabhändig! Dass heißt, bei 5 Minuten 
// Abbruchszeit sind es bei einer Spielegeschwindigkeit von 300 immer noch 5 Minuten!
$config['cancel_dealers'] = 1;

// Welche AG Style soll verwendet werden?
// 0 => pro Dorf können so viele AGs gebaut werden, so hoch wie der Adelshof ist (S1)
// 1 => Es können so viele AGs gebaut werden, so hoch die Summe aller Adelshöfer ist (SDS)
$config['ag_style'] = 1;

// Bauernhof Style:
// 0 => Wenn der Bauernhof bist Stufe 30 ausgebaut ist, so ist geht er bis 22782 (S1).
// 1 => Wenn der Bauernhof bist Stufe 30 ausgebaut ist, so ist geht er bis 24000 (SDS)
$config['bh_style'] = 1;

// Können Staemme erstellt werden?
// true => JA
// false => NEIN
$config['create_ally'] = 1;

// Können Staemme verlassen / Spieler entlassen / Spieler eingeladen werden?
// true => JA
// false => NEIN
$config['leave_ally'] = 1;

// Können Staemme aufgelöst werden?
// true => JA
// false => NEIN
$config['close_ally'] = 1;

// Es kann eingestellt werden, dass es x fixe Staemme gibt, bei dennen automatisch
// Spieler zugeordnert werden. Beim ersten Login wird jeder Spieler einen Stamm zugeordnet!
// Es wird empfohlen, dass Auflösen, beitreten,... von Staemmen zu deaktivieren! Die Staemme
// m�ssen davor erstellt werden!
// Funktion aktivieren?
// true => JA
// false => NEIN
$config['auto_ally'] = 0;

// Wenn dieser Wert auf true ist, dann können im Spiel keine Aktionen ausgeführt werden.
// Dies dient zum Beispiel dazu, wenn irgendwelche Vorbereitungen gemacht werden müssen
// und niemand etwas bauen etc. soll. Stämme können aber trotzdem erstellt werden!
$config['no_actions'] = 0;

// Wenn dieser Wert auf true ist, können keine weiteren Dörfer erstellt werden. Auch wenn
// ein Spieler aufgeadelt wird, kann er keine weiteren Dörfer erstellen.
$config['not_more_villages'] = 0;

// Soll es eine IP Beschränkung geben?
$config['ip_control'] = 0;

// Welche Netzwerk IPs dürfen auf die LAN zugreifen? Diese Option ist nur relevant, wenn
// $config['ip_control'] auf "true" gestellt ist.
$allow_ips[] = "192.168.0.1";
$allow_ips[] = "192.168.0.2";
$allow_ips[] = "192.168.0.3";
$allow_ips[] = "192.168.0.4";

/*Schnellleiste
 * Nach wie vielen Einträgen soll in der Schnellleiste ein Umbruch erfolgen?
*/
$config['quickbar'] = '10';

// Zustimmung: Um wie viel soll sie maximal sinken?
$config['agreement_max'] = '35';

// Zustimmung: Um wie viel soll sie minimal sinken?
$config['agreement_min'] = '20';
?>
