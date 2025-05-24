create database t16_PI_Frete1
go
use t16_PI_Frete1
go

-- Sistema de frete

--criação das tabelas 
create table Produto
( 
	id_produto int  not null identity primary key,
	id_frete_produto int  not null,  
	id_cliente_produto int  not null,  
	id_armazem_produto int  not null, 
	id_funcionario_produto int  not null,  
	quantidade_produto int  not null,  
	descricaoProduto_produto varchar(100) not null,  
	peso_produto decimal(10,2) not null,  
	altura_produto decimal(10,2) not null,  
	largura_produto decimal(10,2) not null,  
	Comprimento_produto decimal(10,2) not null,  
	ValorUnit_produto decimal(10,2) not null,  
	ValorTotal_produto decimal(10,2) not null,  
	obs_produto varchar(255) null,  
	status_produto varchar(100) not null default'ATIVO' 
);
go

create table Cliente
(
	id_cliente int not null identity primary key,
	nome_cliente varchar(255) not null, 
	telefone_cliente char(18) not null, 
	email_cilente varchar(255) not null, 
	cpf_cliente char(14) not null, 
	cep_cliente char(10) not null, 
	logradouro_cliente varchar(255) not null,
	numerocasa_cliente int  not null,
	bairro_cliente varchar(100) not null, 
	dataNascimento_cliente date not null, 
	complemento_cliente varchar(100) not null, 
	obs_cliente varchar(255) null, 
	status_cliente varchar(100) not null default'ATIVO'
);
go


create table Frete
(
	id_frete int not null identity primary key,
	placaVeiculo char(26) not null,
	id_CF int not null, --1
	id_CV int not null, 
	data_frete date not null,
	QtdeViagens int not null,
	cfPorViagem decimal (10,2) not null,
	cvPorViagem decimal (10,2) not null,
	totalCf decimal (10,2) not null,
	totalCv decimal (10,2) not null,
	kmPercorrida decimal (10,2) not null,
	custoOperacional decimal (10,2) not null,
	valor_frete decimal(10,2) not null, 
	valorFretePorProduto decimal (10,2) not null,
	QtdeProduto int not null,
	MargemLucro int not null
);
go

drop table Frete



create table Armazem
(
	id_armazem int  not null identity primary key,
	id_empresa_armazem int  not null, 
	id_funcionario_armazem int  not null, 
	nome_armazem varchar(100) not null,
	capacidadeTotal1_armazem int  not null, 
	capacidadeDisponivel_armazem int  not null, 
	tipodeArmazem_armazem varchar(100) not null, 
	secoes_armazem varchar(100) not null, 
	horarioFuncionamento_armazem char(20) not null, 
	veiculosAssociados_armazem varchar(100) not null, 
	obs_armazem varchar(255) null, 
	status_armazem varchar(100) not null default'ATIVO'
);
go

create table Funcionario
(
	id_funcionario int not null identity primary key,
	nome_funcionario varchar(255) not null, 
	cnh_funcionario char(11) null, 
	telefone_funcionario char(18) not null, 
	email_funcionario varchar(100) not null, 
	deparpamento_funcionario varchar(100) not null, 
	cargo_funcionario varchar(100) not null, 
	obs_funcionario varchar(255) null,
	status_funcionario varchar(100) not null default'ATIVO'
);
go

create table Veiculo_em_entrega
(
	id_veiculo_em_entrega int not null identity primary key,
	id_funcionario_veiculo_em_entrega int not null, 
	id_veiculo_entrega int not null, 
	dataInicio_em_entrega_veiculo_em_entrega date not null, 
	dataEntregaProduto_veiculo_em_entrega date not null, 
	obs_veiculo_em_entrega varchar(255) null, 
	status_veiculo_em_entrega varchar(100) not null default'ATIVO'

);
go


create table Veiculo
(
	id_veiculo int not null identity primary key,
	placa_veiculo char(26) not null,
	renavam_veiculo char (12) not null,
	modelo_Veiculo varchar(50) not null,
	anoFabricação_veiculo int not null,
	cor_veiculo varchar(50)  not null, 
	tipo_veiculo varchar(50) not null, 
	capacidade_carga_veiculo int not null,
	obs_veiculo varchar(255) null, 
	status_veiculo varchar(100) not null default'ATIVO'
);
go


