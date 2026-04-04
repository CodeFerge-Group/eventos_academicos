
 Sistema de Gestão de Eventos Académicos

Este projeto é uma aplicação web desenvolvida em Python com o framework Flask, focada na gestão completa de eventos, desde a inscrição de participantes até à geração de relatórios de faturação.

	Tecnologias e Ferramentas

	Backend: Python 3.14 + Flask 
	Base de Dados: MySQL (SGBD: phpMyAdmin) 
	Interface Admin: Flask-Admin (Gestão de Tabelas) 
	Relatórios: xhtml2pdf (Geração de comprovativos em PDF) 
	Estilização: HTML5, CSS3 e Bootstrap 

	Estrutura do Projeto

	app.py: O coração da aplicação (rotas, lógica de negócio e modelos).
	templates/: Ficheiros HTML (Inscrição, Pagamento, Home e relatório).
	static/: Ficheiros CSS, JS e pasta de uploads/ para os comprovativos.
	database/: (Recomendado) Ficheiro .sql com o dump das tabelas.

	Funcionamento do Sistema

	Inscrição Inteligente: O sistema identifica automaticamente se o evento é gratuito ou pago com base no preço definido no banco de dados.
	Fluxo de Pagamento: Para eventos pagos, o participante é redirecionado para carregar a foto do comprovativo de transferência.
	Validação: O Administrador utiliza o painel /admin para validar os pagamentos pendentes.
	Relatórios: Geração automática de PDFs com a lista de inscritos e o total faturado por evento.

	Base de Dados (workshopbd)

	O banco de dados utiliza Triggerse Constraints para garantir a integridade:
	Validação automática de datas (Início < Fim) do evento.
	Verificação de idade (Impede datas de nascimento no futuro).	Máscara de telefone obrigatória para o padrão de Angola (+244). 
