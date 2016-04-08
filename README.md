## Local setup

1. Make sure you have Ruby (~2.2.1) on your machine

  ```
  $ ruby -v
  ```

2. Install Rails on your machine, should be ~= 4.2.2

  ```
  $ gem install rails
  $ rails -v
  ```

3.  Clone repository into workspace directory

  ```
  $ cd path/to/dir
  $ git clone https://github.com/kunokdev/flightmap
  ```

4. Install gems, migrate database and seed it with data

  ```
  $ bundle install
  $ rake db:migrate
  $ rake db:seed
  ```

5. Run local server and go to `localhost:3000` in your browser

  ```
  $ rails s
  ```

## Done

- [x] Airport model *(app/models/airport.rb)*
- [x] Airport csv reader *(db/seeds/airports.rb)*
- [x] user provided headers
- [x] "tt" separation REGEX
- [x] Airport database migration *(db/migrate/~)*
- [x] Airport database seed
- [x] Tickets model *(app/models/ticket.rb)*
- [x] Tickets csv reader *(db/seeds/tickets.rb)*
- [x] Tickets database migration *(db/migrate/~)*
- [x] Tickets database seed
- [x] Replace `0`s with `null` for airport coordinates
- [x] Replace `1970-01-01` with `null` for ticket return dates
- [x] Replace `\N` with `null` for airport cities
- [x] Create UI for options

## Next to do

- [ ] Fetch data from database
