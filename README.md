# Ruby on Rails Tutorial sample application

This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](http://railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

*If you get an error such as 'Bundler could not find compatible versions for gem "<gem_name>"', the console will typically suggest that you run: *``` $ bundle update ```* which will resolve all the gems to the correct versions.*


Next, migrate the database:
```
$ rails db:migrate (or $rake db:migrate for < Rails 5
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test (or $ rails t)
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server (or $ rails s)
```

For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).