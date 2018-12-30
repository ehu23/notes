# Heroku Notes:

## How to deploy a server/app on Heroku using git:

0. Have heroku cli installed, i.e. `brew install heroku/brew/heroku` and a git file initialized (git init). SSH with heroku with `heroku login`
1. Make sure you are in the directory you want to deploy. Create an app and the url to reach it: `heroku create`. This will add the git remote paths, check with `git remote -v`
    - You can also create the app on heroku's website, where you can more easily specify the app name, good for frontend apps. You will not need to run `heroku create` this way.
2. If you already created the app and just want to add the git remote path, do: `heroku git:remote -a NAME_OF_APP`
3. Push on the files: `git push heroku master`
4. Open the app with: `heroku open`

## How to host a Postgres datastore on Heroku:

0. In your app's repo, check whether Heroku Postgres addon is already provisioned: `heroku addons`. 
    - If it is not, run `heroku addons:create heroku-postgresql:PLAN_NAME`, based on what your heroku account plan is, i.e. 'hobby-dev'. You can add on the version flag, i.e. `--version=9.5` to specify version.
    - Provisioning can take a few minutes. Run `heroku pg:wait`, which will block until the database is provisioned. 
1. If Postgres is provisioned, DATABASE_URL environmental variable is added to the app's config. Check all environment vars with `heroku config`. 
2. Get general info about your database with `heroku pg:info`
3. Connect to it with `heroku pg:psql`
4. Connect your Node.js App to the Database

In your code where you connect the server to the database, have just these properties:
```
connectionString: process.env.DATABASE_URL,
ssl: true
```

## How to empty heroku's remote repo

1. Install a heroku plugin called heroku-repo:
    `heroku plugins:install heroku-repo`
2. Which gives the option to clear heroku repos with:
	`heroku repo:reset -a APP_NAME`
3. Then, you just push to the repo as normal.

## Heroku Troubleshooting:

Display recent logs and real-time logs live:
`heroku logs --tail`

## Misc. Heroku Specific Notes

- Without a Procfile, heroku will run `npm start` automatically.
- Any modules in devDependencies of package-lock.json will be pruned, i.e. removed, so make sure you do not use anything from there when the server runs! (AHHEM...nodemon)

