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
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.2','Reserva de dependência','1.1',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.3','Multas','1.2',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.4','Juros','1.3',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.5','Multa condominial','1.4',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.6','Água','1.5',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.7','Gás','1.6',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.8','Luz e energia','1.7',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.9','Fundo de reserva','1.8',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.10','Fundo de obras','1.9',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.11','Correção monetária','1.10',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.12','Transferência entre contas','1.11',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.13','Pagamento duplicado','1.12',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.14','Cobrança','1.13',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.15','Crédito','1.14',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.16','Água mineral','1.15',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.17','Estorno taxa de resgate','1.16',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.18','Acordo','1.17',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('1.19','Honorários','1.18',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2','Despesas', null,1, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1','Com pessoal','2',1, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.1','Salário','2.1,1', 1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.2','Adiantamento salarial','2.1.1',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.3','Hora extra','2.1.2',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.4','Férias','2.1.3',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.5','13º salário','2.1.4',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.6','Adiantamento 13º salário','2.1.5',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.7','Adicional de função','2.1.6',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.8','Aviso prévio','2.1.7',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.9','INSS','2.1.8',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.10','FGTS','2.1.9',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.11','PIS','2.1.10',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.12','Vale refeição','2.1.11',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.13','Vale transporte','2.1.12',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.14','Cesta básica','2.1.13',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.1.15','Acordo trabalhista','2.1.14',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2','Mensais',null, 1, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.1','Energia elétrica','2.2',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.2','Água e esgoto','2.2.1',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.3','Taxa de administração','2.2.2',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.4','Gás','2.2.3',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.5','Seguro obrigatório','2.2.4',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.6','Telefone','2.2.5',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.2.7','Softwares e aplicativos','2.2.6',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.3','Manutenção', null ,1, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.3.1','Elevador','2.3',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.3.2','Limpeza e conservação','2.3.1',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.3.3','Jardinagem','2.3.2',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4','Diversas','2.3.3',1, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.1','Honorários de advogado','2.4',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.2','Xerox','2.4.1',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.3','Correios','2.4.2',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.4','Despesas judiciais','2.4.3',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.5','Multas','2.4.4',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.6','Juros','2.4.5',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('2.4.7','Transferência entre contas','2.4.6',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('3','Despesas bancárias',null ,1, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('3.1','Registro de boletos','3',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('3.2','Processamento de boletos','3.1',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('3.3','Registro e processamento de boletos','3.2',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('3.4','Resgates','3.3',1, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('4','Outras receitas', null, 2, 0);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('4.1','Rendimento de poupança','4',2, 1);
INSERT INTO Plans(PlanId, PlanName, ParentPlanId, TypePlanId, AllowRelease) VALUES('4.2','Rendimento de investimentos','4.1',2, 1);