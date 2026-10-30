CREATE DATABASE NutriReceitas;
USE NutriReceitas;

CREATE TABLE usuarios (
    usuario_ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_nascimento DATE,
    data_cadastro DATE NOT NULL
);

CREATE TABLE dietas (
    dieta_ID INT AUTO_INCREMENT PRIMARY KEY,
    nome_dieta VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

CREATE TABLE receitas (
    receita_ID INT AUTO_INCREMENT PRIMARY KEY,
    nome_receita VARCHAR(100) NOT NULL,
    descricao TEXT,
    tempo_preparo INT NOT NULL,
    calorias INT NOT NULL,
    proteinas DECIMAL(6,2) NOT NULL,
    carboidratos DECIMAL(6,2) NOT NULL,
    gorduras DECIMAL(6,2) NOT NULL
);

CREATE TABLE ingredientes (
    ingrediente_ID INT AUTO_INCREMENT PRIMARY KEY,
    nome_ingrediente VARCHAR(100) NOT NULL UNIQUE,
    unidade_medida VARCHAR(20) NOT NULL
);

CREATE TABLE receita_ingredientes (
    receita_ID INT NOT NULL,
    ingrediente_ID INT NOT NULL,
    quantidade DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (receita_ID, ingrediente_ID),
    FOREIGN KEY (receita_ID) REFERENCES receitas(receita_ID),
    FOREIGN KEY (ingrediente_ID) REFERENCES ingredientes(ingrediente_ID)
);

CREATE TABLE usuario_dietas (
    usuario_ID INT NOT NULL,
    dieta_ID INT NOT NULL,
    PRIMARY KEY (usuario_ID, dieta_ID),
    FOREIGN KEY (usuario_ID) REFERENCES usuarios(usuario_ID),
    FOREIGN KEY (dieta_ID) REFERENCES dietas(dieta_ID)
);

CREATE TABLE avaliacoes (
    avaliacao_ID INT AUTO_INCREMENT PRIMARY KEY,
    usuario_ID INT NOT NULL,
    receita_ID INT NOT NULL,
    nota INT NOT NULL,
    comentario VARCHAR(255),
    data_avaliacao DATE NOT NULL,
    CONSTRAINT chk_nota CHECK (nota BETWEEN 1 AND 5),
    FOREIGN KEY (usuario_ID) REFERENCES usuarios(usuario_ID),
    FOREIGN KEY (receita_ID) REFERENCES receitas(receita_ID)
);

INSERT INTO usuarios (usuario_ID, nome, email, data_nascimento, data_cadastro) VALUES
(1, 'Ana Souza', 'ana.souza@example.com', '2001-03-12', '2026-01-10'),
(2, 'Bruno Lima', 'bruno.lima@example.com', '1998-07-21', '2026-01-12'),
(3, 'Camila Rocha', 'camila.rocha@example.com', '2003-11-05', '2026-01-15'),
(4, 'Diego Alves', 'diego.alves@example.com', '1995-02-18', '2026-01-18'),
(5, 'Eduarda Martins', 'eduarda.martins@example.com', '2000-09-30', '2026-01-20'),
(6, 'Felipe Costa', 'felipe.costa@example.com', '1999-05-14', '2026-01-23'),
(7, 'Gabriela Nunes', 'gabriela.nunes@example.com', '2002-12-02', '2026-01-25'),
(8, 'Henrique Melo', 'henrique.melo@example.com', '1997-04-09', '2026-02-01'),
(9, 'Isabela Ferreira', 'isabela.ferreira@example.com', '2001-08-17', '2026-02-03'),
(10, 'João Ribeiro', 'joao.ribeiro@example.com', '1996-06-28', '2026-02-05'),
(11, 'Karen Oliveira', 'karen.oliveira@example.com', '2004-01-11', '2026-02-07'),
(12, 'Lucas Barros', 'lucas.barros@example.com', '1998-10-23', '2026-02-10'),
(13, 'Mariana Cardoso', 'mariana.cardoso@example.com', '2000-02-06', '2026-02-13'),
(14, 'Nicolas Mendes', 'nicolas.mendes@example.com', '2003-07-19', '2026-02-16'),
(15, 'Olívia Santos', 'olivia.santos@example.com', '1999-12-24', '2026-02-18'),
(16, 'Pedro Teixeira', 'pedro.teixeira@example.com', '1994-03-03', '2026-02-20'),
(17, 'Rafaela Gomes', 'rafaela.gomes@example.com', '2002-05-26', '2026-02-23'),
(18, 'Samuel Azevedo', 'samuel.azevedo@example.com', '1997-09-08', '2026-02-25'),
(19, 'Talita Freitas', 'talita.freitas@example.com', '2001-01-29', '2026-03-01'),
(20, 'Vitor Carvalho', 'vitor.carvalho@example.com', '1996-11-16', '2026-03-03');

INSERT INTO dietas (dieta_ID, nome_dieta, descricao) VALUES
(1, 'Mediterrânea', 'Prioriza vegetais, leguminosas, grãos integrais e gorduras insaturadas.'),
(2, 'Vegetariana', 'Exclui carnes e peixes; pode incluir ovos e laticínios.'),
(3, 'Vegana', 'Exclui alimentos e ingredientes de origem animal.'),
(4, 'Low Carb', 'Reduz a proporção de carboidratos na alimentação.'),
(5, 'Cetogênica', 'Estratégia alimentar com carboidratos muito reduzidos.'),
(6, 'Sem Glúten', 'Evita trigo, cevada, centeio e fontes de glúten.'),
(7, 'Sem Lactose', 'Evita lactose ou utiliza versões sem lactose.'),
(8, 'DASH', 'Padrão alimentar com foco em alimentos in natura e menor sódio.'),
(9, 'Flexitariana', 'Prioriza vegetais e inclui alimentos animais ocasionalmente.'),
(10, 'Hipocalórica', 'Plano com redução de energia, individualizado conforme necessidade.'),
(11, 'Hiperproteica', 'Padrão com maior participação de proteínas, conforme necessidade.'),
(12, 'Pescetariana', 'Exclui carnes terrestres, mas inclui peixes e frutos do mar.'),
(13, 'Plant-Based', 'Prioriza alimentos de origem vegetal.'),
(14, 'Controle de Açúcar', 'Organiza escolhas para moderar açúcares adicionados.'),
(15, 'Equilibrada', 'Busca variedade e proporções adequadas entre grupos alimentares.');

INSERT INTO receitas (receita_ID, nome_receita, descricao, tempo_preparo, calorias, proteinas, carboidratos, gorduras) VALUES
(1, 'Salada mediterrânea de grão-de-bico', 'Salada fria com grão-de-bico, tomate e pepino.', 15, 320, 13.50, 42.00, 9.20),
(2, 'Omelete de espinafre', 'Ovos preparados com espinafre e queijo branco.', 12, 285, 22.00, 8.50, 18.00),
(3, 'Bowl de quinoa e legumes', 'Quinoa com legumes assados e molho de limão.', 25, 390, 12.00, 58.00, 11.00),
(4, 'Sopa de lentilha', 'Sopa de lentilha com cenoura e temperos.', 35, 310, 18.00, 48.00, 5.50),
(5, 'Frango grelhado com batata-doce', 'Frango grelhado servido com batata-doce assada.', 30, 430, 38.00, 42.00, 10.00),
(6, 'Tofu salteado com brócolis', 'Tofu e brócolis salteados com molho de soja.', 20, 295, 20.00, 18.00, 15.00),
(7, 'Iogurte com aveia e frutas', 'Iogurte natural com aveia, banana e morango.', 5, 260, 12.00, 39.00, 6.50),
(8, 'Panqueca de banana e aveia', 'Panqueca simples de banana, aveia e ovo.', 15, 305, 13.00, 43.00, 8.00),
(9, 'Peixe assado com ervas', 'Filé de peixe assado com ervas e limão.', 28, 345, 34.00, 12.00, 16.00),
(10, 'Macarrão integral ao tomate', 'Macarrão integral com molho de tomate caseiro.', 25, 410, 14.00, 66.00, 9.00),
(11, 'Wrap de homus e vegetais', 'Wrap recheado com homus, alface e cenoura.', 10, 330, 11.00, 46.00, 10.50),
(12, 'Arroz integral com feijão', 'Combinação tradicional com arroz integral e feijão.', 30, 375, 14.50, 68.00, 3.80),
(13, 'Creme de abóbora', 'Creme de abóbora com gengibre e sementes.', 25, 220, 5.50, 28.00, 9.00),
(14, 'Salada de atum e feijão-branco', 'Salada proteica com atum, feijão-branco e folhas.', 15, 350, 29.00, 31.00, 11.00),
(15, 'Vitamina de frutas com chia', 'Bebida de frutas com leite e sementes de chia.', 7, 240, 9.00, 34.00, 8.50);

INSERT INTO ingredientes (ingrediente_ID, nome_ingrediente, unidade_medida) VALUES
(1, 'Grão-de-bico', 'g'),
(2, 'Tomate', 'g'),
(3, 'Pepino', 'g'),
(4, 'Ovo', 'unidade'),
(5, 'Espinafre', 'g'),
(6, 'Quinoa', 'g'),
(7, 'Abobrinha', 'g'),
(8, 'Lentilha', 'g'),
(9, 'Cenoura', 'g'),
(10, 'Peito de frango', 'g'),
(11, 'Batata-doce', 'g'),
(12, 'Tofu', 'g'),
(13, 'Brócolis', 'g'),
(14, 'Iogurte natural', 'g'),
(15, 'Aveia', 'g'),
(16, 'Banana', 'unidade'),
(17, 'Filé de peixe', 'g'),
(18, 'Macarrão integral', 'g'),
(19, 'Homus', 'g'),
(20, 'Abóbora', 'g');

INSERT INTO receita_ingredientes (receita_ID, ingrediente_ID, quantidade) VALUES
(1, 1, 100.00),
(1, 2, 60.00),
(1, 3, 40.00),
(2, 4, 2.00),
(2, 5, 50.00),
(3, 6, 80.00),
(3, 7, 100.00),
(4, 8, 120.00),
(4, 9, 50.00),
(5, 10, 150.00),
(5, 11, 120.00),
(6, 12, 120.00),
(6, 13, 100.00),
(7, 14, 150.00),
(7, 15, 25.00),
(8, 16, 1.00),
(9, 17, 160.00),
(10, 18, 90.00),
(11, 19, 60.00),
(13, 20, 200.00);

INSERT INTO usuario_dietas (usuario_ID, dieta_ID) VALUES
(1, 1),
(2, 4),
(3, 2),
(4, 10),
(5, 3),
(6, 11),
(7, 9),
(8, 8),
(9, 6),
(10, 15),
(11, 13),
(12, 4),
(13, 1),
(14, 14),
(15, 12),
(16, 10),
(17, 2),
(18, 7),
(19, 15),
(20, 9);

INSERT INTO avaliacoes (avaliacao_ID, usuario_ID, receita_ID, nota, comentario, data_avaliacao) VALUES
(1, 1, 1, 5, 'Fresca e fácil de preparar', '2026-03-04'),
(2, 2, 2, 4, 'Boa opção para o café da manhã', '2026-03-05'),
(3, 3, 3, 5, 'Gostei da combinação de legumes', '2026-03-06'),
(4, 4, 4, 4, 'Saborosa e rende bem', '2026-03-07'),
(5, 5, 5, 4, 'Prática para uma refeição completa', '2026-03-08'),
(6, 6, 6, 5, 'Boa alternativa sem carne', '2026-03-09'),
(7, 7, 7, 4, 'Lanche rápido', '2026-03-10'),
(8, 8, 8, 5, 'Fácil de fazer', '2026-03-11'),
(9, 9, 9, 4, 'Temperos funcionam muito bem', '2026-03-12'),
(10, 10, 10, 3, 'Boa, mas exige atenção ao tempo', '2026-03-13'),
(11, 11, 11, 4, 'Prática para levar', '2026-03-14'),
(12, 12, 12, 5, 'Combinação clássica', '2026-03-15'),
(13, 13, 13, 4, 'Leve e reconfortante', '2026-03-16'),
(14, 14, 14, 5, 'Saborosa e rica em proteína', '2026-03-17'),
(15, 15, 15, 4, 'Boa para variar o lanche', '2026-03-18'),
(16, 16, 1, 4, 'Faria novamente', '2026-03-19'),
(17, 17, 2, 5, 'Rápida e nutritiva', '2026-03-20'),
(18, 18, 3, 4, 'Boa textura', '2026-03-21'),
(19, 19, 5, 3, 'Gostei, mas prefiro mais tempero', '2026-03-22'),
(20, 20, 14, 5, 'Ótima salada', '2026-03-23');
