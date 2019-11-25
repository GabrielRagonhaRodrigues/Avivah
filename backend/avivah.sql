drop database if exists avivah;
create database if not exists avivah;

use avivah;

drop table if exists employies;
create table employies (
	idEmployee int not null primary key auto_increment,
   	nameEmployee varchar(80) not null,
  	sexEmployee enum ("Masculino", "Feminino", "Outro") not null,
   	maritalStateEmployee enum ("Solteiro", "Casado", "Viúvo", "Separado", "Divorciado", "Amasiado") not null,
   	dateBornEmployee date not null,
   	nacionalityEmployee varchar(50) not null,
   	cepEmployee int(8) null,
   	stateEmployee varchar(80) not null,
   	cityEmployee varchar(80) not null,
   	neighborhoodEmployee varchar(80) not null,
   	streetEmployee varchar(80) not null,
   	numberHouseEmployee smallint not null,
   	adjunctEmployee text null,
   	cpfEmployee char(12) not null unique,
   	telephoneEmployee char(12) null,
   	telephone2Employee char(12) null,
   	cellphoneEmployee char(13) not null,
   	cellphone2Employee char(13) null,
   	emailEmployee varchar(100) not null unique,
   	email2Employee varchar(100) null,
   	username varchar(40) not null unique,
	password varchar(32) not null,
	idAccess set ("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15") null,
	idManager int null,
	foreign key (idManager) references manager (idManager)
	);

drop table if exists manager;
create table manager(
	idManager int primary key not null
	);

drop table if exists products;
create table products (
	idProduct int not null primary key auto_increment,
	quantityProduct int not null,
	priceProduct decimal(6,2) not null,
	nameProduct varchar(100) not null,
	descriptionProduct text not null,
	typeProduct set("Casa", "Cama", "Mesa", "Banho") not null,
	colorProduct set("Azul", "Amarelo", "Vermelho", "Verde", "Roxo", "Rosa", "Marrom", "Branco", "Preto", "Cinza", "Laranja", "Bege") not null,
	sizeProduct set ("Pequeno", "Médio", "Grande") null,
	deliveryProduct varchar(60) not null,
	compositionProduct text not null,
	brandProduct varchar(50) not null,
    idProvider int not null,
    foreign key (idProvider) references providers (idProvider)
   	);


drop table if exists providers;
create table providers (
	idProvider int primary key auto_increment,
	countryProvider varchar(50) not null,
	stateProvider varchar(80) not null,
	cityProvider varchar(80) not null,
	cepProvider varchar(8) null,
	neighborhoodProvider varchar(80) not null,
	streetProvider varchar(80) not null,
	numberPlace smallint not null,
	telephoneProvider char(12) not null,
	telephone2Provider char(12) null,
	cellphoneProvider char(13) null,
	cellphone2Provider char(13) null,
	username varchar(40) not null unique,
	password varchar(32) not null,
	idProduct int default null,
	foreign key (idProduct) references products (idProducts),
	quantityProvider int not null,
	priceProductProvider decimal(6,2) not null,
	nameProvider varchar(80) not null,
	numberWorkBook varchar(12) not null,
	baseAccountUF varchar(2) not null,
	codEstabilishment varchar(14) not null,
	accountFGTS varchar(11) not null,
	typeAccountFGTS varchar(30) not null,
	situationAccount varchar(1) not null,
	dateAdmissionFGTS date not null,
	pisPasep varchar(11) not null
   	);


drop table if exists branch;
create table branch (
	idBranch int not null primary key auto_increment,
	cepBranch int(10) null,
   	stateBranch varchar(80) not null,
   	cityBranch varchar(80) not null,
   	neighborhoodBranch varchar(80) not null,
   	streetBranch varchar(80) not null,
   	numberBranch smallint not null
	);


create table sector (
	idSector int not null primary key,
	nomeSector varchar(50) not null,
	idBranch int not null,
	idManager int null,
	foreign key (idManager) references manager,
	foreign key (idBranch) references branch (idBranch)
	);


