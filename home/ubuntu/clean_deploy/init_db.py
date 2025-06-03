from app import app, db
from app import Usuario, DefeitoComum
from werkzeug.security import generate_password_hash
import datetime

# Criar as tabelas do banco de dados
with app.app_context():
    db.create_all()
    
    # Verificar se já existe um usuário admin
    if not Usuario.query.filter_by(nome_usuario='admin').first():
        # Criar usuário admin padrão
        admin = Usuario(
            nome_usuario='admin',
            senha_hash=generate_password_hash('admin123'),
            nome_completo='Administrador',
            email='admin@example.com',
            perfil='supervisor',
            data_criacao=datetime.datetime.utcnow()
        )
        db.session.add(admin)
        
        # Criar usuário operador padrão
        operador = Usuario(
            nome_usuario='operador',
            senha_hash=generate_password_hash('operador123'),
            nome_completo='Operador',
            email='operador@example.com',
            perfil='operador',
            data_criacao=datetime.datetime.utcnow()
        )
        db.session.add(operador)
        
        db.session.commit()
        print("Usuários padrão criados com sucesso!")
    else:
        print("Usuários já existem no banco de dados.")
    
    # Inicializar biblioteca de defeitos
    if DefeitoComum.query.count() == 0:
        # Adicionar alguns defeitos comuns como exemplos
        defeitos = [
            {
                "titulo": "Sangria Insuficiente",
                "categoria": "Crítico",
                "descricao": "Arquivos com sangria menor que 5mm podem resultar em bordas brancas indesejadas após o corte.",
                "causas": "Configuração incorreta do documento, desconhecimento das especificações de impressão, conversão inadequada entre formatos de arquivo.",
                "solucao": "Solicitar ao cliente arquivo com sangria mínima de 5mm em todos os lados ou, se possível, estender elementos gráficos manualmente.",
                "imagem_path": "images/sangria_insuficiente.jpg"
            },
            {
                "titulo": "Trapping Incorreto",
                "categoria": "Técnico",
                "descricao": "Falhas no trapping podem causar espaços brancos ou sobreposições indesejadas entre cores adjacentes durante a impressão.",
                "causas": "Configurações inadequadas de trapping, uso de cores especiais sem ajustes apropriados, diferenças de expansão entre tintas.",
                "solucao": "Aplicar trapping adequado (geralmente 0.1 a 0.5pt) dependendo do tipo de impressão e substrato. Verificar áreas críticas onde cores contrastantes se encontram.",
                "imagem_path": "images/trapping_incorreto.jpg"
            },
            {
                "titulo": "Resolução Baixa de Imagens",
                "categoria": "Qualidade",
                "descricao": "Imagens com menos de 300 DPI podem aparecer pixeladas ou borradas na impressão final.",
                "causas": "Uso de imagens da web (72 DPI), ampliação excessiva de imagens pequenas, compressão excessiva de JPEGs.",
                "solucao": "Solicitar ao cliente imagens em alta resolução (mínimo 300 DPI no tamanho final). Em casos urgentes, utilizar software de upscaling com IA para melhorar a qualidade.",
                "imagem_path": "images/resolucao_baixa.jpg"
            }
        ]
        
        for defeito_data in defeitos:
            defeito = DefeitoComum(**defeito_data)
            db.session.add(defeito)
        
        db.session.commit()
        print("Biblioteca de defeitos inicializada com sucesso!")
    else:
        print("Biblioteca de defeitos já inicializada.")

print("Inicialização do banco de dados concluída!")
