FROM node:21-alpine3.18 AS builder
WORKDIR /app
COPY . .
RUN npm ci --silent
RUN npm run build
RUN npm prune --omit=dev

FROM node:21-alpine3.18 AS runner
WORKDIR /app
COPY --from=builder /app/.next /app/.next
COPY --from=builder /app/node_modules /app/node_modules
COPY --from=builder /app/package.json /app/package.json
COPY --from=builder /app/public /app/public

ENV PORT=80
EXPOSE 80
ENTRYPOINT ["npm", "start"]