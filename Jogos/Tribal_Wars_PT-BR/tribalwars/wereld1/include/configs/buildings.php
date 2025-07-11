<?php
$cl_builds = new builds();
$cl_builds->set_mainfactor("1.00","0.952381");
$cl_builds->set_buildsharpens("1.25","20");

$cl_builds->add_build("Prédio Principal", "main");
$cl_builds->set_woodprice("90","1.26");
$cl_builds->set_stoneprice("80","1.275");
$cl_builds->set_ironprice("70","1.26");
$cl_builds->set_bhprice("5","1.17");
$cl_builds->set_time("1080","1.2");
$cl_builds->set_points("10","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("30");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Edifício Principal você pode construir ou melhorar outros edifícios. Quanto maior o nível, mais rápida será a construção de edifícios.");
$cl_builds->set_graphicCoords("373,187,417,129,407,72,329,65,306,99,311,150");

$cl_builds->add_build("Quartel", "barracks");
$cl_builds->set_woodprice("200","1.26");
$cl_builds->set_stoneprice("170","1.28");
$cl_builds->set_ironprice("90","1.26");
$cl_builds->set_bhprice("7","1.17");
$cl_builds->set_time("1800","1.2");
$cl_builds->set_points("16","1.2");
$cl_builds->set_needbuilds(array("main"=>"3"));
$cl_builds->set_maxstage("25");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Quartel você pode recrutar sua infantaria. Quanto maior o seu nível, mais rapidamente poderão ser recrutadas novas tropas.");
$cl_builds->set_graphicCoords("392,289,444,313,506,283,481,235,442,216,392,252");

$cl_builds->add_build("Estábulo","stable");
$cl_builds->set_woodprice("270","1.26");
$cl_builds->set_stoneprice("240","1.28");
$cl_builds->set_ironprice("260","1.26");
$cl_builds->set_bhprice("8","1.17");
$cl_builds->set_time("6000","1.2");
$cl_builds->set_points("20","1.2");
$cl_builds->set_needbuilds(array("main"=>"10","barracks"=>"5","smith"=>"5"));
$cl_builds->set_maxstage("20");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Estábulo você pode formar novos cavaleiros. Quanto maior o seu nível, mais rapidamente poderão ser recrutadas novas tropas.");
$cl_builds->set_graphicCoords("64,241,70,265,150,307,189,289,184,232,99,202");

$cl_builds->add_build("Oficina", "garage");
$cl_builds->set_woodprice("300","1.26");
$cl_builds->set_stoneprice("240","1.28");
$cl_builds->set_ironprice("260","1.26");
$cl_builds->set_bhprice("8","1.16");
$cl_builds->set_time("6000","1.2");
$cl_builds->set_points("24","1.2");
$cl_builds->set_needbuilds(array("main"=>"10","smith"=>"10"));
$cl_builds->set_maxstage("15");
$cl_builds->set_specials(array());
$cl_builds->set_description("Na Oficina podem ser produzidas máquinas de guerra. Quanto maior for o nível da Oficina, mais rápido serão produzidas novas máquinas.");
$cl_builds->set_graphicCoords("284,358,362,361,402,321,369,283,346,278,291,320");

$cl_builds->add_build("Academia", "snob");
$cl_builds->set_woodprice("15000","2");
$cl_builds->set_stoneprice("25000","2");
$cl_builds->set_ironprice("10000","2");
$cl_builds->set_bhprice("80","1.17");
$cl_builds->set_time("64800","1.2");
$cl_builds->set_points("512","1.2");
$cl_builds->set_needbuilds(array("main"=>"20","smith"=>"20","market"=>"10"));
$cl_builds->set_maxstage("3");
$cl_builds->set_specials(array());
$cl_builds->set_description("Na Academia você pode formar Nobres, com os quais poderá conquistar outras aldeias.");
$cl_builds->set_graphicCoords("206,149,257,125,229,60,185,80,156,111");

$cl_builds->add_build("Ferreiro","smith");
$cl_builds->set_woodprice("220","1.26");
$cl_builds->set_stoneprice("180","1.275");
$cl_builds->set_ironprice("240","1.26");
$cl_builds->set_bhprice("40","1.17");
$cl_builds->set_time("6000","1.2");
$cl_builds->set_points("19","1.2");
$cl_builds->set_needbuilds(array("main"=>"5","barracks"=>"1"));
$cl_builds->set_maxstage("20");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Ferreiro você pode pesquisar e melhorar suas armas. Quanto maior o nível do Ferreiro melhores serão as armas que você poderá pesquisar e menores serão as durações de tais pesquisas. O número total de pesquisas é limitado.");
$cl_builds->set_graphicCoords("174,335,222,361,271,342,283,301,216,262");


$cl_builds->add_build("Estátua","statue");
$cl_builds->set_woodprice("220","1");
$cl_builds->set_stoneprice("220","1");
$cl_builds->set_ironprice("220","1");
$cl_builds->set_bhprice("10","1");
$cl_builds->set_time("600","1");
$cl_builds->set_points("24","1");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("1");
$cl_builds->set_specials(array());
$cl_builds->set_description("Perante a est&aacute;tua os habitantes de sua aldeia oferecer&atilde;o homenagens ao seu paladino. Caso o paladino morra voc&ecirc; poder&aacute; apontar outro guerreiro como novo paladino.");
$cl_builds->set_graphicCoords("277,231,256,265,266,285,292,287,306,266");


