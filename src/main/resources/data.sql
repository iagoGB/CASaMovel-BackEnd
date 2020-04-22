INSERT INTO public.role(role_name) VALUES ('ROLE_ADMIN');
INSERT INTO public.role(role_name) VALUES ('ROLE_USER');

INSERT INTO public.categoria(id, nome) VALUES (1, 'Ciência e Tecnologia');
INSERT INTO public.categoria(id, nome) VALUES (2, 'Cultura e Arte');
INSERT INTO public.categoria(id, nome) VALUES (3, 'Educação e Pesquisa');

INSERT INTO public.usuario(
	atualizado_em, avatar, carga_horaria, cpf, criado_em, data_ingresso, departamento, email, nome, senha, telefone
)
VALUES ( 
    '2019-12-25 18:26:29.124',
    '../assets/images/default_avatar.png',
    '00:00:00',
    '99999',
    '2019-12-25 10:57:29.067', 
    '2019-12-20',
    'STI',
    'admin',
    'Administrador',
    '$2a$10$uB6.WzxcB4dflWRxBZDuZuPrLeJtdastzakqbAeP9PTdk1ZlubOum',
    '32139929'
);

INSERT INTO public.usuario(
	atualizado_em, avatar, carga_horaria, cpf, criado_em, data_ingresso, departamento, email, nome, senha, telefone
)
VALUES ( 
    '2016-09-15 14:26:29.124',
    '../assets/images/default_avatar.png',
    '00:00:00',
    '5555',
    '2019-12-25 08:27:59.067', 
    '2016-12-20',
    'ICA',
    'usuario@teste.com',
    'Usuario Dois',
    '$2a$10$uB6.WzxcB4dflWRxBZDuZuPrLeJtdastzakqbAeP9PTdk1ZlubOum',
    '83229080'
);

INSERT INTO public.usuario(
	atualizado_em, avatar, carga_horaria, cpf, criado_em, data_ingresso, departamento, email, nome, senha, telefone
)
VALUES ( 
    '2017-02-02 16:31:29.124',
    '../assets/images/default_avatar.png',
    '00:00:00',
    '6565',
    '2017-12-25 08:27:59.067', 
    '2017-10-20',
    'UFC Virtual',
    'tres@usuario.com',
    'Maria de Fátima Souza',
    '$2a$10$uB6.WzxcB4dflWRxBZDuZuPrLeJtdastzakqbAeP9PTdk1ZlubOum',
    '3498873'
);

INSERT INTO public.usuario_role(usuario_id, role_id) VALUES (1, 'ROLE_ADMIN');
INSERT INTO public.usuario_role(usuario_id, role_id) VALUES (2, 'ROLE_USER');
INSERT INTO public.usuario_role(usuario_id, role_id) VALUES (3, 'ROLE_USER');

INSERT INTO public.evento(
	id, carga_horaria, data_horario, foto, local, titulo, fk_categoria_id, esta_aberto, keyword)
	VALUES (10,2, '2020-09-10 09:00:00.067', 'caminho', 'Rua Juscelino Kubicheck','Evento Spring Boot Test', 1, true,'abcd1234-10');

INSERT INTO public.evento(
	id, carga_horaria, data_horario, foto, local, titulo, fk_categoria_id, esta_aberto,keyword)
	VALUES (20,4, '2020-04-21 14:00:00.067', 'http://localhost:8080/evento/20/evento_20.png', 'Rua Oscar Freire 1720, Centro','Treinamento de Educação a Distância Para Professores', 3, true,'YYZZ15-20');

INSERT INTO public.evento(
	id, carga_horaria, data_horario, foto, local, titulo, fk_categoria_id, esta_aberto,keyword)
	VALUES (33,3, '2020-07-22 15:00:00.067', 'http://localhost:8080/evento/33/evento_33.png', 'Rua Mentor de Alencar 2020, Centro','Conhecendo a Faculdade de Direito', 2, true,'AABc-33');

 --                 O usuario dois está cadastrado em 2 eventos ao iniciar o banco
    INSERT INTO public.evento_usuario(
        fk_evento_id, fk_usuario_id, is_present, is_subscribed)
        VALUES (20, 2, false, true);

    INSERT INTO public.evento_usuario(
        fk_evento_id, fk_usuario_id, is_present, is_subscribed)
        VALUES (33, 2, false, true);
-- 