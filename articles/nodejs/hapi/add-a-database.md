# Add a Database

## Configure
You can add a database to your app by simply adding a data component to your `boxfile.yml`:

<div class="meta" data-class="snippet" data-optional-components="postgres,mysql,mongo,rethinkdb" ></div>

In the above snippet `db` is the unique identifier of this component. It can be anything you choose as long as it is unique.

Nanobox generates the following environment variables based off that name:

* `DATA_DB_HOST` : auto-generated unique host ip
* `DATA_DB_USER` : user to connect with
* `DATA_DB_PASS` : unique password

For databases that require a name, the name will always be `gonano`.

**HEADS UP**: The next time you `nanobox run` your database will be provisioned.

## Connect
Before connecting to the database, you'll first need to install the `pg-promise` adapter:

```bash
# drop into a nanobox console
nanobox run

# install npm package
npm install pg-promise --save

# exit the console
exit
```

Then create a `database.js` with the following:

```javascript
var pgp = require("pg-promise")(/*options*/);
var db = pgp("postgres://${process.env.DATA_DB_USER}:${process.env.DATA_DB_PASS}@${process.env.DATA_DB_HOST}/gonano");
```

**HEADS UP**: Any database created by nanobox will *always* be named `gonano`

## Test

#### From an external client
You can connect directly to your database from an <a href="https://docs.nanobox.io/data-management/managing-local-data/" target="\_blank">external client</a>.

#### From Hapi
Your can also test the connection with Hapi:

```bash
nanobox run npm start
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Frontend Javascript](/nodejs/hapi/frontend-javascript)
* [Local Environment Variables](/nodejs/hapi/local-evars)
* [Back to Hapi overview](/nodejs/hapi)
