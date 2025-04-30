# Usando a imagem base do Node.js com a versão LTS em um ambiente Alpine Linux
FROM node:lts-alpine

# Definindo o diretório de trabalho dentro do container
WORKDIR /app

COPY package.json .

# Instalando Python 3, compilador GNU C++ (g++) e utilitário make sem usar cache para reduzir o tamanho da imagem
RUN apk add --no-cache python3 g++ make

# Instalando apenas as dependências de produção usando o gerenciador de pacotes Yarn
RUN yarn install --production

# Copiando todos os arquivos do diretório atual para o diretório de trabalho no container
COPY . .

# O comando CMD especifica o comando padrão a ser executado quando o contêiner é iniciado.
CMD ["node", "src/index.js"]

# O comando EXPOSE 3000 informa ao Docker que o contêiner escutará conexões na porta 3000.
# Isso é usado para documentar a intenção de expor essa porta, mas não configura automaticamente o mapeamento de portas no host.
EXPOSE 3000

