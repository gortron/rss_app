# 🐻 gRSSly

[gRSSly](http://www.grssly.com) is a lightweight, open-source RSS reader built by Gordy Lanza and Flo Stagliano. We built it in a week with Rails, Postgres, and Bootstrap.

![Image of gRSSly](https://i.imgur.com/DRZ0dyk.png)

## Motivation

- We wanted to deploy our first webapp, after a week of learning Rails.
- We like code that has a _raîson d'étre_. While gRSSly isn't the first RSS reader, it's a useful utility nonetheless.
- We aimed to stretch ourselves by implementing not just Rails, but unfamiliar tools like Postgres and Bootstrap as well.
- We wanted to make our app accessible by deploying it to the web.

## Stack

- Rails/Postgres for back-end
- Rails/Bootstrap for front-end
- Deployed through Heroku
- [RSS](https://github.com/ruby/rss) gem for parsing rss feeds

## Comments

- To the Bootstrap diehards, please forgive us for our shameless misuse of the `.alert` component and `flash[:errors]` as a way to feed contextual information to users.
- To our mentor @danielkaczmarczyk, please forgive us for our shameless ~~misuse~~ _abuse_ of emojis. We're just giving the people what they want. 😎
- We were hard-pressed to build and deploy our first app in a week. Known issues we did not have time to resolve are logged in the repo.

## License

MIT © @gortron / @flow1981
