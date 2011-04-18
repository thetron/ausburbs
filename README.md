# Ausburbs

Inspired by [Carmen](https://github.com/jim/carmen), Ausburbs provides
data for all suburbs across Australia. In additional to suburb names and
postcodes, it also includes the latitudes and longitudes of each suburb.

# Installation

Just include it in your Gemfile:

    gem 'ausburbs'

# Using Ausburbs

The interface is pretty simple and works as follows:

## To get the list of state abbreviations

    Ausburbs.state_names
    # returns ['ACT', 'NSW', 'NT', 'QLD', 'SA', 'TAS', 'VIC', 'WA']

## To get the list of state objects

    Ausburbs.states
    # returns a list of Ausburb::State objects

    Ausburbs.states.first.name # => 'ACT'
    Ausburbs.states.last.suburbs.count # => 1762

## To retrieve a state by name

    Ausburbs.state('NSW')
    # returns an Ausburb::State object

    Ausburbs.state('ACT').suburbs.count # => 136

## To retrieve suburbs for a given state

Each Ausburb::Suburb object has a `name`, `postcode`, `state`,
`latitude` and `longitude` parameter.

    suburb = Ausburbs.state('NSW').suburbs.first
    suburb.name # => "SYDNEY"
    suburb.postcode # => "1001"
    suburb.state # => "NSW"
    suburb.latitude # => -33.764883
    suburb.longitude # => 151.268071

# Notes

As always, pull requests are always welcome. If you have any
issues or feature requests, please [open an issue](https://github.com/thetron/ausburbs/issues/new).
