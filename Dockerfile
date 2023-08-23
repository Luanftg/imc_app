# Use a imagem base do Flutter
FROM cirrusci/flutter

# Defina o diretório de trabalho
WORKDIR /imc_app

# Copie os arquivos do projeto para o contêiner
COPY . /imc_app

# Execute o comando flutter build web
RUN flutter clean
RUN flutter pub get
RUN flutter build web