create table Rota_de_entrega
(
	id_rota_de_entrega int not null identity primary key,
	id_veiculo_rota_de_entrega int not null, 
	dataSaída_entrega date not null,  
	Kmida_rota_de_entrega decimal(10,2) not null , 
	KmVolta_rota_de_entrega decimal(10,2) not null,  
	distanciaTotalKm_rota_de_entrega decimal(10,2) not null,  
	tempoEstimado_rota_de_entrega int not null,  
	distancia_rota_de_entrega decimal(10,2) not null,  
	obs_rota_de_entrega varchar(255) null,  
	status_rota_de_entrega varchar(100) not null default'ATIVO'
);
go



create table Empresa
(
	id_empresa int not null identity primary key,
	nome_empresa varchar(100) not null, 
	cnpj_empresa varchar(18) not null, 
	endereço_empresa varchar(100) not null, 
	cep_empresa varchar(10) not null, 
	bairro_empresa varchar(100) not null, 
	cidade_empresa varchar(100) not null, 
	uf_empresa char(2) not null, 
	email_empresa varchar(100) not null, 
	site_empresa varchar(100) null, 
	obs_empresa varchar(255) null, 
	status_empresa varchar(100) not null default'Ativo'
);
go


create table CF_Veiculos
(
	id_CF int not null identity Primary Key,
	id_Veiculo_CF int not null,  
	data_CF date not null, 
	consumo_combustivel_CF  decimal(10,2)  not null,     
	rcc_precoChassi_CF  decimal(10,2)  not null,     
	rcc_valorRevenda_CF  decimal(10,2)  not null,     
	rcc_anoUso_CF  int  not null,
	rcc_taxaJuros_CF  int  not null,
	rcc_resultado_CF decimal(10,2) not null, 
	clc_custoSeguro_CF  decimal(10,2)  not null,
	clc_impostoVeiculo_CF decimal(10,2)  not null,
	clc_resultado_CF decimal(10,2)  not null,
	cde_preçoReboque_CF  decimal(10,2)  not null,     
	cde_valorRevendaEquipamento_CF  decimal(10,2)  not null,
	cde_anoUso_CF int not null,
	cde_resultado_CF decimal(10,2) not null, 
	total_CF decimal(10,2) not null
);
go

--Recriar a tabela novamente pois tem que adicionar os itens no CPC
create table CV_Veiculos
(
	id_CV_Veiculo int not null identity Primary Key,
	id_Veiculo_CV_Veiculos int not null,  
	data_CV_Veiculos date not null,  

	
	PPC_resultado decimal(20,2) not null,  
	PPC_preco_do_pneu decimal(20,2) not null,  
	PPC_preco_da_camara decimal(20,2) not null,  

	GRE_resultado decimal(20,2) not null,  
	GRE_preco_recapagem decimal(20,2) not null,
	GRE_indice_medio_recapagens decimal (20,2) not null,
	

	GCR_resultado decimal(20,2) not null,  
	GCR_preco_da_camara decimal(20,2) not null,  
	GCR_indice_medio_recapagens decimal (10,2) not null,
	
	UPC_resultado decimal(20,2) not null,  

	NTP_resultado decimal(20,2) not null,
	NTP_vida_media_pneumatica_recapado decimal(20,2) not null,
	NTP_indice_medio_recapagem decimal(20,2) not null,
	NTP_vida_media_pneumatico_novo decimal (20,2) not null,
	

	CPC_resultado decimal(20,2) not null,  
	CPC_qtde_pneu int not null,
	CPC_vida_util_pneu decimal (20,2) not null,
	

	total_CV decimal (20,2) not null --recriar a tabela novamente
);
go

drop table Frete
drop table CV_Veiculos

-- chaves estrangeiras


alter table Produto add
constraint  FK_id_frete_produto 
foreign key (id_frete_produto) references Frete (id_Frete)

alter table Frete add
constraint FK_id_CF
foreign key (id_CF) references CF_Veiculos (id_CF)

alter table Frete add
constraint FK_id_CV
foreign key (id_CV) references CV_Veiculos (id_CV_Veiculos)


alter table Produto add
constraint  FK_id_cliente_produto 
foreign key (id_cliente_produto) references Cliente (id_cliente)

alter table Produto add
constraint  FK_id_armazem_produto 
foreign key (id_armazem_produto) references Armazem (id_armazem)

alter table Produto add
constraint  FK_id_funcionario_produto 
foreign key (id_funcionario_produto) references funcionario (id_funcionario)

alter table Frete add
constraint  FK_id_cliente_frete 
foreign key (id_cliente_frete) references Cliente (id_cliente)

alter table Armazem add
constraint  FK_id_empresa_armazem 
foreign key (id_empresa_armazem) references Empresa (id_empresa)

ALTER TABLE Armazem
DROP CONSTRAINT FK_id_empresa_armazem

