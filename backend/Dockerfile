FROM ruby:2.7.1

#instala depencias
RUN apt update && apt install -qq -y --no-install-recommends \
  build-essential libpq-dev imagemagick curl

#instala GNUPG
RUN apt install -y gnupg

# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  nodejs yarn build-essential libpq-dev imagemagick git-all nano

#configura path do projeto
ENV INSTALL_PATH /backend

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

#configuração das gens
COPY Gemfile ./

#copia arquivos do projeto para o container
COPY . .