drop table if exists users;
create table users (
	idUser int not null primary key auto_increment,
	nameUser varchar(80) not null,    	
	sexUser enum ("Masculino", "Feminino", "Outro") not null,
   	dateBornUser date not null,
   	cepUser int(8) null,
   	stateUser varchar(80) not null,
   	cityUser varchar(80) not null,
   	neighborhoodUser varchar(80) not null,
   	streetUser varchar(80) not null,
   	numberHouseUser smallint not null,
   	adjunctUser text null,
   	cpfUser char(15) not null unique,
   	telephoneUser char(12) null,
   	telephone2User char(12) null,
   	cellphoneUser char(13) not null,
   	cellphone2User char(13) null,
   	emailUser varchar(100) not null unique,
    email2User varchar(100) null,
    username varchar(40) not null unique,
	password varchar(32) not null,
	idAccess set ('1', '2', '3', '4', '5', '6', '7', '8', '9', "10", "11", "12", "13", "14", "15") null
	);





insert into employies (nameEmployee, sexEmployee, maritalStateEmployee, dateBornEmployee, nacionalityEmployee, cepEmployee, stateEmployee, cityEmployee, neighborhoodEmployee, streetEmployee, numberHouseEmployee, adjunctEmployee, cpfEmployee, telephoneEmployee, telephone2Employee, cellphoneEmployee, cellphone2Employee, emailEmployee, email2Employee,username, password, idAccess, idManager) values


("Gabriel Cesar Ragonha Rodrigues", "Masculino", "Solteiro", "2000/04/06", "Brasileiro", "17517184", "São Paulo", "Marília", "Maria Antonia", "Antonio Carlos", "155", "", "12345678910", "551434336699", "", "5514996996969", "", "gabrielzinholl@hotmail.com", "gabrielzinnnnnn@outlook.com","gcrr10", "bielzinho10", "1", 1),

("Nicolas Florêncio Alves", "Masculino", "Solteiro", "2000/10/10", "Brasileiro", "17212060", "São Paulo", "Marília", "Villa Barros", "Agostinho da Silva", "42", "Vermeião, Ap. 122, Bloco 3a, 3º Andar", "10987654321", "551434323036", "", "5514999999999", "", "nikito32@hotmail.com", "nikitinho12@outlook.com","nikitoomega", "coxinhaxxx", "1", 2),

("Joaby Civirino Oliveira Santos", "Masculino", "Solteiro", "1999/03/28", "Indiano", "17374727", "Minas Gerais", "Belo Horizonte", "Carlinho Gomes", "Jujuliette", "255", "", "10987645321", "553132434332", "", "5531994473559", "", "civirino100210@hotmail.com", "civirinopepino31Indialove@outlook.com","xxjobsxx", "boladassonograu315", "1", 3),

("Adrian Wilmer Jaquier", "Masculino", "Solteiro", "2004/03/12", "Frances", "17522865", "São Paulo", "Marília", "Joquéi", "Particular", "500", "", "43300744444", "", "", "5514998664076", "", "adrian.jaquier@etec.sp.gov.br", "","anaozinhoqzs015", "brotanagrade", '1', 4),

("Leonardo Augusto Secco Galindo", "Outro", "Amasiado", "1985/09/26", "Brasileiro", "17518184", "São Paulo", "Marília", "Argolo Phiccão", "Joaquim de Oliveira Pinto", "69", "", "54254545215", "551434316699", "551411111111", "5514996996968", "", "leozinhoseccaotetec@hotmail.com", " ", "leozin12", "fpsVida", '3', 2),

("Matheus Gabriel e Silva", "Outro", "Casado", "1971/02/19", "Polones", "17511114", "Acre", "Rio Branco", "Parque dos Dinossauros", "Mama Brusccuueta", "555", "", "12345008910", "556834334499", "", "5568996006969", "", "Matheuzinqzn@hotmail.com", "", "desenhado", "animezin", '2', 1),

("Giovana Caires Ramos", "Feminino", "Solteiro", "1999/01/16", "Brasileiro", "17510004", "São Paulo", "Marília", "Maria Antonia", "Antonio Carlos", "115", "", "12345687901", "551434106699", "", "5514996990169", "", "gigiovana@hotmail.com", "", "otome002", "gege02", '1', 3),

("Pedro Henrique Silva Forti", "Masculino", "Viúvo", "1995/10/10", "Brasileiro", "17017184", "São Paulo", "Marília", "Antonio Lurdin", "Rodrimenti Casir", "999", "", "12345699910", "551434399699", "", "5514996776969", "", "Pedrinhohoho@hotmail.com", "bikeforti@yahoo.com", "bikelife", "aro17", '3', 4),

