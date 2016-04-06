## Local setup

1. Make sure you have Ruby (~2.2.1) on your machine

  ```
  $ ruby -v
  ```

2. Install Rails on your machine, should be >= 4.2.2

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
- [x] Airport csv reader *(db/seeds.rb)*
  - [x] user provided headers
  - [x] "tt" separation regex
- [x] Airport database migration *(db/migrate/~)*
- [x] Airport database seed *(db/seeds.rb)*

## Next to do
- [ ] Tickets model
- [ ] Tickets csv reader
- [ ] Tickets database migration
- [ ] Tickets database seed
- [ ] Replace `0`s with `null` for airport coordinates
- [ ] Replace `1970-01-01` with `null` for return dates