alter table Armazem add
constraint FK_id_funcionario_armazem
foreign key (id_funcionario_armazem) references Funcionario (id_funcionario)

alter table Veiculo_em_entrega add
constraint FK_id_funcionario_veiculo_em_entrega
foreign key (id_funcionario_veiculo_em_entrega) references Funcionario (id_funcionario)

alter table Veiculo_em_entrega add
constraint FK_id_veiculo_entrega
foreign key (id_veiculo_entrega) references Veiculo (id_veiculo)


alter table Rota_de_entrega add
constraint FK_id_veiculo_rota_de_entrega
foreign key (id_veiculo_rota_de_entrega) references Veiculo (id_veiculo)

alter table CF_Veiculos add
constraint FK_id_Veiculo_CF
foreign key (id_Veiculo_CF) references Veiculo (id_veiculo)

alter table CV_Veiculos drop constraint 
FK_id_Veiculo_CV_Veiculos

alter table CV_Veiculos add
constraint FK_id_Veiculo_CV_Veiculos
foreign key (id_Veiculo_CV_Veiculos) references Veiculo (id_veiculo)


-- inserção de dados

	select*from Frete
	select*from Cliente
	select*from Produto
	select*from	Armazem
	select*from Funcionario
	select*from Veiculo_em_entrega
	select*from Veiculo_Parametro
	select*from Rota_de_entrega
	select*from Veiculo
	select*from Empresa
	select*from CF_Veiculos
	select*from CV_Veiculos
	select*from Veiculo_Parametro





	/*
	create table CV_Veiculos
(
	id_CV_Veiculos int not null identity Primary Key,
	id_Veiculo_CV_Veiculos int not null,  
	data_CF_Veiculos date not null,  
	UPC_resultado decimal(10,2) not null,  
	UPC_preco_dos_pneus decimal(10,2) not null,  
	UPC_quantidade_de_pneus decimal(10,2) not null,  
	UPC_vida_util_dos_pneus decimal(10,2) not null,  
	CPC_resultado decimal(10,2) not null,  
	CPC_preco_dos_pneus decimal(10,2) not null,  
	CPC_quantidade_de_pneus decimal(10,2) not null,  
	CPC_vida_util_dos_pneus decimal(10,2) not null, 


	CMC_resultado decimal(10,2) not null,  
	CMC_custo_total_de_manutencao decimal(10,2) not null,  
	CMC_quilometragem_total decimal(10,2) not null,  
	CLC_resultado decimal(10,2) not null,  
	CLC_custo_total_de_lavagem_e_lubrificacao decimal(10,2) not null,  
	CLC_quilometragem_total decimal(10,2) not null,  
	CLA_resultado decimal(10,2) not null,  
	CLA_custo_total_de_lavagem decimal(10,2) not null,  
	CLA_quilometragem_total decimal(10,2) not null,  
	CLU_resultado decimal(10,2) not null,  
	CLU_custo_total_de_lubrificacao decimal(10,2) not null,  
	CLU_quilometragem_total decimal(10,2) not null,  
	COM_resultado decimal(10,2) not null,  
	COM_custo_do_oleo decimal(10,2) not null,  
	COM_quantidade_de_oleo_necessario decimal(10,2) not null,  
	COQ_resultado decimal(10,2) not null,  
	COQ_custo_total_de_oleos_lubrificantes decimal(10,2) not null,  
	COQ_quilometragem_total decimal(10,2) not null,  
	CVC_resultado decimal(10,2) not null,  
	CVC_todos_os_custos_variaveis decimal(10,2) not null,  
	CVC_quilometragem_total decimal(10,2) not null,  
	CPE_resultado decimal(10,2) not null,  
	CPE_preco_dos_pneus decimal(10,2) not null,  
	CPE_quantidade_de_pneus decimal(10,2) not null,  
	CPE_vida_util_dos_pneus decimal(10,2) not null,  


	PPC_resultado decimal(10,2) not null,  
	PPC_preco_do_pneu decimal(10,2) not null,  
	PPC_preco_da_camara decimal(10,2) not null,  
	GRE_resultado decimal(10,2) not null,  
	GRE_custo_da_recapagem decimal(10,2) not null,  
	GRE_numero_de_recapagens decimal(10,2) not null,  
	GRE_quantidade_de_pneus decimal(10,2) not null,  
	GCR_resultado decimal(10,2) not null,  
	GCR_custo_da_camara decimal(10,2) not null,  
	GCR_numero_de_camaras_substituidas decimal(10,2) not null,  
	GCR_quantidade_de_pneus decimal(10,2) not null, 
	UPC_resultado decimal(10,2) not null, 
	NTP_vida-media-pneumatica-recapado decimal(10,2) not null,
	NTP_indice-medio-recapagem decimal(10,2) not null,
	NTP_vida-media-pneumatico-novo decimal (10,2) not null
	NTP_resultado decimal(10,2) not null 
	

	UPE_vida_util_dos_pneus decimal(10,2) not null,  
	NTPE_resultado decimal(10,2) not null,  
	NTPE_vida_util_dos_pneus decimal(10,2) not null,  
	CME_resultado decimal(10,2) not null,  
	CME_custo_total_de_manutencao decimal(10,2) not null,  
	CME_quilometragem_total decimal(10,2) not null,  
	CLLE_resultado decimal(10,2) not null,  
	CLLE_custo_total_de_lavagem_e_lubrificacao decimal(10,2) not null,  
	CLLE_quilometragem_total decimal(10,2) not null,  
	CLAE_resultado decimal(10,2) not null,  
	CLAE_custo_total_de_lavagem decimal(10,2) not null,  
	CLAE_quilometragem_total decimal(10,2) not null,  
	CLUE_resultado decimal(10,2) not null,  
	CLUE_custo_total_de_lubrificacao decimal(10,2) not null,  
	CLUE_quilometragem_total decimal(10,2) not null,  
	CVE_resultado decimal(10,2) not null,  
	CVE_todos_os_custos_variaveis decimal(10,2) not null,  
	CVE_quilometragem_total decimal(10,2) not null,  
	Custos_Diretos_Finais_resultado decimal(10,2) not null,  
	Custos_Diretos_Finais_todos_os_custos_diretos decimal(10,2) not null,  
	CFM_resultado decimal(10,2) not null,  
	CFM_custo_fixo_mensal decimal(10,2) not null,  
	CVQ_resultado decimal(10,2) not null,  
	CVQ_todos_os_custos_variaveis decimal(10,2) not null,  
	CVQ_quilometragem_total decimal(10,2) not null,  
	CLC1_resultado decimal(10,2) not null,  
	CLC2_custo_total_de_lavagem_e_lubrificacao decimal(10,2) not null,  
	CLC3_quilometragem_total decimal(10,2) not null,  
	CCQ_resultado decimal(10,2) not null,  
	CCQ_custo_total_de_combustivel decimal(10,2) not null,  
	CCQ_quilometragem_total decimal(10,2) not null,  
	OCM_resultado decimal(10,2) not null,  
	OCM_custo_do_oleo_para_a_caixa_de_mudancas decimal(10,2) not null,  
	OCM_quantidade_de_oleo_necessario decimal(10,2) not null,  
	OCT_resultado decimal(10,2) not null,  
	OCT_custo_do_oleo_para_eixo_traseiro_caixa_de_transferencia decimal(10,2) not null,  
	OCT_quantidade_de_oleo_necessario decimal(10,2) not null,  
	OSD_resultado decimal(10,2) not null,  
	OSD_custo_do_oleo_para_sistema_de_direcao decimal(10,2) not null,  
	OSD_quantidade_de_oleo_necessario decimal(10,2) not null,  
	TOM_resultado decimal(10,2) not null,  
	TOM_custo_da_troca_de_oleo_para_motor decimal(10,2) not null,  
	TOM_frequencia_da_troca_de_oleo decimal(10,2) not null
);
go

*/

