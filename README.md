ARMOIRE: look great so you can focus on what matters. 

Armoire is an intuitive real time apparel planner and scheduling platform. It optimizes your daily outfit selection based on:

, , amongst ).  

Incorporates: 
Ruby on Rails
Relational mapping: PostgreSQL
User authentication and session: Devise 
Bootstrap customized with SASS
Early Beta currently located on Heroku: https://intense-harbor-75235.herokuapp.com/

Features:




Authors:
Jen Abella, Chris McGuigan, Chris Bradshaw, Maisie Athens


# Armoire 1.0.0

Armoire is an intuitive real time apparel planner and scheduling platform. It optimizes your daily outfit selection based on:

*Apparel/Accessories/Shoes you already own
*Current geocoordinates
*Time since last wear
*Color coordination
*Amount of likes by friends

**Features**

*Users can uploaded pictures, set attributes of their favorite garments, shoes and accessories. 
*Users can create their own unique outfits, and preview before adding to their Armoire. 
*Alternatively users can generate random outfits, or view customized recommendations based on a proprietary algorithm.
*Users can friend, favorite outfits and communicate with other users. 
*Weather API integration (Forecast.io) for real time updates based on season/weather reports.
*Clean, user friendly interface 


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

```
Ruby Version 2.3.0
Rails Version 4.2.5
```

### Installing

How to get development env running:

Make sure the correct versions of Ruby and Rails are installed on your system. Fire command prompt and run command:

```
ruby -v && rails -v
```

Clone Armoire git repository

```
git clone git@github.com:chrisbradshaw/armoire.git
```

Install all dependencies

```
bundle install
```

Create db and migrate schema

```
rake db:create
rake db:migrate
```

Don't forget to open PostgreSQL

```
rails s
```

Navigate to localhost:3000 in your browser. 

## Built With

* [Ruby on Rails](http://rubyonrails.org/) - server-side web application framework written in Ruby
* [Geocoder](https://github.com/alexreisner/geocoder) - Geocoder is a complete geocoding solution for Ruby
* [Forecast.io](https://darksky.net/) - most accurate source of hyperlocal weather information
* [Devise](https://github.com/plataformatec/devise) - Flexible authentication solution for Rails with Warden.
* [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) - Classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks
* [Fog](https://github.com/fog/fog) - The Ruby cloud services library


## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Chris Bradshaw** - *Version 1.0* - [chrisbradshaw](https://github.com/chrisbradshaw)

* **Jen Abella** - *Version 1.0* - [psswf1172](https://github.com/psswf1172)

* **Chris McGuigan** - *Version 1.0* - [cmc33](https://github.com/cmc33)

* **Maisie Athens** - *Version 1.0* - [mathens](https://github.com/mathens)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details