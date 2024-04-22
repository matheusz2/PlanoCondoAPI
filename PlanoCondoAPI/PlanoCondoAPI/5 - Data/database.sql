CREATE DATABASE PlanoCondo;

USE PlanoCondo;

CREATE TABLE TypePlans (
    TypePlanId int NOT NULL,
    TypePlanName varchar(255) NOT NULL,
    PRIMARY KEY (TypePlanId)
);

CREATE TABLE Plans (
    PlanId NVARCHAR(40) unique NOT NULL,
    PlanName varchar(255) NOT NULL,
	ParentPlanId NVARCHAR(40),
	TypePlanId int NOT NULL,
	AllowRelease bit NOT NULL,
    PRIMARY KEY (PlanId),
	FOREIGN KEY (TypePlanId) REFERENCES TypePlans(TypePlanId)    

);

drop table Plans;
drop table TypePlans;

-- ###############################################################
-- #                                                           #
-- #                   Tipo de Planos - TypePlans              #
-- #                                                           #
-- ###############################################################

INSERT INTO TypePlans (TypePlanId, TypePlanName) VALUES(1, 'Despesa');
INSERT INTO TypePlans (TypePlanId, TypePlanName) VALUES(2, 'Receita');


-- ###############################################################
-- #                                                           #
-- #                   Plano de Contas - Plans                 #
-- #                                                           #
-- ###############################################################

INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1','Receitas',null, '2', 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.1','Taxa condominial','1',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.2','Reserva de depend�ncia','1.1',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.3','Multas','1.2',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.4','Juros','1.3',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.5','Multa condominial','1.4',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.6','�gua','1.5',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.7','G�s','1.6',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.8','Luz e energia','1.7',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.9','Fundo de reserva','1.8',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.10','Fundo de obras','1.9',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.11','Corre��o monet�ria','1.10',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.12','Transfer�ncia entre contas','1.11',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.13','Pagamento duplicado','1.12',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.14','Cobran�a','1.13',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.15','Cr�dito','1.14',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.16','�gua mineral','1.15',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.17','Estorno taxa de resgate','1.16',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.18','Acordo','1.17',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.19','Honor�rios','1.18',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2','Despesas', null,1, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1','Com pessoal','2',1, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.1','Sal�rio','2.1,1', 1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.2','Adiantamento salarial','2.1.1',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.3','Hora extra','2.1.2',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.4','F�rias','2.1.3',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.5','13� sal�rio','2.1.4',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.6','Adiantamento 13� sal�rio','2.1.5',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.7','Adicional de fun��o','2.1.6',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.8','Aviso pr�vio','2.1.7',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.9','INSS','2.1.8',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.10','FGTS','2.1.9',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.11','PIS','2.1.10',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.12','Vale refei��o','2.1.11',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.13','Vale transporte','2.1.12',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.14','Cesta b�sica','2.1.13',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.15','Acordo trabalhista','2.1.14',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2','Mensais',null, 1, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.1','Energia el�trica','2.2',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.2','�gua e esgoto','2.2.1',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.3','Taxa de administra��o','2.2.2',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.4','G�s','2.2.3',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.5','Seguro obrigat�rio','2.2.4',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.6','Telefone','2.2.5',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.7','Softwares e aplicativos','2.2.6',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.3','Manuten��o', null ,1, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.3.1','Elevador','2.3',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.3.2','Limpeza e conserva��o','2.3.1',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.3.3','Jardinagem','2.3.2',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4','Diversas','2.3.3',1, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.1','Honor�rios de advogado','2.4',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.2','Xerox','2.4.1',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.3','Correios','2.4.2',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.4','Despesas judiciais','2.4.3',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.5','Multas','2.4.4',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.6','Juros','2.4.5',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.7','Transfer�ncia entre contas','2.4.6',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('3','Despesas banc�rias',null ,1, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('3.1','Registro de boletos','3',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('3.2','Processamento de boletos','3.1',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('3.3','Registro e processamento de boletos','3.2',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('3.4','Resgates','3.3',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('4','Outras receitas', null, 2, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('4.1','Rendimento de poupan�a','4',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('4.2','Rendimento de investimentos','4.1',2, 1);