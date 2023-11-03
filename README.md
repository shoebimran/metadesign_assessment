# metadesign_assessment
# README

## Install

### Clone the repository

```bash
git clone https://github.com/shoebimran/metadesign_assessment.git

```

### Check your Ruby version

```bash
ruby -v
```

The output should start with something like `ruby 3.1.1`

If not, install the right ruby version using rvm (it could take a while):

```bash
rvm install "ruby-3.1.1"
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```bash
bundle
```

### Update database.yml file
In database.yml file, edit the database configuration as required.

### Initialize the database

```ruby
rails db:create db:migrate
```

### Start rails server

```ruby
rails s
```
And now you can visit the site with the URL http://localhost:3000

### Run rspec
In order to run spec run the below command

```bash
rspec
```