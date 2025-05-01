<?php

 /*
  * easyEnoblements
  * 
  * This class allows the user to set the agreement of an village to 1, so it
  * can be enobled easily.
  * 
  * @author pL4n3
  * @copyright pL4n3
  * @version 0.1              
  */
 class easyEnoblements
 {
    
    /*
     * updateAgreement
     * 
     * This method updates the table `villages` and sets the agreement to 3
     * when the village is a left village.
     * 
     * @return void;
     */
    function updateAgreement() {
        $db = new DB_MySql;
        $db->connect("localhost", "root", "", "lan");
        $db->query("UPDATE `villages` SET agreement = 0 WHERE userid = -1") OR die(mysql_error()); 
    }                              
 }
 
$easy = new easyEnoblements;
$easy->updateAgreement();

$tpl->assign("action", $_GET['action']);
?>