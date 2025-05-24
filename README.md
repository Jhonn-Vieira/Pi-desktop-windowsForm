Sistema de Gerenciamento de Fretes
Introdução
Esta aplicação foi desenvolvida para facilitar o gerenciamento de veículos, custos de operação e o cálculo do frete. O sistema permite cadastrar, atualizar, buscar, ler e deletar registros, aplicando uma média de fretes com base nos custos de operação. A interface é construída utilizando Windows Forms, e os dados são armazenados em um banco de dados SQL Server.

Desenvolvimento
Propósito
O sistema de gerenciamento de fretes é responsável por gerenciar os dados dos veículos (como placa e RENAVAM) e os custos operacionais (fixos e variáveis). A partir desses dados, o sistema calcula o valor do frete total e o valor por produto. Os dados são inseridos através de uma interface gráfica (TextBoxes do Windows Forms) e enviados para um banco de dados organizado no SQL Server.

Como Utilizar:
1-Clone o Repositório

2-Abra o Projeto:

Utilize o Visual Studio para abrir a solução.
Utilize o Sql server management para abrir o banco de dados.

Configuração:

Verifique e ajuste a string de conexão em ConexaoBanco.conexaoBanco para apontar ao seu ambiente de banco de dados.

Execução:
1-Compile e execute o projeto para acessar a interface de gerenciamento.
2-crie um veiculo na tela "Veiculo", inserindo os dados do veiculo;
4-Adicione o custo fixo na tela "custo fixo", inserindo os dados do custo fixo;
5-Adicione o custo variavel na tela "custo variavel", inserindo os dados do variavel;
6-por fim, na tela de frete, adicione insira o id do veiculo e preencha os campos de id de custos e faça o calculo do frete;


Tecnologias Utilizadas
Linguagem: C#;

Interface Gráfica: Windows Forms

Banco de Dados: SQL Server
