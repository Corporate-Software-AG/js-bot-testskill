FROM node:14-alpine
ENV NODE_ENV=production
ENV MicrosoftAppId=
ENV MicrosoftAppPassword=
ENV AllowedCallers=*

ENV LuisAppId=
ENV LuisAPIKey=
ENV LuisAPIHostName=

WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 3978
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
