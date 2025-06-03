CREATE TABLE `Usuarios` (
  `id_usuario` INT,
  `nome_usuario` TEXT,
  `senha_hash` TEXT,
  `nome_completo` TEXT,
  `email` TEXT,
  `perfil` TEXT,
  `data_criacao` TEXT
);
INSERT INTO `Usuarios` VALUES (1, 'admin', 'scrypt:32768:8:1$k3V9GWlo0QuhEedS$ade7046c23753234eb1c841cc8c1fae452ac79d9931c4712e146c7941a216b5e5f8966cf75bb69d3c1771ab4eeb816d9b3cbb4cd09bb8276f33aa1385a0e8f01', 'Administrador', 'admin@example.com', 'supervisor', '2025-05-20 10:51:24.655595');
INSERT INTO `Usuarios` VALUES (2, 'operador', 'scrypt:32768:8:1$rSZGK5yaUWlhsLRW$5891335058d9b5538746b398aa56477f8fc7ed76570f4bb7d128eceecef4a97e11e1abc6da418f2e5d0611a9992c288fd5db73b7411eba8da23a4a6c263b31a2', 'Operador', 'operador@example.com', 'operador', '2025-05-20 10:51:24.818834');
CREATE TABLE `DefeitosComuns` (
  `id_defeito` INT,
  `titulo` TEXT,
  `categoria` TEXT,
  `descricao` TEXT,
  `causas` TEXT,
  `solucao` TEXT,
  `imagem_path` TEXT,
  `data_criacao` TEXT
);
INSERT INTO `DefeitosComuns` VALUES (1, 'Sangria Insuficiente', 'Crítico', 'Arquivos com sangria menor que 5mm podem resultar em bordas brancas indesejadas após o corte.', 'Configuração incorreta do documento, desconhecimento das especificações de impressão, conversão inadequada entre formatos de arquivo.', 'Solicitar ao cliente arquivo com sangria mínima de 5mm em todos os lados ou, se possível, estender elementos gráficos manualmente.', 'images/sangria_insuficiente.jpg', '2025-05-20 10:51:24.831940');
INSERT INTO `DefeitosComuns` VALUES (2, 'Trapping Incorreto', 'Técnico', 'Falhas no trapping podem causar espaços brancos ou sobreposições indesejadas entre cores adjacentes durante a impressão.', 'Configurações inadequadas de trapping, uso de cores especiais sem ajustes apropriados, diferenças de expansão entre tintas.', 'Aplicar trapping adequado (geralmente 0.1 a 0.5pt) dependendo do tipo de impressão e substrato. Verificar áreas críticas onde cores contrastantes se encontram.', 'images/trapping_incorreto.jpg', '2025-05-20 10:51:24.831943');
INSERT INTO `DefeitosComuns` VALUES (3, 'Resolução Baixa de Imagens', 'Qualidade', 'Imagens com menos de 300 DPI podem aparecer pixeladas ou borradas na impressão final.', 'Uso de imagens da web (72 DPI), ampliação excessiva de imagens pequenas, compressão excessiva de JPEGs.', 'Solicitar ao cliente imagens em alta resolução (mínimo 300 DPI no tamanho final). Em casos urgentes, utilizar software de upscaling com IA para melhorar a qualidade.', 'images/resolucao_baixa.jpg', '2025-05-20 10:51:24.831944');
CREATE TABLE `Conferencias` (
  `id_conferencia` INT,
  `id_usuario_responsavel` INT,
  `numero_os` TEXT,
  `nome_cliente_projeto` TEXT,
  `nome_arquivo_original` TEXT,
  `data_inicio_conferencia` TEXT,
  `data_fim_conferencia` TEXT,
  `observacoes_gerais` TEXT,
  `status_conferencia` TEXT
);
INSERT INTO `Conferencias` VALUES (1, 1, '012025', 'teste', 'teste', '2025-05-21 21:12:46.379232', '2025-05-21 21:12:46.376897', 'teste', 'Aprovado');
CREATE TABLE `ItensConferencia` (
  `id_item_conferencia` INT,
  `id_conferencia` INT,
  `codigo_item_checklist` TEXT,
  `descricao_item_checklist` TEXT,
  `resposta` TEXT,
  `observacao_item` TEXT
);
INSERT INTO `ItensConferencia` VALUES (1, 1, 'TAMANHO_ARQUIVO', 'O TAMANHO DO ARQUIVO ESTÁ DE ACORDO?', 'Conforme', '');
INSERT INTO `ItensConferencia` VALUES (2, 1, 'MODO_COR_OS', 'O ARQUIVO ESTÁ NO MODO DE COR CONFORME SOLICITADO NA O.S?', 'Conforme', '');
INSERT INTO `ItensConferencia` VALUES (3, 1, 'SANGRIA_5MM', 'O ARQUIVO POSSUI SANGRIA DE NO MÍNIMO 5MM?', 'Conforme', '');
INSERT INTO `ItensConferencia` VALUES (4, 1, 'PDF_X1A_2001', 'O ARQUIVO ESTÁ SALVO EM PDF X1-A/2001?', 'Conforme', '');
INSERT INTO `ItensConferencia` VALUES (5, 1, 'IMAGENS_300DPI_CMYK', 'VERIFIQUE SE TODAS AS IMAGENS ESTÃO COM NO MÍNIMO 300DPI''S DE QUALIDADE E SE TODAS FORAM CONVERTIDAS PARA CMYK.', 'Conforme', '');
INSERT INTO `ItensConferencia` VALUES (6, 1, 'SINALIZACAO_DESTAQUE', 'VERIFIQUE SE FOI FEITO SINALIZAÇÃO PARA O DESTAQUE.', 'Conforme', '');
INSERT INTO `ItensConferencia` VALUES (7, 1, 'PRETO_TEXTOS_OBJETOS', 'VERIFIQUE A PORCENTAGEM DO PRETO NOS TEXTOS E DEMAIS OBJETOS (C=0, M=0, Y=0, K=100%).', 'Conforme', '');
INSERT INTO `ItensConferencia` VALUES (8, 1, 'ORTOGRAFIA_DIAGRAMACAO', 'VERIFIQUE A ORTOGRAFIA E A DIAGRAMAÇÃO DO DOCUMENTO.', 'Conforme', '');
INSERT INTO `ItensConferencia` VALUES (9, 1, 'RESERVA_COLA', 'VERIFIQUE SE O ARQUIVO ESTÁ COM RESERVA DE COLA (se aplicável).', 'Conforme', '');
INSERT INTO `ItensConferencia` VALUES (10, 1, 'FACA_SOBREPOSTA_PANTONE', 'VERIFIQUE SE A FACA ESTÁ SOBREPOSTA E EM PANTONE (ou cor especial definida).', 'Conforme', '');
INSERT INTO `ItensConferencia` VALUES (11, 1, 'NOMENCLATURA_PDF', 'VERIFIQUE NOMENCLATURA NO PDF, COM NOME, NÚMERO O.S E QUANTIDADE DE IMPRESSÃO.', 'Conforme', '');
INSERT INTO `ItensConferencia` VALUES (12, 1, 'SOLICITACAO_PRODUCAO', 'FOI FEITO A SOLICITAÇÃO DA PRODUÇÃO DA (FACA, CLICHÊ, FOTOLITO) SE HOUVER?', 'Conforme', '');
CREATE TABLE `ProcessosAdicionaisConferencia` (
  `id_processo_conferencia` INT,
  `id_conferencia` INT,
  `montou_boneca` TEXT,
  `referencia_cor` TEXT,
  `detalhe_referencia_cor` TEXT,
  `deu_baixa_chapas` TEXT,
  `fez_apontamento_sistema` TEXT
);
INSERT INTO `ProcessosAdicionaisConferencia` VALUES (1, 1, 'Sim', 'Monitor', 'etete', 'Sim', 'Sim');