("Kaique de Queiroz Souza", "Masculino", "Casado", "2003/08/21", "Canadense", "17514484", "São Paulo", "Marília", "Palmital", "Aparecidinha Desaparecida", "92", "", "53765678910", "551488888888", "", "5514997621326", "", "kaiquinhoCone@yahoo.com", "kaiqueluck@outlook.com", "HARDLIFE_do_cone", "arduinotetec", '1', 5),

("João Vitor Clemente Tabom", "Feminino", "Amasiado", "1995/09/11", "Marroquino", "51517184", "Tocantins", "Palmas", "Burguesinho Afro", "Nelson Mandelão", "10", "", "77347778910", "556377776699", "", "556399786269", "", "ClemEntInoAtleta@hotmail.com", "CleMenTinOESPORTISTINHA@outlook.com","hwat", "motivospessoaish", '3', 7),

("Matheus Henrique dos Santos Sousa", "Outro", "Solteiro", "2003/12/13", "Brasileiro", "17500184", "São Paulo", "Marília", "Villa Barros", "Monte do Negão", "669", "", "1234500010", "551440028922", "", "5514996737373", "", "legalferaquerbiscoito@hotmail.com", "", "mateuzin", "yugiohRPG", '3', 5),

("João Vitor Nascimento Gomes", "Masculino", "Solteiro", "2004/03/10", "Brasileiro", "10000184", "São Paulo", "Marília", "Florenza", "Augusta Afonso", "17", "", "1230000010", "", "", "5514991721618", "", "jVitorNGomess@gmail.com", "joao.gomes140@etec.sp.gov.br", "homiforte", "frangofraco", "1", 5),

("Henrique Queiróz de Paula", "Outro", "Amasiado", "2004/04/04", "Sul Africano", "88990184", "Paraná", "Curitiba", "Montes Negros", "Caixinhas Do Sul", "314", "", "1234500000", "554164873432", "", "5541997243281", "", "rik.qPaula@hotmail.com", "", "lolchallenger", "smurfdebronze", '1', 8),

("Cesar Augusto de Almeida", "Masculino", "Solteiro", "2003/11/10", "Brasileiro", "17500111", "São Paulo", "Padre Nobrega", "Marakaka", "Fim do Mundo", "169", "", "1236600010", "", "", "551499697826", "", "ceesaraugusto@outlook.com", "", "uncletadinho", "subipacabeça", '3', 2),

("Luis Felipe Gonçalves Modesto", "Outro", "Solteiro", "2004/06/20", "Japonês", "11122284", "Rio de Janeiro", "Rio de Janeiro", "Flamengo time", "Monte do Mengão", "1", "Flamenguistas II, Ap. 1, Bloco 1b, 1° Andar ", "1233300010", "", "", "5521997468101", "", "rjrenaflamengonetime@hotmail.com", "", "logincomsenha", "flamengotime", '1', 1),

("Marllon Silva Araujo Coelho", "Masculino", "Solteiro", "2004/11/19", "Brasileiro", "99900999", "São Paulo", "Julio Mesquita", "Centro", "Dois", "8", "", "9194500010", "", "", "5514997775454", "", "marllonaraujo.silva@gmail.com", "marllon.coelho@etec.sp.gov.br", "seisreais", "muitomeme", '1', 11),

("Serjeoh Ribeiro", "Outro", "Viúvo", "2009/01/01", "Indiano", "11111111", "Tocantins", "Palmas", "Santos Santos Palmares", "Reta Curvilínea", "3", "", "1234522010", "", "", "556306906706", "556311111111", "serjeoh7meia01@etec.sp.gov.br", "aquiesantospoa@gmail.com", "semtelefone", "velhopele", '3', 13);





insert into products (nameProduct, quantityProduct, priceProduct, descriptionProduct, typeProduct, colorProduct, sizeProduct, deliveryProduct, compositionProduct, brandProduct, idProvider) values

