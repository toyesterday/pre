# Sistema de Conferência para Pré-Impressão

Este é um sistema de aplicação web desenvolvido em Flask para gerenciar checklists de conferência de arte para pré-impressão (CTP).

## Funcionalidades

*   Cadastro e Login de Usuários.
*   Criação de Novas Conferências de Pré-Impressão baseadas em um checklist.
*   Registro de itens do checklist (Conforme, Não Conforme, N/A) com observações.
*   Registro de Processos Adicionais (montagem de boneca, referência de cor, etc.).
*   Visualização detalhada das conferências salvas.
*   Geração de Relatório da Conferência em formato PDF para download.
*   Listagem das conferências criadas pelo usuário logado.

## Estrutura do Projeto

```
/sistema_conferencia/
|-- app.py                   # Arquivo principal da aplicação Flask
|-- requirements.txt         # Dependências Python do projeto
|-- database.db              # Banco de dados SQLite (com dados de teste, se houver)
|-- /templates/              # Templates HTML
|   |-- base.html
|   |-- login.html
|   |-- register.html
|   |-- index.html
|   |-- nova_conferencia.html
|   |-- conferencia_detalhe.html
|   |-- relatorio_conferencia_pdf.html
|-- /static/                 # Arquivos estáticos
|   |-- style.css
|-- /venv/                   # Ambiente virtual Python (não incluído no ZIP, recriar)
|-- README.md                # Este arquivo
```

## Como Executar Localmente (para Desenvolvimento/Teste)

1.  **Pré-requisitos:**
    *   Python 3.8 ou superior.
    *   `pip` (gerenciador de pacotes Python).
    *   `venv` (para criar ambientes virtuais, geralmente incluído com Python).

2.  **Configuração do Ambiente:**
    *   Descompacte o arquivo do projeto em um diretório de sua escolha.
    *   Navegue até o diretório raiz do projeto (`sistema_conferencia`) pelo terminal.
    *   Crie um ambiente virtual:
        ```bash
        python3 -m venv venv
        ```
    *   Ative o ambiente virtual:
        *   No Linux/macOS:
            ```bash
            source venv/bin/activate
            ```
        *   No Windows (PowerShell):
            ```bash
            .\venv\Scripts\Activate.ps1
            ```
        *   No Windows (CMD):
            ```bash
            venv\Scripts\activate.bat
            ```

3.  **Instalação das Dependências:**
    *   Com o ambiente virtual ativado, instale as dependências listadas no `requirements.txt`:
        ```bash
        pip install -r requirements.txt
        ```

4.  **Execução da Aplicação:**
    *   Ainda no diretório raiz do projeto e com o ambiente virtual ativado, execute o `app.py`:
        ```bash
        python app.py
        ```
    *   A aplicação estará rodando em `http://127.0.0.1:5000` (ou `http://localhost:5000`).
    *   Abra este endereço no seu navegador.

## Sugestões para Implantação em Produção

Para uma implantação permanente e robusta, considere as seguintes práticas:

1.  **Servidor WSGI:** Não use o servidor de desenvolvimento do Flask em produção. Utilize um servidor WSGI como Gunicorn ou uWSGI.
    *   Exemplo com Gunicorn:
        ```bash
        # Instalar Gunicorn (adicionar ao requirements.txt se for usar sempre)
        pip install gunicorn
        
        # Executar com Gunicorn (ajuste o número de workers conforme necessário)
        gunicorn -w 4 -b 0.0.0.0:8000 app:app 
        ```
        (Onde `app:app` se refere ao arquivo `app.py` e à instância `app` do Flask dentro dele).

2.  **Proxy Reverso:** Coloque um servidor web como Nginx ou Apache na frente da sua aplicação WSGI. Ele pode lidar com requisições HTTPS, servir arquivos estáticos de forma eficiente, e atuar como um balanceador de carga se necessário.

3.  **Banco de Dados:** Para produção, SQLite pode não ser a melhor escolha para aplicações com muitos acessos concorrentes ou grande volume de dados. Considere migrar para um banco de dados mais robusto como PostgreSQL ou MySQL.
    *   Se migrar, você precisará ajustar a `SQLALCHEMY_DATABASE_URI` no `app.py` e instalar o driver Python correspondente (ex: `psycopg2-binary` para PostgreSQL, `PyMySQL` para MySQL).

4.  **Variáveis de Ambiente:** Para configurações sensíveis (como a `SECRET_KEY` do Flask ou credenciais de banco de dados), use variáveis de ambiente em vez de valores fixos no código.

5.  **Segurança:**
    *   Garanta que o `debug mode` do Flask esteja DESLIGADO em produção (`app.run(debug=False)` ou não defina `debug=True` ao usar Gunicorn).
    *   Configure HTTPS (usando o proxy reverso).
    *   Mantenha as dependências atualizadas.

6.  **Gerenciamento de Processos:** Use uma ferramenta como `systemd` (no Linux) ou `supervisor` para gerenciar o processo da sua aplicação (iniciar automaticamente, reiniciar em caso de falha, etc.).

## Arquivos do Projeto

O pacote ZIP fornecido contém todos os arquivos necessários para executar e implantar esta aplicação, incluindo o banco de dados SQLite `database.db` com os dados existentes até o momento da sua criação.

Lembre-se de recriar o ambiente virtual (`venv`) e instalar as dependências (`requirements.txt`) no seu ambiente de implantação.

