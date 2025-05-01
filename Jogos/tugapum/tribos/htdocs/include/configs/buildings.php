<?php
$cl_builds = new builds();

//////////// Zeitfaktor vom Bau der Geb�ude ////////////

$cl_builds->set_mainfactor("1.00","0.952381");

////////////////// BAUSCHLEIF KOSTEN ///////////////////

$cl_builds->set_buildsharpens("1.25","20");

///////////////////// Alle Geb�ude /////////////////////

$cl_builds->add_build("Edif�cio Principal","main");
$cl_builds->set_woodprice("90","1.26");
$cl_builds->set_stoneprice("80","1.275");
$cl_builds->set_ironprice("70","1.26");
$cl_builds->set_bhprice("0","1.17");
$cl_builds->set_time("1080","1.2");
$cl_builds->set_points("10","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("30");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Edif�cio Principal voc� pode construir ou melhorar outros edif�cios. Quanto maior o n�vel , mais r�pida ser� a constru��o de edif�cios.");

$cl_builds->add_build("Quartel","barracks");
$cl_builds->set_woodprice("200","1.26");
$cl_builds->set_stoneprice("170","1.28");
$cl_builds->set_ironprice("90","1.26");
$cl_builds->set_bhprice("0","1.17");
$cl_builds->set_time("1800","1.2");
$cl_builds->set_points("16","1.2");
$cl_builds->set_needbuilds(array("main"=>"3"));
$cl_builds->set_maxstage("25");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Quartel voc� pode recrutar sua infantaria. Quanto maior o seu n�vel, mais rapidamente poder�o ser recrutadas novas tropas.");

$cl_builds->add_build("Est�bulo","stable");
$cl_builds->set_woodprice("270","1.26");
$cl_builds->set_stoneprice("240","1.28");
$cl_builds->set_ironprice("260","1.26");
$cl_builds->set_bhprice("0","1.17");
$cl_builds->set_time("6000","1.2");
$cl_builds->set_points("20","1.2");
$cl_builds->set_needbuilds(array("main"=>"10","barracks"=>"5","smith"=>"5"));
$cl_builds->set_maxstage("20");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Est�bulo voc� pode formar novos cavaleiros. Quanto maior o seu n�vel, mais rapidamente poder�o ser recrutadas novas tropas.");

$cl_builds->add_build("Oficina","garage");
$cl_builds->set_woodprice("300","1.26");
$cl_builds->set_stoneprice("240","1.28");
$cl_builds->set_ironprice("260","1.26");
$cl_builds->set_bhprice("0","1.16");
$cl_builds->set_time("6000","1.2");
$cl_builds->set_points("24","1.2");
$cl_builds->set_needbuilds(array("main"=>"10","smith"=>"10"));
$cl_builds->set_maxstage("15");
$cl_builds->set_specials(array());
$cl_builds->set_description("Na Oficina podem ser produzidas m�quinas de guerra. Quanto maior for o n�vel da Oficina, mais r�pido ser�o produzidas novas m�quinas.");

$cl_builds->add_build("Academia","snob");
$cl_builds->set_woodprice("15000","2");
$cl_builds->set_stoneprice("25000","2");
$cl_builds->set_ironprice("10000","2");
$cl_builds->set_bhprice("0","1.17");
$cl_builds->set_time("64800","1.2");
$cl_builds->set_points("512","1.2");
$cl_builds->set_needbuilds(array("main"=>"20","smith"=>"20","market"=>"10"));
$cl_builds->set_maxstage("4");
$cl_builds->set_specials(array());
$cl_builds->set_description("Na Academia voc� pode formar Nobres, com os quais poder� conquistar outras aldeias");

$cl_builds->add_build("Ferreiro","smith");
$cl_builds->set_woodprice("220","1.26");
$cl_builds->set_stoneprice("180","1.275");
$cl_builds->set_ironprice("240","1.26");
$cl_builds->set_bhprice("0","1.17");
$cl_builds->set_time("6000","1.2");
$cl_builds->set_points("19","1.2");
$cl_builds->set_needbuilds(array("main"=>"5","barracks"=>"1"));
$cl_builds->set_maxstage("20");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Ferreiro voc� pode pesquisar e melhorar suas armas. Quanto maior o n�vel do Ferreiro melhores ser�o as armas que voc� poder� pesquisar e menores ser�o as dura��es de tais pesquisas.");

