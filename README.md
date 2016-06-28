## Random content store

Sinatra that mimics the content-store but returns random content. Uses the
[govuk_schemas gem](https://github.com/alphagov/govuk_schemas_gem).

### Run locally

```
bundle install
bundle exec ruby server.rb
```

Visit the site:

http://localhost:4567/


### Deployment

This project is hosted on Heroku:

https://govuk-random-content-store.herokuapp.com/content/detailed_guide

We auto-deploy the `master` branch to this application so merging a PR will
be enough to release.

### Use with frontend app

You can run GOV.UK frontend apps with this app as the content-store:

```
cd ~/govuk/government-frontend
GOVUK_WEBSITE_ROOT=https://www.gov.uk \
PLEK_SERVICE_STATIC_URI=assets.digital.cabinet-office.gov.uk \
PLEK_SERVICE_CONTENT_STORE_URI=https://govuk-random-content-store.herokuapp.com ./startup.sh
```

Now visit:

http://government-frontend.dev.gov.uk/detailed_guide

### Examples

- [Finder](https://govuk-random-content-store.herokuapp.com/content/finder)
- [Topic](https://govuk-random-content-store.herokuapp.com/content/topic)
- [Manual](https://govuk-random-content-store.herokuapp.com/content/manual)