("Edredom de cama casal 180 fios - Porto Bello", 120, 15.50, "Edredom de casal Porto Bello (200cm X 230cm) 180 fios. Feito com os melhores materiais do mercado nacional para você e sua família dormirem com a melhor qualidade e conforto.", "Cama", "Vermelho,Azul,Verde,Roxo", "Grande", "Prazo de entrega entre 5 a 7 dias úteis", "50% Algodão | 20% Elastano | 30% Poliéster", "Porto Bello", 1),

("Edredom de cama solteiro 75 fios - Porto Bello", 120, 15.50, "Edredom de casal Porto Bello (200cm X 230cm) 75 fios. Feito com os melhores materiais do mercado nacional para você e sua família dormirem com a melhor qualidade e conforto.", "Cama", "Vermelho,Azul,Verde,Roxo", "Grande", "Prazo de entrega entre 5 a 7 dias úteis", "50% Algodão | 20% Elastano | 30% Poliéster", "Porto Bello", 2),

("Edredom de cama queen 150 fios - Porto Bello", 120, 15.50, "Edredom de casal Porto Bello (200cm X 230cm), 150 fios. Feito com os melhores materiais do mercado nacional para você e sua família dormirem com a melhor qualidade e conforto.", "Cama", "Vermelho,Azul,Verde,Roxo", "Grande", "Prazo de entrega entre 5 a 7 dias úteis", "50% Algodão | 20% Elastano | 30% Poliéster", "Porto Bello", 5),

("Edredom de cama king Porto 125 fios - Porto Bello", 120, 15.50, "Edredom de casal Porto Bello (200cm X 230cm) 125 fios. Feito com os melhores materiais do mercado nacional para você e sua família dormirem com a melhor qualidade e conforto.", "Cama", "Vermelho,Azul,Verde,Roxo", "Grande", "Prazo de entrega entre 5 a 7 dias úteis", "50% Algodão | 20% Elastano | 30% Poliéster", "Porto Bello", 1),

("Tapete Egípcio Nefertari", 10, 1999.99, "Tapete Egípcio Nefertari (150cm X 130cm). Feito com os melhores materiais da região sul do Egito, relíquias retiradas do solo das catacumbas dos faraós, com a melhor qualidade de tecido.", "Casa", "Roxo,Vermelho", "Médio", "Prazo de entrega entre 4 a 5 dias úteis", "30% Viscose | 70% Algodão", "Egipcian's Carpet", 7),

("Tapete Americano Black-Bear", 14, 1499.99, "Tapete Americano Black-Bear (350cm X 300cm). Feito com pele do urso Ursus americanus, o melhor tapete de pele animal já produzido pelo homem.", "Casa", "Preto", "Grande", "Prazo de entrega entre 7 a 8 dias úteis", "30% Couro | 30% Poliéster | 40% Algodão", "OffBear", 2),

("Cortina DuoFold - TopHouse", 35, 69.99, "Cortina DuoFold Tophouse (250cm X 300cm). Com sistema de abertura diferenciado, a cortina DuoFold da TopHouse é perfeito para casas que querem ter um aspecto visual incrível.", "Casa", "Branco", "Grande", "Prazo de entrega entre 5 a 7 dias úteis", "100% Algodão", "TopHouse", 12),

("Cortina Voil - TopHouse", 66, 75.99, "Cortina Boil TopHouse (300cm X 350cm). Cortina de tecido fino, perfeita para locais que recebem mais incidência de luz.", "Casa", "Preto,Branco", "Grande", "Prazo de entrega entre 5 a 7 dias úteis", "100% Algodão", "TopHouse", 1),

("Cortina Blackout - TopHouse", 12, 120.00, "Cortina Blackout (350cm X 400cm). Cortina com 100% de barragem de luz, perfeita para locais com necessidade de pouca luz, como quarto e Home Theater.", "Casa", "Preto,Branco", "Grande", "Prazo de entrega entre 4 a 7 dias úteis", "100% Algodão", "TopHouse", 2),

("Toalha Banhão - GoodBath", 89, 50.00, "Toalha Banhão GoodBath (90cm X 150cm). Toalha felpuda e macia, perfeita para melhor conforto pós banho.", "Banho", "Vermelho,Azul,Preto", "Médio", "Prazo de entrega entre 3 a 5 dias úteis", "100% Algodão", "GoodBath", 2),

