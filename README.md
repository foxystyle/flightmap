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

## Production preview

Production preveiw on heroku - https://flightmap.herokuapp.com/

**Note:**: This preview might not always work properly due to heroku account service limitations.


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
- [x] Departure location input linked to API from Rails
- [x] Departure location input suggests 20 items upon change
- [x] Favicon
- [x] Heroku production setup
- [x] Ticket data API
- [x] Currencies API and dropdown
- [x] Force limit for person count (1-100)
- [x] Dates API and dropdown
- [x] Range sliders connected with Angular
- [x] Display parameter data
- [x] Style new sliders
- [x] Display range slider params
- [x] Calculate params
- [x] Display matching data



## Next to do

- [ ] Data per request rather than loading whole API all at once
- [ ] Map colors
- [ ] Interactive SVG Map to display data
- [ ] Responsive versions
- [ ] Range slider values layout
- [ ] Default value for all inputs
- [ ] Null value
- [ ] Current location detector
- [ ] Currency exchange rate API

## Notes

- It would be good to separate data into multiple tables for better performance (e.g. table for each departure location)
