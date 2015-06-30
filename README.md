# SimpleRecord

Simple ActiveRecord implementation. It uses file system as a storage.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_record'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_record

## Usage

Here is example:

```ruby
require "simple_record"

class User < SimpleRecord::Entity

  @path = "local/users.json" #you have to specify path to file

  attr_accessor :id, :name, :city

  def initialize(params)
    @id = params["id"]
    @name = params["name"]
    @city = params["city"]
  end

end
```

Now you can do:

```ruby
User.all
User.create({id: 1, name: "Peter", age: 18})
User.find(1) #find by id
```
