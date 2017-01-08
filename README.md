# Formatters

Friendly data formatting for your Rails views.

    Time.now.format_as :nice_date_time  # => "January 8th, 2017 at 11:45"

## Installation

Add this line to your application's Gemfile:

    gem 'formatters'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install formatters

## Usage

Create a `formatters.rb` in your `config/initializers` directory and add some formats as blocks. make a call to `config.define_format` with a symbol for the name of the format as an argument. The block code returns the formatted value.

    Formatters.setup do |config|

      config.define_format :amount do |value|
        "%.2f" % value.round(2)
      end

      config.define_format :money do |value|
        if value.to_f >= 0
          "$#{value.format_as(:amount)}"
        else
          "-$#{value.abs.format_as(:amount)}"
        end
      end

      config.define_format :invoice_number do |value|
        value.to_s.rjust(5, '0')
      end

      config.define_format :nice_date_time do |value|
        if value.kind_of? DateTime
          value.strftime("%B #{value.day.ordinalize}, %Y at %H:%M")
        elsif value.kind_of? Time
          value.strftime("%B #{value.day.ordinalize}, %Y at %H:%M")
        else
          value
        end
      end

      config.define_format :yes_no do |value|
        I18n.t((!!value).to_s)
      end

    end

To use a format in a view, or anywhere else that requires a common approach to displaying formatted data (emailers, etc), simply call the `format_as` method on your data object and pass the name of your defined format as a symbol.

    true.format_as :yes_no  # => "Yes"

    899.99.format_as :money  # => "$899.99"

    Time.now.format_as :nice_date_time  # => "January 8th, 2017 at 11:45"


You can chain formatters and build more complex formats from simple formats such as

    config.define_format :amount do |value|
      "%.2f" % value.round(2)
    end

    config.define_format :money do |value|
      if value.to_f >= 0
        "$#{value.format_as(:amount)}"
      else
        "-$#{value.abs.format_as(:amount)}"
      end
    end



## Contributing

1. Fork it ( https://github.com/[my-github-username]/rails_default_value/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
