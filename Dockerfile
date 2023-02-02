###################
# FOR BASE STAGE
###################

FROM node:lts-alpine as base

ENV NODE_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

RUN npm i -g pnpm

RUN mkdir -p /home/node/app && chown node:node /home/node/app

WORKDIR /home/node/app

USER node

COPY --chown=node:node package*.json pnpm-lock.yaml ./


###################
# FOR BUILD STAGE
###################

FROM base as build

RUN pnpm install --frozen-lockfile

COPY --chown=node:node . ./

RUN pnpm build

########################
# FOR PRODUCTION STAGE
########################

FROM base AS production

ENV NODE_ENV=production

RUN pnpm install --frozen-lockfile --prod

COPY --chown=node --from=build /home/node/app/dist/ ./dist

CMD ["node", "main.js"]