("Toalha de Rosto - GoodBath", 100, 22.50, "Toalha de Rosto GoodBath (48cm X 80cm). Toalha pequena macia e elegante, perfeita para secar seu rosto de maneira delicada.", "Banho", "Verde,Roxo,Branco,Preto", "Pequeno", "Prazo de entrega entre 2 a 5 dias úteis", "100% Algodão", "GoodBath", 12),

("Tapete Box - GoodBath", 43, 26.00, "Tapete Box GoodBath (64cm X 35cm). Tapete antiderrapante para box, feito para evitar quedas e ter segurança durante o banho, ideal para pisos escorregadios.", "Banho", "Azul,Preto", "Pequeno", "Prazo de entrega entre 2 a 7 dias úteis", "100% PVC", "GoodBath", 1),

("Toalha de Mesa Retângular - Dible", 82, 70.80, "Toalha de Mesa Retângular (170cm X 230cm). Feita para decorar e manter limpa sua mesa retângular! Composta por materiais de alta qualidade. ", "Mesa", "Bege,Roxo,Preto,Laranja,Vermelho,Rosa,Marrom,Cinza", "Grande", "Prazo de entrega entre 3 a 4 dias úteis", "40% Algodão | 60% Poliéster", "Dible", 1),

("Toalha de Mesa Redonda - Dible", 150, 65.50, "Toalha de Mesa Redonda (200cm X 0cm). Feita para decorar e manter limpa sua mesa redonda! Composta por materiais de alta qualidade.", "Mesa", "Bege,Roxo,Preto,Laranja,Vermelho,Rosa,Marrom,Cinza", "Grande", "Prazo de entrega entre 3 a 4 dias úteis", "40% Algodão | 60% Poliéster", "Dible", 9),

("Toalha de Mesa Quadrada - Dible", 34, 60.00, "Toalha de Mesa Quadrada (180cm X 180cm). Feita para decorar e manter limpa sua mesa quadrada! Composta por materiais de alta qualidade.", "Mesa", "Vermelho,Azul,Verde,Roxo,Branco", "Grande", "Prazo de entrega entre 5 a 4 dias úteis", "100% Poliéster", "Dible", 4);





