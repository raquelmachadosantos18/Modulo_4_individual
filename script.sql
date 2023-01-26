CREATE TABLE [instituicao] (
  [id_instituicao] nvarchar(255) PRIMARY KEY NOT NULL,
  [id_cursos] nvarchar(255)
)
GO

CREATE TABLE [cursos] (
  [id_cursos] nvarchar(255) PRIMARY KEY NOT NULL,
  [nome] nvarchar(255),
  [id_instituicao] nvarchar(255),
  [id_turma] nvarchar(255),
  [grade_curricular] nvarchar(255),
  [area_de_atuacao] nvarchar(255),
  [nivel] nvarchar(255)
)
GO

CREATE TABLE [turma] (
  [id_turma] nvarchar(255) PRIMARY KEY NOT NULL,
  [id_curso] nvarchar(255),
  [cpf_aluno] nvarchar(255),
  [cpf_professor] nvarchar(255),
  [data_inicio] date,
  [data_termino] date
)
GO

CREATE TABLE [aluno] (
  [cpf_aluno] nvarchar(255) PRIMARY KEY NOT NULL,
  [nome] nvarchar(255),
  [id_turma] nvarchar(255)
)
GO

CREATE TABLE [professor] (
  [cpf_professor] nvarchar(255) PRIMARY KEY NOT NULL,
  [id_turma] nvarchar(255)
)
GO

CREATE TABLE [disciplina] (
  [id_disciplina] nvarchar(255) PRIMARY KEY NOT NULL,
  [id_professor] nvarchar(255),
  [id_turma] nvarchar(255)
)
GO

ALTER TABLE [cursos] ADD FOREIGN KEY ([id_instituicao]) REFERENCES [instituicao] ([id_instituicao])
GO

ALTER TABLE [cursos] ADD FOREIGN KEY ([id_turma]) REFERENCES [turma] ([id_turma])
GO

ALTER TABLE [turma] ADD FOREIGN KEY ([id_curso]) REFERENCES [cursos] ([id_cursos])
GO

ALTER TABLE [aluno] ADD FOREIGN KEY ([id_turma]) REFERENCES [turma] ([id_turma])
GO

ALTER TABLE [professor] ADD FOREIGN KEY ([id_turma]) REFERENCES [turma] ([id_turma])
GO

ALTER TABLE [disciplina] ADD FOREIGN KEY ([id_professor]) REFERENCES [professor] ([cpf_professor])
GO

ALTER TABLE [disciplina] ADD FOREIGN KEY ([id_turma]) REFERENCES [turma] ([id_turma])
GO
