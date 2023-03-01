# duration

Gem to calculate and update model attributes that represent lengths of time.
based on test app at [git@github.com:xhostcom/calculate_duration.git]

## Installation

Add lines to your application's Gemfile:

source 'https://gem.fury.io/xhostcom/' do
gem 'duration', '~> 0.0.1'
end


### Or
```ruby
gem 'duration', '~> 0.0.1', :github => 'xhostcom/duration'
```

And then execute:

```bash
$ bundle
```

Models/Concerns

make a model concern 'calculates_duration.rb' with the following

module CalculatesDuration
  extend ActiveSupport::Concern

  included do
    after_save_commit :update_parent_duration

    cattr_accessor :parent_to_update, :duration_association, :duration_column
  end

  class_methods do
    def calculates_duration_from(association_name, column: :duration)
      self.duration_association = association_name
      self.duration_column = column
    end

    def updates_duration_of(parent_association)
      self.parent_to_update = parent_association
    end
  end

  def update_duration!
    update(duration: calculate_duration)
  end

  def calculate_duration
    send(self.class.duration_association).sum(self.class.duration_column)
  end

  def update_parent_duration
    send(parent_association_name).update_duration! if has_parent_record?
  end

  def parent_association_name
    self.class.parent_to_update
  end

  def has_parent_record?
    !!send(parent_association_name) if parent_association_name
  end
end

And in models use

include CalculatesDuration

serialize :duration, Duration

calculates_duration_of :model_name_plural

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

##### Gemfile

source 'https://gem.fury.io/xhostcom/' do gem 'duration', '~> 0.0.1'
end

gem "duration"

bundle install

###### Local install (download dir)

gem list duration
gem install duration

#### Console

$ irb -r duration

#### Test

##### Full test app w/o gem

[git@github.com:xhostcom/calculate_duration.git]
