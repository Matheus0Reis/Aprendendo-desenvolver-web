<?php

/*
 * Klasse: groups_admin
 */
class groups_admin {
    /*
     * Datenbank-Verbindung
     */
    var $db;
    /*
     * Dateien fuer die Datei-Installation
     */
    var $dateien = array('ally',
                         'barracks',
                         'farm',
                         'garage',
                         'hide',
                         'info_ally',
                         'info_command',
                         'info_member',
                         'info_player',
                         'info_village',
                         'iron',
                         'mail',
                         'main',
                         'map',
                         'market',
                         'memo',
                         'place',
                         'ranking',
                         'recruit_template',
                         'report',
                         'settings',
                         'smith',
                         'snob',
                         'stable',
                         'stone',
                         'storage',
                         'wall',
                         'wood');
    /*
     * In PHP 5 waere das __construct
     */
    function construct($db) {
        $this->db = $db;
    }
    /*
     * Installation Mysql
     */
    function do_mysql_install() {
        $this->db->query("ALTER TABLE `users` ADD `aktu_group` INT NOT NULL DEFAULT '0' AFTER `ennobled_by`");
        $this->db->query("ALTER TABLE `villages` ADD `groups` VARCHAR( 1000 ) NOT NULL AFTER `wall`");
        $this->db->query("CREATE TABLE IF NOT EXISTS `groups` (
                            `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
                            `userid` INT NOT NULL ,
                            `name` VARCHAR( 255 ) NOT NULL
                          ) ENGINE = MYISAM");
        return true;
    }
    /*
     * Deinstallation Mysql
     */
    function do_mysql_uninstall() {
        $this->db->query("DROP TABLE `groups`");
        $this->db->query("ALTER TABLE `users` DROP `aktu_group`");
        $this->db->query("ALTER TABLE `villages` DROP `groups`");
        return true;
    }
    /*
     * Installation Dateien
     */
    function do_datei_install() {
        $plus_content = "\n<?php\ninclude 'actions/groups.php';\n?".">";
        $datei_array = $this->dateien;
        foreach ($datei_array as $key => $value) {
          $dateiname = '../actions/'.$value.'.php';
          if (!$handle = fopen($dateiname, "a")) {
            return false;
          }
          if (!fwrite($handle, $plus_content)) {
            return false;
          }
          fclose($handle);
        }
        return true;
    }
    /*
     * Nur fuer Testzwecke geeignet!!
     */     
    function do_datei_uninstall() {
        $datei_array = $this->dateien;
        foreach ($datei_array as $key => $value) {
          $dateiname = '../actions/'.$value.'.php';
          if (!$handle = fopen($dateiname, "r")) {
            return false;
          }
          $content = fread($handle, filesize($dateiname));
          #$search = "<?php\ninclude 'actions/groups.php';\n?".">";
          #$search = "include 'actions/groups.php';";
          #$search = "\n";
          #$search = "";
          #$search = htmlentities($search);
          $content = str_replace($search, '', $content);
          fclose($handle);
          if (!$handle = fopen($dateiname, "w")) {
            return false;
          }
          if (!fwrite($handle, $content)) {
            return false;
          }
          fclose($handle);
        }
        return true;
    }
    /*
     * Pruefen, ob die Installation schon gemacht wurde
     */     
    function check_install($db) {
        $result = mysql_list_tables($db);
        $num_rows = mysql_num_rows($result);
        for ($i = 0; $i < $num_rows; ++$i) {
            if (mysql_tablename($result, $i) == 'groups') {
              mysql_free_result($result);
              return true;
            }
        }
        mysql_free_result($result);
        return false;
    }
}
/*
 * Klasse starten
 */
$groups_admin = new groups_admin;
$groups_admin->construct($db);
/*
 * Pruefen ob Installation schon gemacht wurde
 */
$install = $groups_admin->check_install($config['db_name']);
$tpl->assign('install', $install);
/*
 * Installation
 */
if (isset($_GET['install'])) {
  if ($install === false) {
    if ($groups_admin->do_mysql_install()) {
      if ($groups_admin->do_datei_install() === true) {
        $tpl->assign('install_done', true);
        $tpl->assign('install', $groups_admin->check_install($config['db_name']));
      }
      else {
        $groups_admin->do_mysql_uninstall();
      }
    }
  }
}
?>