$cl_builds->add_build("Praça","place");
$cl_builds->set_woodprice("10","1.2");
$cl_builds->set_stoneprice("40","1.2");
$cl_builds->set_ironprice("30","1.2");
$cl_builds->set_bhprice("0","1.17");
$cl_builds->set_time("2000","1.2");
$cl_builds->set_points("0","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("1");
$cl_builds->set_specials(array());
$cl_builds->set_description("Na Praça de Reuniões encontram-se seus guerreiros antes da batalha. Aqui você poderá comandar ataques e mover suas tropas.");
$cl_builds->set_graphicCoords("315,271,379,275,401,229,375,206,343,207");

$cl_builds->add_build("Mercado","market");
$cl_builds->set_woodprice("100","1.26");
$cl_builds->set_stoneprice("100","1.275");
$cl_builds->set_ironprice("100","1.26");
$cl_builds->set_bhprice("20","1.17");
$cl_builds->set_time("2700","1.2");
$cl_builds->set_points("10","1.2");
$cl_builds->set_needbuilds(array("main"=>"3","storage"=>"2"));
$cl_builds->set_maxstage("25");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Mercado você pode negociar com outros jogadores.");
$cl_builds->set_graphicCoords("214,149,234,228,313,230,330,169,273,122");

$cl_builds->add_build("Bosque","wood");
$cl_builds->set_woodprice("50","1.25");
$cl_builds->set_stoneprice("60","1.275");
$cl_builds->set_ironprice("40","1.245");
$cl_builds->set_bhprice("5","1.15");
$cl_builds->set_time("900","1.2");
$cl_builds->set_points("6","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("30");
$cl_builds->set_specials(array());
$cl_builds->set_description("Os lenhadores cortam madeira dos bosques que rodeiam as aldeias. Tal madeira é necessária para o desenvolvimento da própria aldeia, assim como para o fortalecimento do exército. Quanto mais alto o nível dos lenhadores, mais madeira será produzida.");
$cl_builds->set_graphicCoords("472,379,523,417,583,373,528,330");

$cl_builds->add_build("Poço de Argila","stone");
$cl_builds->set_woodprice("65","1.27");
$cl_builds->set_stoneprice("50","1.265");
$cl_builds->set_ironprice("40","1.24");
$cl_builds->set_bhprice("10","1.14");
$cl_builds->set_time("900","1.2");
$cl_builds->set_points("6","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("30");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Poço de Argila trabalham muitos de seus homens afim de prover sua aldeia com a importante argila. Quanto maior for o seu nível, maior será sua capacidade de produção.");
$cl_builds->set_graphicCoords("34,300,0,349,15,399,67,417,91,402,92,341");

$cl_builds->add_build("Mina de Ferro","iron");
$cl_builds->set_woodprice("75","1.25");
$cl_builds->set_stoneprice("65","1.275");
$cl_builds->set_ironprice("70","1.24");
$cl_builds->set_bhprice("10","1.17");
$cl_builds->set_time("1080","1.2");
$cl_builds->set_points("6","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("30");
$cl_builds->set_specials(array());
$cl_builds->set_description("Da Mina de Ferro é extraído o material chave para as batalhas. Quanto maior for o seu nível, maior será sua capacidade de produção.");
$cl_builds->set_graphicCoords("0,55,45,90,93,58,89,6,39,9");

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
$cl_builds->set_description("A Fazenda provê sustento à seus trabalhadores e tropas. Sem o desenvolvimento da Fazenda a sua aldeia não crescerá. Quanto maior o nível da Fazenda, mais habitantes estarão à sua disposição.");
$cl_builds->set_graphicCoords("456,0,477,41,526,75,583,88,597,18,597,0");

$cl_builds->add_build("Armazém","storage");
$cl_builds->set_woodprice("60","1.265");
$cl_builds->set_stoneprice("50","1.27");
$cl_builds->set_ironprice("40","1.245");
$cl_builds->set_bhprice("0","1");
$cl_builds->set_time("1224","1.2");
$cl_builds->set_points("6","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("30");
$cl_builds->set_specials(array());
$cl_builds->set_description("No Armazém são estocados os recursos produzidos pela aldeia. Quanto maior for o nível do Armazém, maior será a sua capacidade de armazenamento.");
$cl_builds->set_graphicCoords("96,192,153,218,195,215,193,148,133,121");

$cl_builds->add_build("Esconderijo","hide");
$cl_builds->set_woodprice("50","1.25");
$cl_builds->set_stoneprice("60","1.25");
$cl_builds->set_ironprice("50","1.25");
$cl_builds->set_bhprice("2","1.20");
$cl_builds->set_time("2160","1.2");
$cl_builds->set_points("5","1.2");
$cl_builds->set_needbuilds(array());
$cl_builds->set_maxstage("10");
$cl_builds->set_specials(array("catapult_protection"));
$cl_builds->set_description("No Esconderijo são escondidos recursos que, em caso de ataque inimigo, não poderão ser roubados. Os Exploradores inimigos também não podem descobrir quantos recursos estão guardados no Esconderijo.");
$cl_builds->set_graphicCoords("241,80,261,113,294,93,268,63");

$cl_builds->add_build("Muralha","wall");
$cl_builds->set_woodprice("50","1.26");
$cl_builds->set_stoneprice("100","1.275");
$cl_builds->set_ironprice("20","1.26");
$cl_builds->set_bhprice("5","1.18");
$cl_builds->set_time("3600","1.2");
$cl_builds->set_points("8","1.2");
$cl_builds->set_needbuilds(array("barracks"=>"1"));
$cl_builds->set_maxstage("20");
$cl_builds->set_specials(array());
$cl_builds->set_description("A Muralha oferece proteção contra tropas inimigas. Por meio dela são aumentadas tanto a defesa básica da aldeia como a força defensiva de suas tropas.");
$cl_builds->set_graphicCoords("428,333,430,382,472,363,470,318");
?>