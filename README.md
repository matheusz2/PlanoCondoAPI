# PlanoCondoAPI

## Visão Geral
Breve introdução ao projeto, explicando o problema que ele resolve, quem deve usá-lo e por que. Especifique as principais funcionalidades e pontos fortes do projeto.

## Índice
- [Pré-requisitos](#pré-requisitos)
- [Configuração do Ambiente](#configuração-do-ambiente)
  - [Banco de Dados](#banco-de-dados)
  - [Clonar o Repositório](#clonar-o-repositório)
- [Instalação](#instalação)
- [Configuração](#configuração)
- [Uso](#uso)
- [Deployment](#deployment)
- [Licença](#licença)

## Pré-requisitos
Liste todos os pré-requisitos necessários para executar este projeto, incluindo software, bibliotecas e ferramentas externas. Forneça links para instalação quando aplicável.

Git
.NET 8
SQL Server


## Configuração do Ambiente

#### Configuração do Banco de Dados

Para configurar o banco de dados usando o arquivo `database.sql`, siga os passos abaixo:

1. **Localizar o Arquivo**: Navegue até a pasta `5 - Data` no diretório do projeto.

2. **Executar o Script SQL**:
   - Abra seu sistema de gerenciamento de banco de dados (por exemplo, SQL Server Management Studio, pgAdmin, etc.).
   - Conecte-se à sua instância de banco de dados.
   - Abra o arquivo `database.sql`.
   - Execute o script SQL para criar e configurar o banco de dados necessário para o projeto.

#### Observações Importantes

- Certifique-se de que as credenciais usadas para conectar ao banco de dados têm permissões suficientes para executar scripts de criação e configuração de tabelas.
- Verifique se as configurações de conexão no seu projeto estão atualizadas para refletir os parâmetros corretos do banco de dados, incluindo o nome do banco, usuário e senha.

#### Clonar o Repositório

Para obter uma cópia local do código fonte, siga estes passos:

1. **Abra o Terminal**: Utilize o terminal de sua preferência.

2. **Execute o Comando de Clonagem**:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git

## Instalação

Antes de poder executar o projeto, é necessário instalar as dependências do projeto e preparar o ambiente de desenvolvimento. Siga os passos abaixo para configurar o projeto.

### Restaurar as Dependências

O comando `dotnet restore` lê o arquivo de projeto (`.csproj`) e instala as dependências listadas:

```bash
dotnet restore
```

## Configuração

A configuração do ambiente é um passo crucial para garantir que sua aplicação funcione corretamente tanto em desenvolvimento quanto em produção. Abaixo estão detalhes sobre como configurar os principais aspectos do seu ambiente, usando o arquivo `appsettings.json` como exemplo.

### Arquivo de Configuração - `appsettings.json`

Este arquivo contém parâmetros de configuração que a aplicação irá utilizar durante a execução. Aqui está um exemplo de como este arquivo pode ser estruturado:

```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "ConnectionStrings": {
    "ConnectionSQLServer": "Server=localhost; initial catalog=PlanoCondo;uid=user;pwd=password;TrustServerCertificate=true"
  },
  "AllowedHosts": "*"
}
```

## Uso

Após ter instalado e configurado o projeto conforme as seções anteriores, você está pronto para executar a aplicação e explorar suas funcionalidades.

### Executar o Projeto

Para iniciar a aplicação, abra um terminal na pasta raiz do projeto e execute o seguinte comando:

```bash
dotnet run
```

## Deployment

O processo de deployment envolve preparar a aplicação para ser executada em um ambiente de produção, que geralmente exige otimizações para desempenho e segurança. Abaixo estão os passos detalhados para realizar o deployment de um projeto .NET Core.

### Preparação para o Deployment

Antes de publicar a aplicação, certifique-se de que todas as configurações estão adequadas para o ambiente de produção. Isso inclui strings de conexão de banco de dados, configurações de API, chaves de segurança, entre outros. Todos esses elementos devem ser revisados para evitar a exposição de dados sensíveis.

### Publicando a Aplicação

Para publicar a aplicação, utilizamos o comando `dotnet publish`. Este comando compila a aplicação, suas dependências, recursos e todos os arquivos necessários para a execução, colocando tudo no diretório de saída especificado. Execute o seguinte comando no terminal:

```bash
dotnet publish -c Release -o ./publish
```

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE.md para detalhes.