/*
INSERT INTO Cliente
(nome_cliente,telefone_cliente,email_cilente,cpf_cliente,cep_cliente,logradouro_cliente,numerocasa_cliente,bairro_cliente,dataNascimento_cliente,complemento_cliente, obs_cliente)

VALUES
    ('João Silva', '11987654321', 'joao.silva@example.com', '123.456.789-00', '01310-100', 'Av. Paulista', 1000, 'Bela Vista', '1985-01-01', 'Apto 101', 'Cliente regular'),
    ('Maria Oliveira', '11987654322', 'maria.oliveira@example.com', '987.654.321-00', '01302-000', 'Rua da Consolação', 200, 'Consolação', '1990-02-02', 'Casa 2', 'Cliente VIP'),
    ('Carlos Pereira', '11987654323', 'carlos.pereira@example.com', '456.789.123-00', '01452-000', 'Av. Faria Lima', 300, 'Itaim Bibi', '1988-03-03', 'Apto 303', 'Cliente novo'),
    ('Ana Costa', '11987654324', 'ana.costa@example.com', '321.654.987-00', '01504-000', 'Rua Vergueiro', 400, 'Liberdade', '1992-04-04', 'Casa 4', 'Cliente regular'),
    ('Pedro Santos', '11987654325', 'pedro.santos@example.com', '789.123.456-00', '04029-000', 'Av. Ibirapuera', 500, 'Moema', '1987-05-05', 'Apto 505', 'Cliente VIP'),
    ('Fernanda Lima', '11987654326', 'fernanda.lima@example.com', '654.321.987-00', '01304-000', 'Rua Augusta', 600, 'Jardins', '1991-06-06', 'Casa 6', 'Cliente novo'),
    ('Roberto Alves', '11987654327', 'roberto.alves@example.com', '147.258.369-00', '05402-000', 'Av. Rebouças', 700, 'Pinheiros', '1989-07-07', 'Apto 707', 'Cliente regular'),
    ('Juliana Rocha', '11987654328', 'juliana.rocha@example.com', '258.369.147-00', '01414-000', 'Rua Haddock Lobo', 800, 'Cerqueira César', '1993-08-08', 'Casa 8', 'Cliente VIP'),
    ('Ricardo Mendes', '11987654329', 'ricardo.mendes@example.com', '369.147.258-00', '01318-000', 'Av. Brigadeiro Luís Antônio', 900, 'Bela Vista', '1994-09-09', 'Apto 909', 'Cliente novo'),
    ('Patrícia Oliveira', '11987654330', 'patricia.oliveira@example.com', '741.852.963-00', '01426-000', 'Rua Oscar Freire', 1000, 'Jardins', '1986-10-10', 'Casa 10', 'Cliente regular')


INSERT INTO Frete
(id_cliente_frete, id_funcionario_frete, data_frete, valor_frete, obs_frete)

VALUES
    (1, 1, '2025-01-01', 150.00, 'Entrega rápida'),
    (2, 2, '2025-01-02', 200.00, 'Entrega padrão'),
    (3, 3, '2025-01-03', 250.00, 'Entrega expressa'),
    (4, 4, '2025-01-04', 300.00, 'Entrega rápida'),
    (5, 5, '2025-01-05', 350.00, 'Entrega padrão'),
    (6, 6, '2025-01-06', 400.00, 'Entrega expressa'),
    (7, 7, '2025-01-07', 450.00, 'Entrega rápida'),
    (8, 8, '2025-01-08', 500.00, 'Entrega padrão'),
    (9, 9, '2025-01-09', 550.00, 'Entrega expressa'),
    (10, 10, '2025-01-10', 600.00, 'Entrega rápida')

	
INSERT INTO Empresa
(nome_empresa,cnpj_empresa,endereço_empresa,cep_empresa,bairro_empresa,cidade_empresa,uf_empresa,email_empresa,site_empresa,obs_empresa)

VALUES
    ('Empresa A', '12.345.678/0001-00', 'Av. Paulista, 1000', '01310-100', 'Bela Vista', 'São Paulo', 'SP', 'contato@empresaa.com', 'www.empresaa.com', 'Empresa líder no setor'),
    ('Empresa B', '23.456.789/0001-00', 'Rua da Consolação, 200', '01302-000', 'Consolação', 'São Paulo', 'SP', 'contato@empresab.com', 'www.empresab.com', 'Empresa de tecnologia'),
    ('Empresa C', '34.567.890/0001-00', 'Av. Faria Lima, 300', '01452-000', 'Itaim Bibi', 'São Paulo', 'SP', 'contato@empresac.com', 'www.empresac.com', 'Empresa de marketing'),
    ('Empresa D', '45.678.901/0001-00', 'Rua Vergueiro, 400', '01504-000', 'Liberdade', 'São Paulo', 'SP', 'contato@empresad.com', 'www.empresad.com', 'Empresa de educação'),
    ('Empresa E', '56.789.012/0001-00', 'Av. Ibirapuera, 500', '04029-000', 'Moema', 'São Paulo', 'SP', 'contato@empresaE.com', 'www.empresaE.com', 'Empresa de saúde'),
    ('Empresa F', '67.890.123/0001-00', 'Rua Augusta, 600', '01304-000', 'Jardins', 'São Paulo', 'SP', 'contato@empresaF.com', 'www.empresaF.com', 'Empresa de startups'),
    ('Empresa G', '78.901.234/0001-00', 'Av. Rebouças, 700', '05402-000', 'Pinheiros', 'São Paulo', 'SP', 'contato@empresaG.com', 'www.empresaG.com', 'Empresa de finanças'),
    ('Empresa H', '89.012.345/0001-00', 'Rua Haddock Lobo, 800', '01414-000', 'Cerqueira César', 'São Paulo', 'SP', 'contato@empresaH.com', 'www.empresaH.com', 'Empresa de tecnologia'),
    ('Empresa I', '90.123.456/0001-00', 'Av. Brigadeiro Luís Antônio, 900', '01318-000', 'Bela Vista', 'São Paulo', 'SP', 'contato@empresaI.com', 'www.empresaI.com', 'Empresa de arte'),
    ('Empresa J', '01.234.567/0001-00', 'Rua Oscar Freire, 1000', '01426-000', 'Jardins', 'São Paulo', 'SP', 'contato@empresaJ.com', 'www.empresaJ.com', 'Empresa de música')


INSERT INTO Funcionario
(nome_funcionario, cnh_funcionario, telefone_funcionario, email_funcionario, deparpamento_funcionario, cargo_funcionario,obs_funcionario)

VALUES
    ('João Silva', '12345678900', '11987654321', 'joao.silva@example.com', 'Logística', 'Motorista', 'Funcionário exemplar'),
    ('Maria Oliveira', '98765432100', '11987654322', 'maria.oliveira@example.com', 'Logística', 'Motorista', 'Funcionária dedicada'),
    ('Carlos Pereira', '45678912300', '11987654323', 'carlos.pereira@example.com', 'Logística', 'Motorista', 'Funcionário pontual'),
    ('Ana Costa', '32165498700', '11987654324', 'ana.costa@example.com', 'Logística', 'Motorista', 'Funcionária eficiente'),
    ('Pedro Santos', '78912345600', '11987654325', 'pedro.santos@example.com', 'Logística', 'Motorista', 'Funcionário responsável'),
    ('Fernanda Lima', '65432198700', '11987654326', 'fernanda.lima@example.com', 'Logística', 'Motorista', 'Funcionária atenciosa'),
    ('Roberto Alves', '14725836900', '11987654327', 'roberto.alves@example.com', 'Logística', 'Motorista', 'Funcionário dedicado'),
    ('Juliana Rocha', '25836914700', '11987654328', 'juliana.rocha@example.com', 'Logística', 'Motorista', 'Funcionária exemplar'),
    ('Ricardo Mendes', '36914725800', '11987654329', 'ricardo.mendes@example.com', 'Logística', 'Motorista', 'Funcionário pontual'),
    ('Patrícia Oliveira', '74185296300', '11987654330', 'patricia.oliveira@example.com', 'Logística', 'Motorista', 'Funcionária eficiente')


INSERT INTO Armazem
(id_empresa_armazem, id_funcionario_armazem, nome_armazem,capacidadeTotal1_armazem, capacidadeDisponivel_armazem, tipodeArmazem_armazem, secoes_armazem, horarioFuncionamento_armazem, veiculosAssociados_armazem, obs_armazem)

VALUES
    (1, 1, 'Armazém Central', 10000, 8000, 'Geral', 5, '08:00 - 18:00', 10, 'Armazém principal'),
    (1, 2, 'Armazém Norte', 8000, 6000, 'Frigorífico', 4, '08:00 - 18:00', 8, 'Armazém de alimentos'),
    (2, 3, 'Armazém Sul', 12000, 9000, 'Geral', 6, '08:00 - 18:00', 12, 'Armazém secundário'),
    (2, 4, 'Armazém Leste', 7000, 5000, 'Químico', 3, '08:00 - 18:00', 7, 'Armazém de produtos químicos'),
    (3, 5, 'Armazém Oeste', 9000, 7000, 'Geral', 4, '08:00 - 18:00', 9, 'Armazém de materiais'),
    (3, 6, 'Armazém Nordeste', 11000, 8500, 'Frigorífico', 5, '08:00 - 18:00', 11, 'Armazém de alimentos'),
    (4, 7, 'Armazém Noroeste', 9500, 7500, 'Geral', 4, '08:00 - 18:00', 9, 'Armazém de produtos diversos'),
    (4, 8, 'Armazém Sudeste', 10500, 8000, 'Químico', 5, '08:00 - 18:00', 10, 'Armazém de produtos químicos'),
    (5, 9, 'Armazém Sudoeste', 8500, 6500, 'Geral', 4, '08:00 - 18:00', 8, 'Armazém de materiais'),
    (5, 10, 'Armazém Centro-Oeste', 10000, 8000, 'Frigorífico', 5, '08:00-18:00', 10, 'Armazém de alimentos')


INSERT INTO Veiculo
(placa_veiculo,renavam_veiculo,modelo_Veiculo,anoFabricação_veiculo,cor_veiculo, tipo_veiculo, capacidade_carga_veiculo,obs_veiculo)
VALUES
	('ABC1D23', '123456789012', 'Fiat Strada',2020, 'Vermelho','Caminhonete',700,'Veículo em boas condições'),
('DEF4G56', '234567890123', 'Volkswagen Saveiro',2019, 'Branco','Caminhonete', 800,null),
('GHI7J89', '345678901234', 'Ford Cargo 1119',2018, 'Azul','Caminhão', 3500, 'Última revisão em 2023'),
('JKL0M12', '456789012345', 'Mercedes Sprinter',2021, 'Prata','Van',1200, 'Van utilizada para entregas urbanas'),
('MNO3P45', '567890123456', 'Iveco Daily',2022, 'Preto','Furgão',1800, null),
('PQR6S78', '678901234567', 'Chevrolet S10',2020, 'Cinza','Caminhonete',  1000, 'Reformado em 2022'),
('STU9V01', '789012345678', 'Hyundai HR',2017, 'Branco','Caminhão leve',1200, null),
('VWX2Y34', '890123456789', 'Renault Master',2019, 'Prata','Furgão',1500, 'Utilizado para transporte refrigerado'),
('YZA5B67', '901234567890', 'Toyota Hilux',2023, 'Preto','Caminhonete',  1100, 'Novo veículo na frota'),
('BCD8E90', '012345678901', 'Volkswagen Delivery', 2021, 'Azul Escuro',  'Caminhão',3000, null)


INSERT INTO Veiculo_em_entrega
(id_funcionario_veiculo_em_entrega, id_veiculo_entrega,dataInicio_em_entrega_veiculo_em_entrega, dataEntregaProduto_veiculo_em_entrega,obs_veiculo_em_entrega)

VALUES
    (1, 1, '2025-01-01', '2025-01-02', 'Entrega realizada com sucesso'),
    (2, 2, '2025-01-03', '2025-01-04', 'Entrega dentro do prazo'),
    (3, 3, '2025-01-05', '2025-01-06', 'Entrega atrasada'),
    (4, 4, '2025-01-07', '2025-01-08', 'Entrega realizada com sucesso'),
    (5, 5, '2025-01-09', '2025-01-10', 'Entrega dentro do prazo'),
    (6, 6, '2025-01-11', '2025-01-12', 'Entrega atrasada'),
    (7, 7, '2025-01-13', '2025-01-14', 'Entrega realizada com sucesso'),
    (8, 8, '2025-01-15', '2025-01-16', 'Entrega dentro do prazo'),
    (9, 9, '2025-01-17', '2025-01-18', 'Entrega atrasada'),
    (10, 10, '2025-01-19', '2025-01-20', 'Entrega realizada com sucesso')


INSERT INTO Rota_de_entrega 
(id_veiculo_rota_de_entrega, data_Saída_entrega, origem_rota_de_entrega, destino_rota_de_entrega, distanciaKm_rota_de_entrega, distancia_rota_de_entrega, tempo_Estimado_rota_de_entrega, obs_rota_de_entrega, status_rota_de_entrega)
VALUES
    (1, '2025-01-01', 'São Paulo', 'Rio de Janeiro', 430, 430.00, 360, 'Entrega urgente', 'ATIVO'),
    (2, '2025-01-02', 'São Paulo', 'Belo Horizonte', 580, 580.00, 480, 'Entrega padrão', 'ATIVO'),
    (3, '2025-01-03', 'São Paulo', 'Curitiba', 410, 410.00, 360, 'Entrega expressa', 'ATIVO'),
    (4, '2025-01-04', 'São Paulo', 'Porto Alegre', 1100, 1100.00, 900, 'Entrega urgente', 'ATIVO'),
    (5, '2025-01-05', 'São Paulo', 'Brasília', 1015, 1015.00, 840, 'Entrega padrão', 'ATIVO'),
    (6, '2025-01-06', 'São Paulo', 'Salvador', 1960, 1960.00, 1440, 'Entrega expressa', 'ATIVO'),
    (7, '2025-01-07', 'São Paulo', 'Fortaleza', 3120, 3120.00, 2160, 'Entrega urgente', 'ATIVO'),
    (8, '2025-01-08', 'São Paulo', 'Recife', 2700, 2700.00, 1800, 'Entrega padrão', 'ATIVO'),
    (9, '2025-01-09', 'São Paulo', 'Manaus', 3950, 3950.00, 2880, 'Entrega expressa', 'ATIVO'),
    (10, '2025-01-10', 'São Paulo', 'Natal', 2800, 2800.00, 1920, 'Entrega urgente', 'ATIVO')


INSERT INTO produto
(id_frete_produto, id_cliente_produto, id_armazem_produto, id_funcionario_produto, quantidade_produto, descricaoProduto_produto, peso_produto, altura_produto, largura_produto, Comprimento_produto, ValorUnit_produto, ValorTotal_produto, obs_produto)

VALUES
    (1, 1, 1, 1, 10, 'Produto A', 1.5, 10, 5, 20, 100.00, 1000.00, 'Produto em estoque'),
    (2, 2, 2, 2, 20, 'Produto B', 2.0, 15, 7, 25, 150.00, 3000.00, 'Produto em promoção'),
    (3, 3, 3, 3, 30, 'Produto C', 2.5, 20, 10, 30, 200.00, 6000.00, 'Produto novo'),
    (4, 4, 4, 4, 40, 'Produto D', 3.0, 25, 12, 35, 250.00, 10000.00, 'Produto esgotado'),
    (5, 5, 5, 5, 50, 'Produto E', 3.5, 30, 15, 40, 300.00, 15000.00, 'Produto exclusivo'),
    (6, 6, 6, 6, 60, 'Produto F', 4.0, 35, 17, 45, 350.00, 21000.00, 'Produto em estoque'),
    (7, 7, 7, 7, 70, 'Produto G', 4.5, 40, 20, 50, 400.00, 28000.00, 'Produto em promoção'),
    (8, 8, 8, 8, 80, 'Produto H', 5.0, 45, 22, 55, 450.00, 36000.00, 'Produto novo'),
    (9, 9, 9, 9, 90, 'Produto I', 5.5, 50, 25, 60, 500.00, 45000.00, 'Produto esgotado'),
    (10, 10, 10, 10, 100, 'Produto J', 6.0, 55, 27, 65, 550.00, 55000.00, 'Produto exclusivo')
	
INSERT INTO Veiculo_Parametro
(id_Veiculo_VParametro,data_veiculo_parametro,consumo_combustivel_veiculo,rcc_valor_capital_investido,rcc_taxa_remuneracao_atual,rcc_meses,clc_valor_anual_licenciamento_chassi,cde_valorInicialEquipamento,cde_vidaUtilEquipamentoMeses)

VALUES
 
	(1, '2025-04-04', 100.50, 50000.00, 5.00, 12, 2000, 15000.00, 60),
    (2, '2025-04-05', 110.75, 51000.00, 5.10, 13, 2100, 15100.00, 61),
    (3, '2025-04-06', 120.00, 52000.00, 5.20, 14, 2200, 15200.00, 62),
    (4, '2025-04-07', 130.25, 53000.00, 5.30, 15, 2300, 15300.00, 63),
    (5, '2025-04-08', 140.50, 54000.00, 5.40, 16, 2400, 15400.00, 64),
    (6, '2025-04-09', 150.75, 55000.00, 5.50, 17, 2500, 15500.00, 65),
    (7, '2025-04-10', 160.00, 56000.00, 5.60, 18, 2600, 15600.00, 66),
    (8, '2025-04-11', 170.25, 57000.00, 5.70, 19, 2700, 15700.00, 67),
    (9, '2025-04-12', 180.50, 58000.00, 5.80, 20, 2800, 15800.00, 68),
    (10, '2025-04-13', 190.75, 59000.00, 5.90, 21, 2900, 15900.00, 69);


INSERT INTO CF_Veiculos 
(id_Veiculo_CF_Veiculos,data_CF_Veiculos,rccResultado_veiculo,cfc_resultado,cde_resultado,cfeResultado_veiculo)

VALUES
    (1, '2025-04-04', 100.50, 200.75, 300.00, 400.25),
    (2, '2025-04-05', 110.75, 210.80, 310.10, 410.35),
    (3, '2025-04-06', 120.00, 220.85, 320.20, 420.45),
    (4, '2025-04-07', 130.25, 230.90, 330.30, 430.55),
    (5, '2025-04-08', 140.50, 240.95, 340.40, 440.65),
    (6, '2025-04-09', 150.75, 251.00, 350.50, 450.75),
    (7, '2025-04-10', 160.00, 261.05, 360.60, 460.85),
    (8, '2025-04-11', 170.25, 271.10, 370.70, 470.95),
    (9, '2025-04-12', 180.50, 281.15, 380.80, 481.05),
    (10, '2025-04-13', 190.75, 291.20, 390.90, 491.15);




*/