insert into providers (countryProvider, stateProvider, cityProvider, cepProvider, neighborhoodProvider, streetProvider, numberPlace, telephoneProvider, telephone2Provider, cellphoneProvider, cellphone2Provider, quantityProvider, priceProductProvider, nameProvider, numberWorkBook, baseAccountUF, codEstabilishment, accountFGTS, typeAccountFGTS, situationAccount, dateAdmissionFGTS, pisPasep, username, password) values
    
    ('Brasil', 'São Paulo', 'Marília', '17421909', 'Jardim Marajó', 'Josef dos Santos', '146', '88639806', '', '998487609', '', 150, '50', 'Jucelino Almeida', '006700700262', 'SP', '09970501519464', '00004483032', 'OPTANTE', 'A', '2014/07/17', '12990573811', 'jucelinQZN', 'quebradin0044'),

    ('Brasil','São Paulo','Campinas','17411907', 'Jardim Macanos', 'Josefia dos Córregos', '646', '88659817', '', '995457626', '', '140', '60', 'Maria Galinda Morais','005320700262', 'SP', '02351501519464', '00021483032', 'OPTANTE','A','2015/07/27', '13790573811', 'Galindona', 'galinhacaipira'),

    ('Brasil','Santa Catarina','Blumenau','17622919', 'Maria Ribeiro', 'Lolinda da Silva', '142', '88612304', '', '998483609', '', '350', '130', 'Jacinto Lima','006345700262', 'SP', '09970501512039', '31204483032', 'OPTANTE','A','2014/11/12', '99990573811', 'LimindoCintao', 'limaozindosul'),

    ('Brasil','São Paulo','Campos do Jordão','17411109', 'Limeira da Silva', 'Joass Mar', '421', '88239803', '', '998427409', '', '990', '10', 'Ana Juma','006702200262', 'SP', '99970501519464', '98104483032', 'OPTANTE','A','2016/07/17', '12443443811', 'Jumanzao', 'nChamaDejumanji'),

    ('Brasil','São Paulo','Bauru','13421209', 'Rios Pretos', 'Arlenmó Harlêy', '190', '889398316', '', '998487609', '', '150', '50', 'Jucelino Naval','042100700262', 'SP', '09970501533364', '00004431232', 'OPTANTE','A','2011/11/11', '12990573000', 'JujuNavalha', 'Navalinda'),

    ('Brasil','São Paulo','Assis','15421909', 'Jardim Marlina', 'Barreirinha Firme', '156', '88629509', '', '998757609', '', '150', '50', 'Amaralina Mourão','006700777262', 'SP', '09970501565464', '00004444032', 'OPTANTE','A', '2014/01/17', '12990223811', 'Amarinha', 'mourinhadecarro'),

    ('Brasil','São Paulo','Ourinhos','10521909', 'Parque do Praquê', 'Joao Amiltão', '566', '88639906', '', '998387809', '', '190', '90', 'Celina Ravalin','006402900262', 'SP', '09970501519992', '00004455532', 'OPTANTE','A', '2018/09/07', '12330573811', 'JAvalizona', 'belina'),

    ('Brasil','Pernambuco','Fernando de Noronha','13420939', 'Parque dos Golfis', 'Helena Sampaio Vidal', '546', '85659876', '', '998277659', '', '190', '120', 'Marilinda Liminha','006700322262', 'SP', '09870501519654', '00044383032', 'OPTANTE','A', '2019/07/17', '12990571231', 'Maralindona', 'l12im3a6o5'),

    ('Brasil','São Paulo','Marília','17000909', 'Jardim Marajó', 'Tufic Elías', '149', '88337806', '', '998689609', '', '250', '50', 'Joazi Limeault','006700700162', 'SP', '09970501519444', '00004483232', 'OPTANTE','A', '2012/12/07', '12993573811', 'joziana', 'vid4l0k4'),

    ('Brasil','São Paulo','Marília','12429909', 'Jardim Marajó', 'Alexandre Chaia', '158', '88639676', '', '998487399', '', '843', '249', 'Maria Joaquina','002700745262', 'SP', '09970501519324', '00004484332', 'OPTANTE','A', '2010/07/17', '17990573811', 'maria2k19', 'JOaquina8r3ebed'),

    ('Brasil','São Paulo','Marília','17321509', 'Abraão Gatas', 'Osmar Qimiqer', '564', '87939806', '', '998874609', '', '159', '520', 'Luma Elpídio','006700700562', 'SP', '09970301519464', '00004483122', 'OPTANTE','A', '2014/07/17', '12990873811', 'eupediatudo', 'Luminariadequarto'),

    ('Brasil', 'São Paulo','Marília','17231909','Jardim Marajó', 'José Pelegrini', '146', '88639506', '', '935487609', '', '240', '50', 'Gina Aquima', '006700700162', 'SP', '09970501519564', '00004433032', 'OPTANTE','A', '2014/07/17', '12990523811', 'Ginapalitin', '8298gf865mn'),

    ('Brasil','São Paulo','Marília','17429909', 'Jardim Santa Antonieta', 'Rua Glicério Povoas', '145', '88694806', '', '998826609', '', '245', '120', 'Juca da Silva','066700700262', 'SP', '09920501519464', '00004983032', 'OPTANTE','A', '2014/07/17', '12990173811', 'juquinhadomercadin', 'comprameuproduto'),

    ('Brasil','São Paulo','Marília','12321909', 'Jardim Correios', 'Josafá dos Sociais', '126', '88634496', '', '998432609', '', '110', '450', 'Aliene Miribina','006700710262', 'SP', '09970501559464', '00034483032', 'OPTANTE','A', '2015/04/05', '12490573411', 'AliNirvana', 'NirvanaLIFE'),

    ('Brasil','São Paulo','Marília','17221501', 'Romero Zaninoto', 'Rua Moreira Cesar', '112', '88639864', '', '998482109', '', '130', '150', 'Pedro Valera','006700700266', 'SP', '09970501512464', '00004483332', 'OPTANTE','A', '2019/06/17', '12990571811', 'PedroChalerin', 'pokasideia'),

    ('Brasil','São Paulo','Marília','17125501', 'Romero Zaninoto', 'Alemanco Ronaldo', '132', '88632364', '', '998122109', '', '560', '250', 'Joany Julua','006700700762', 'SP', '09970501517464', '00004433032', 'OPTANTE','A', '2017/07/07', '12990575811', 'Jujuzunhajujuba', 'sdcvi5454');  
    