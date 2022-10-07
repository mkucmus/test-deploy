FROM node:18-alpine

RUN npm install -g pnpm
RUN mkdir /app
RUN chown node:node /app

COPY --chown=node:node . /app

USER node
WORKDIR /app

RUN pnpm i --shamefully-hoist
RUN pnpm build


EXPOSE 3000

CMD pnpm preview