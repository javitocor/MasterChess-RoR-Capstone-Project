# Masterchess - RoR Capstone Project

> This project was built on top of my knowledge of RoR.

![screenshot](/app/assets/images/screenshot1.png) ![screenshot](/app/assets/images/screenshot2.png)

## What it does

Its a social media app similar to Twitter but focus on chess players.

*As a guest user:*

- You will be able to create an account/log in.
- You can see only “Sign in” and “Sign out” page.

*As a logged-in user:*

- You will be able to see all users list.
- You will be able to see selected user page with their user name and all gambits written by them (the most recent posts on the top).
- You will be able to follow a user.
- You will see a button “Follow” next to the name of the user who you are not following yet - on both users’ list and single-user page.
- You will be able to create new gambits (text only).
- You will be able to like/dislike gambits (but you can like a single post only once).
- You will be able to add comments to gambits.
- You will be able to see “Timeline” page with gambits (with the number of likes and comments) written by you and all the user's you are following (the most recent posts on the top).
- Timeline page is the root page of the app.
- You can add your profile photo and your cover photo.
- You can search for a user or a keyword inside a gambit.

## Built With

- Ruby v2.6.5
- Ruby on Rails v5.2.4

*Gems used:*

- Devise (for user authentication)
- Simple_form
- Omniauth
- Omniauth - Facebook
- Faker
- Will Paginate
- Gems used for testing:
  - Capybara
  - Selenium webdriver
  - Chromedriver helper
  - Database cleaner
  - Rspec-rails
  - Shoulda matchers

- Rubocop

## Live Demo

[Live Demo Link](https://murmuring-crag-15929.herokuapp.com/)

## Video Presentation

[Video Presentation](https://www.loom.com/share/1b1522f11ff64b1d9da92c4ec73b3c38)

## Getting Started

To get a local copy up, clone it and running follow these simple example steps.

### Prerequisites

- Ruby: 2.6.5
- Rails: 5.2.3
- Postgres: >= 9.5

### Setup

Install gems with:

``` bash
bundle install
```

Setup database with:

``` bash
   rails db:create
   rails db:migrate
```

Create users with:

``` bash
   rails db:seed
   Log in with email: 'example-{add a number between 1-50}@microverse.org', and password:'password'
```

### Usage

Start server with:

``` bash
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

``` bash
    rpsec
```

### Deployment

- App deployed in Heroku.
## Future Features
- Add Twitter and Facebook authentication

## Author

👤 **Javier Oriol Correas Sanchez Cuesta**

- Github: [@javitocor](https://github.com/javitocor)
- Twitter: [@JavierCorreas4](https://twitter.com/JavierCorreas4)
- Linkedin: [Javier Oriol Correas Sanchez Cuesta](https://www.linkedin.com/in/javier-correas-sanchez-cuesta-15289482/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome! Start by:

- Forking the project.
- Cloning the project to your local machine.
- cd into the project directory.
- Run git checkout -b your-branch-name.
- Make your contributions.
- Push your branch up to your forked repository.
- Open a Pull Request with a detailed description of the development branch of the original project for a review.

## Show your support

Give an ⭐️ if you like this project!

## Acknowledgments

- Microverse
- Stackoverflow

## 📝 License

MIT License
