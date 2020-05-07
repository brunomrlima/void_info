# Lottery Games

This project was made to spread information about COVID-19.

## Prerequisites
Rails version: 6.0.2

Ruby version: 2.7.0

Postgres version: 12


## Getting Started

### MacOS
#### Homebrew
Homebrew installs the stuff you need that Apple (or your Linux system) didn’t.
Homebrew installs packages to their own directory and then symlinks their files into /usr/local.
Homebrew complements macOS (or your Linux system). Install your RubyGems with gem and their dependencies with brew.

Paste that in a macOS Terminal or Linux shell prompt.
```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

#### Rbenv

1. Install rbenv.

    ~~~ sh
    $ brew install rbenv
    ~~~

   Note that this also installs `ruby-build`, so you'll be ready to
   install other Ruby versions out of the box.

2. Set up rbenv in your shell.

    ~~~ sh
    $ rbenv init
    ~~~

   Follow the printed instructions to [set up rbenv shell integration](#how-rbenv-hooks-into-your-shell).

3. Close your Terminal window and open a new one so your changes take
   effect.

4. Verify that rbenv is properly set up using this
   [rbenv-doctor](https://github.com/rbenv/rbenv-installer/blob/master/bin/rbenv-doctor) script:

    ~~~ sh
    $ curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
    Checking for `rbenv' in PATH: /usr/local/bin/rbenv
    Checking for rbenv shims in PATH: OK
    Checking `rbenv install' support: /usr/local/bin/rbenv-install (ruby-build 20170523)
    Counting installed Ruby versions: none
      There aren't any Ruby versions installed under `~/.rbenv/versions'.
      You can install Ruby versions like so: rbenv install 2.2.4
    Checking RubyGems settings: OK
    Auditing installed plugins: OK
    ~~~

5. That's it! Installing rbenv includes ruby-build, so now you're ready to
   [install some other Ruby versions](#installing-ruby-versions) using
   `rbenv install`.
   
6. ##### Installing and configuring Ruby 2.7.0
   ```bash
   $ rbenv install 2.7.0
   ```
   Make Ruby 2.7.0 the default in your system:
   ```bash
   $ rbenv global 2.7.0
   ```
   Check all versions installed and confirm that Ruby 2.7.0 is the one selected.
   ```bash
   $ rbenv versions
   ``` 
   

   
* ##### Upgrading with Homebrew (Not required)
   
   To upgrade to the latest rbenv and update ruby-build with newly released
   Ruby versions, upgrade the Homebrew packages:
   
   ~~~ sh
   $ brew upgrade rbenv ruby-build
   ~~~


#### Install PostgreSQL app

Access the website [PostgreSQL app](https://postgresapp.com/) and download PostgreSQL app that is compatible with PostgreSQL 12.

To setup the database:

```bash
$ rake db:setup
```

This will generate two local databases (one for development and another one for testing).
PS: This action runs Runs db:create, db:schema:load and db:seed.
