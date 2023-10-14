CREATE DATABASE clinica

USE clinica

CREATE TABLE especialidade (
ID							INT				NOT NULL,
especialidade				VARCHAR(100)	NOT NULL
PRIMARY KEY(ID)
)

CREATE TABLE medico (
codigo						INT				NOT NULL,
nome						VARCHAR(100)	NOT NULL,
logradouro					VARCHAR(200)	NOT NULL,
numero						INT				NOT NULL,
CEP							CHAR(8)			NOT NULL,
complemento					VARCHAR(255)	NOT NULL,
contato						VARCHAR(11)		NOT NULL,
especialidadeID				INT				NOT NULL
PRIMARY KEY(codigo)
FOREIGN KEY (especialidadeID) REFERENCES especialidade(ID)
)

CREATE TABLE paciente (
num_beneficiario			INT				NOT NULL,
nome						VARCHAR(100)	NOT NULL,
logradouro					VARCHAR(200)	NOT NULL,
numero						INT				NOT NULL,
CEP							CHAR(8)			NOT NULL,
complemento					VARCHAR(255)	NOT NULL,
telefone					VARCHAR(11)		NOT NULL
PRIMARY KEY(num_beneficiario)
)

CREATE TABLE consulta (
pacientenum_beneficiario	INT				NOT NULL,
medicocodigo				INT				NOT NULL,
data_hora					DATETIME		NOT NULL,
observacao					VARCHAR(255)	NOT NULL
PRIMARY KEY(pacientenum_beneficiario, medicocodigo, data_hora)
FOREIGN KEY (pacientenum_beneficiario) REFERENCES paciente(num_beneficiario),
FOREIGN KEY (medicocodigo) REFERENCES medico(codigo)
)

INSERT INTO paciente VALUES
(99901, 'Washington Silva', 'R. Anhaia', 150, '02345000', 'Casa', '922229999'),
(99902, 'Luis Ricardo', 'R. Voluntários da Pátria', 2251, '03254010', 'Bloco B. Apto 25', '923450987'),
(99903, 'Maria Elisa', 'Av. Aguia de Haia', 1188, '06987020', 'Apto 1280', '912348765'),
(99904, 'José Araujo', 'R. XV de Novembro', 18, '03678000', 'Casa', '945674312'),
(99905, 'Joana Paula', 'R. 7 de Abril', 97, '01214000', 'Conjunto 3 - Apto 801', '912095674')

INSERT INTO especialidade VALUES
(1, 'Otorrinolaringologista'),
(2, 'Urologista'),
(3, 'Geriatria'),
(4, 'Pediatria')

INSERT INTO medico VALUES
(100001, 'Ana Paula', 'R. 7 de Setembro', 256, '03698000', 'Casa', '915689456', 1),
(100002, 'Maria Aparecida', 'Av. Brasil', 32, '02145070', 'Casa', '923235454', 1),
(100003, 'Lucas Borges', 'Av. do Estado', 3210, '05241000', 'Apto 205', '963698585', 2),
(100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, '03145000', 'Apto 602', '932458745', 3)

INSERT INTO consulta VALUES
(99901, 100002, '2021-09-04 13:20', 'Infecção Urina'),
(99902, 100003, '2021-09-04 13:15', 'Gripe'),
(99901, 100001, '2021-09-04 12:30', 'Infecção Garganta')

ALTER TABLE medico
ADD dia_atendimento VARCHAR(100) NULL

UPDATE medico
SET dia_atendimento = 'Passa a atender na 2ª feira'
WHERE codigo = 100001

UPDATE medico
SET dia_atendimento = 'Passa a atender na 4ª feira'
WHERE codigo = 100002

UPDATE medico
SET dia_atendimento = 'Passa a atender na 2ª feira'
WHERE codigo = 100003

UPDATE medico
SET dia_atendimento = 'Passa a atender na 5ª feira'
WHERE codigo = 100004

DELETE especialidade
WHERE especialidade = 'Pediatria'

EXEC sp_RENAME 'medico.dia_atendimento' , 'dia_semana_atendimento', 'COLUMN'

UPDATE medico
SET logradouro = 'Av. Bras Leme', numero = 876, complemento = 'Apto 504', CEP = '02122000'
WHERE nome = 'Lucas Borges'

ALTER TABLE consulta
ALTER COLUMN observacao VARCHAR(200) NOT NULL