$cl_builds->add_build("Pra�a de Reuni�o","place");
$cl_builds->set_woodprice("10","1.2");
$cl_builds->set_stoneprice("40","1.2");
$cl_builds->set_ironprice("30","1.2");
$cl_builds->set_bhprice("0","1.17");
$cl_builds->set_time("2000","1.2");
$cl_builds->set_points("0","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("1");
$cl_builds->set_specials(array());
$cl_builds->set_description("Na Pra�a de Reuni�es encontram-se seus guerreiros antes da batalha. Aqui voc� poder� comandar ataques e mover suas tropas.");

$cl_builds->add_build("Mercado","market");
$cl_builds->set_woodprice("100","1.26");
$cl_builds->set_stoneprice("100","1.275");
$cl_builds->set_ironprice("100","1.26");
$cl_builds->set_bhprice("0","1.17");
$cl_builds->set_time("2700","1.2");
$cl_builds->set_points("10","1.2");
$cl_builds->set_needbuilds(array("main"=>"3","storage"=>"2"));
$cl_builds->set_maxstage("25");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Mercado voc� pode negociar com outros jogadores.");

$cl_builds->add_build("Bosque","wood");
$cl_builds->set_woodprice("50","1.25");
$cl_builds->set_stoneprice("60","1.275");
$cl_builds->set_ironprice("40","1.245");
$cl_builds->set_bhprice("0","1.15");
$cl_builds->set_time("900","1.2");
$cl_builds->set_points("6","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("30");
$cl_builds->set_specials(array());
$cl_builds->set_description("Os lenhadores cortam madeira dos bosques que rodeiam as aldeias. Tal madeira � necess�ria para o desenvolvimento da pr�pria aldeia, assim como para o fortalecimento do ex�rcito. Quanto mais alto o n�vel dos lenhadores, mais madeira ser� produzida.");

$cl_builds->add_build("Po�o de Argila","stone");
$cl_builds->set_woodprice("65","1.27");
$cl_builds->set_stoneprice("50","1.265");
$cl_builds->set_ironprice("40","1.24");
$cl_builds->set_bhprice("0","1.14");
$cl_builds->set_time("900","1.2");
$cl_builds->set_points("6","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("30");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Po�o de Argila trabalham muitos de seus homens afim de prover sua aldeia com a importante argila. Quanto maior for o seu n�vel, maior ser� sua capacidade de produ��o.");

$cl_builds->add_build("Mina de Ferro","iron");
$cl_builds->set_woodprice("75","1.25");
$cl_builds->set_stoneprice("65","1.275");
$cl_builds->set_ironprice("70","1.24");
$cl_builds->set_bhprice("0","1.17");
$cl_builds->set_time("1080","1.2");
$cl_builds->set_points("6","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("30");
$cl_builds->set_specials(array());
$cl_builds->set_description("Da Mina de Ferro � extra�do o material chave para batalhas em TribalSpeeD. Quanto maior for o seu n�vel, maior ser� sua capacidade de produ��o.");

$cl_builds->add_build("Fazenda","farm");
$cl_builds->set_woodprice("45","1.3");
$cl_builds->set_stoneprice("40","1.32");
$cl_builds->set_ironprice("30","1.29");
$cl_builds->set_bhprice("0","1");
$cl_builds->set_time("1440","1.2");
$cl_builds->set_points("5","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("30");
$cl_builds->set_specials(array());
$cl_builds->set_description("A Fazenda prov� sustento � seus trabalhadores e tropas. Sem o desenvolvimento da Fazenda a sua aldeia n�o crescer�. Quanto maior o n�vel da Fazenda, mais habitantes estar�o � sua disposi��o.");

$cl_builds->add_build("Armaz�m","storage");
$cl_builds->set_woodprice("60","1.265");
$cl_builds->set_stoneprice("50","1.27");
$cl_builds->set_ironprice("40","1.245");
$cl_builds->set_bhprice("0","1");
$cl_builds->set_time("1224","1.2");
$cl_builds->set_points("6","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("30");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Armaz�m s�o estocados os recursos produzidos pela aldeia. Quanto maior for o n�vel do Armaz�m, maior ser� a sua capacidade de armazenamento.");

$cl_builds->add_build("Esconderijo","hide");
$cl_builds->set_woodprice("50","1.25");
$cl_builds->set_stoneprice("60","1.25");
$cl_builds->set_ironprice("50","1.25");
$cl_builds->set_bhprice("0","1.20");
$cl_builds->set_time("2160","1.2");
$cl_builds->set_points("5","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("10");
$cl_builds->set_specials(array("catapult_protection"));
$cl_builds->set_description("No Esconderijo s�o escondidos recursos que, em caso de ataque inimigo, n�o poder�o ser roubados. Os Exploradores inimigos tamb�m n�o podem descobrir quantos recursos est�o guardados no Esconderijo.");

$cl_builds->add_build("Muralha","wall");
$cl_builds->set_woodprice("50","1.26");
$cl_builds->set_stoneprice("100","1.275");
$cl_builds->set_ironprice("20","1.26");
$cl_builds->set_bhprice("0","1.18");
$cl_builds->set_time("3600","1.2");
$cl_builds->set_points("8","1.2");
$cl_builds->set_needbuilds(array("barracks"=>"1"));
$cl_builds->set_maxstage("20");
$cl_builds->set_specials(array());
$cl_builds->set_description("A Muralha oferece prote��o contra tropas inimigas. Por meio dela s�o aumentadas tanto a defesa b�sica da aldeia como a for�a defensiva de suas tropas.");

?>
