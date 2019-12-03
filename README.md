# OFX

Welcome to OFX ruby gem! The OFX Ruby gem provides a small SDK for convenient access to the [OFX APIs][ofx/api] from applications written in the Ruby language. It provides a pre-defined set of classes for API resources that initialize themselves dynamically from API responses which allows the bindings to tolerate a number of different versions of the API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ofx-rb'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ofx-rb

## Usage

The library needs to be configured with environment mode "test" or "live"
```ruby
For live mode
Ofx.mode = "live"

For test mode
Ofx.mode = "test"
```
# Development
## Authentication
OFX resource APIs require access token to be sent as Authorization header.
You can get the access token as following:

```ruby
Ofx::Authentication.new("your client_id", "your client_secret").get_access_token
```
## Quotes API
https://payments.developer.ofx.com/specs/quotes/create-quote
Create a quote

```ruby
quote_params = {
    "buyCurrency": "USD",
    "buyAmount": 0,
    "sellCurrency": "INR",
    "sellAmount": 50,
    "beneficiaries": 1
}
Ofx::Quote.create(quote_params, {"access_token" => "api access token"})
```
Get a already created quote
https://payments.developer.ofx.com/specs/quotes/get-quote

```ruby
Ofx::Quote.get("<existing quote id>", {"access_token" => "api access token"})
```

[ofx/api]: https://payments.developer.ofx.com/