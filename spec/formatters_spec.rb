# encoding: utf-8
require 'spec_helper'


describe Formatters do
      
  it "defines formats" do

    Formatters.setup do |config|
      config.define_format :money do |value|
        "$#{value}"
      end
      
      config.define_format :serial_number do |value|
        value.to_s.rjust(6, "0")
      end
      
      config.define_format :nice_date_time do |value|
        if value.kind_of? DateTime
          value.strftime("%B #{value.day}, %Y %H:%M")
        elsif value.kind_of? Time
          value.strftime("%B #{value.day}, %Y %H:%M")
        else
          value
        end
      end
    end
    
    value = 3.5
    expect(value.format_as(:money)).to eq '$3.5'
    
    value = '3.5'
    expect(value.format_as(:money)).to eq '$3.5'
    
    value = 3
    expect(value.format_as(:money)).to eq '$3'
    
    value = Time.parse 'March 19, 2016 20:44'
    expect(value.format_as(:nice_date_time)).to eq 'March 19, 2016 20:44'
    
    value = DateTime.parse 'March 19, 2016 20:44'
    expect(value.format_as(:nice_date_time)).to eq 'March 19, 2016 20:44'
    
    value = 1234
    expect(value.format_as(:serial_number)).to eq '001234'
    
    value = '1234'
    expect(value.format_as(:serial_number)).to eq '001234'
    
  end

end