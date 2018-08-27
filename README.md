# sistock
sistock
Descrição do projeto e das tecnologias utilizadas:
1.	Delphi 7
2.	Banco de dados MYSQL, eu utilizei o pacote XAMPP para instalar o banco de dados mysql. Link para download: https://www.apachefriends.org/download.html baixe a versão 7.0.31.
3.	Componente ZEOS para conexões e CRUD com banco de dados Link de instrução: https://www.devmedia.com.br/instalando-o-zeos-em-7-passos/12306
4.	Report Build para gerar relatórios
Instruções para configuração da aplicação:
1.	Baixe todos arquivos do repositório no diretório raiz C:, então será criado uma pasta chamada C:\sistock. Dentro do diretório C:\sistock existem as subpastas: a. zeos: arquivos para configuração do componente zeos. b. Script do banco: onde consta o arquivo com script para criação das tabelas do banco de dados. c. sistock: Essa pasta contém também os arquivos do banco de dados, caso você não queira usar o script pode copiar toda essa pasta pra dentro da pasta C:\xampp\mysql\data, dessa forma você já terá o banco de dados sistock criado no mysql.
2.	Execute o arquivo Instalador_BDE_5.2_Compacto, com next, next até finalizar a instalação.
3.	Depois de ter instalado o banco de dados mysql e criado o banco com suas respectivas tabelas, abra o arquivo Banco_de_Dados.exe no diretório C:\sistock e informe o Host, Banco, Login e senha do banco de dados mysql. Obs.: Quando alterar essas informações tecle seta pra baixo e pra cima para que seja gravado as informações na tabela em seguida feche a janela.
 
Obs.: Não esqueça de dá o start do serviço do banco mysql
Instruções para utilização da aplicação: Para acessar a aplicação, que vai pedir apenas uma senha. Senha: 123456
A aplicação está dividio em 3 Módulos:
 
1.	Sistock - Cadastro de produtos, clientes, relatório de vendas, forma de pagamento, vendedores e etc..
 
2.	Vendas - Para Vendas
3.	Caixa - Um pequeno relatório de caixa.
Obs.: No diretório C:\sistock estou disponibilizando o Manual de Instrução Ilustrado.doc

 
