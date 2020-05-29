# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

  ### Установка bootstrap.
    Сначала для установки bootstrap я использовал Gemfile в котором прописал
          > gem 'bootstrap', '~> 4.4.1'

    но это не помогло, далее были предприняты следующие шаги, которые привели
    к успеху:
    1. Помогли данные установки [вот отсюда](https://medium.com/@adrian_teh/ruby-on-rails-6-with-webpacker-and-bootstrap-step-by-step-guide-41b52ef4081f)

    2. Я произвел установку через yarn:
          > yarn add bootstrap jquery popper.js

    3. Далее в файл app/config/webpack/environment.js добавил то что требовали, а именно:

            ```
             const { environment } = require('@rails/webpacker')

             const webpack = require('webpack')
             environment.plugins.append('Provide',
               new webpack.ProvidePlugin({
                 $: 'jquery',
                 jQuery: 'jquery',
                 Popper: ['popper.js', 'default']
               })
             )

             module.exports = environment
           ```

    4. Далее поступил чуть по другому, переименовал файл app/assets/stylesheets/application.css
    в app/assets/stylesheets/application.scss и добавил в него:
          > @import "bootstrap";

    5. Далее в app/javascript/packs/application.js добавил следующий код подключения bootstrap:

          ```
           require("@rails/ujs").start()
           require("turbolinks").start()
           require("@rails/activestorage").start()
           require("channels")
           require("jquery")
           require("src/cocoon")
           require("bootstrap")
          ```

    Ну 4 и 5 шаг я поменял местами, думаю что это не важно.
    После этого bootstrap заработал!

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
