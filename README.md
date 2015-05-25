# AusPhones

AusPhones is a ruby gem that validates and identifies Australian Phone numbers.

Rather than simply parsing the number as being a valid phone number format and identifying the area code, this gem 
concentrates on providing information about the phone number provided. 

Information available includes the number type (landline, mobile etc)

In addition to the area-code you can get the geo region of the number (where available) and for mobile numbers the 
carrier is provided.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aus_phones'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aus_phones

## Usage

```
require 'aus_phones'
my_phone1 = AusPhones.new '+61 2 9900 0000'
my_phone2 = AusPhones.new '(02) 9900 0000'
my_phone3 = AusPhones.new '+61 488 000 000'
my_phone4 = AusPhones.new '0488-000-000'
my_phone5 = AusPhones.new '1800 00 00 00'
#etc

my_phone = AusPhones.new '+61 2 9900 0000'
puts my_phone.is_valid?             # [true/false] is valid Australian phone number
puts my_phone.is_form_valid?        # [true/false] is valid number for form entry
puts my_phone.is_mobile?            # [true/false] is mobile phone number
puts my_phone.is_landline?          # [true/false] is landline phone number
puts my_phone.is_satellite?         # [true/false] is satellite phone number
puts my_phone.is_voip?              # [true/false] is voip phone number
puts my_phone.is_data?              # [true/false] is data phone number
puts my_phone.is_nongeo?            # [true/false] is non-geographical phone number
puts my_phone.is_test?              # [true/false] is test number
puts my_phone.is_fictitious?        # [true/false] is fictitious number (film, tv, print, advertising etc)
puts my_phone.type                  # ['landline', 'mobile', 'satellite', 'nongeo', 'test'] type of number
puts my_phone.region                # [string] landlines only, delimited set of regions/subreagions/sub-subregions
puts my_phone.carrier               # [string] mobiles only, name identifier for phone carrier 
puts my_phone.description           # [string] description of phone function for nongeo and test numbers
puts my_phone.area_code             # [string] 2 digit area code prefix for landlines
puts my_phone.number                # [string] base number minus area code
puts my_phone.number_local          # [string] number for local dialing (in the same area code)
puts my_phone.number_domestic       # [string] number for domestic dialing (from within Australia)
puts my_phone.number_international  # [string] number for international dialing (from outside Australia)
puts my_phone.format_local          # [string] local number formatted for display
puts my_phone.format_domestic       # [string] domestic number formatted for display
puts my_phone.format_international  # [string] international number formatted for display
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/aus_phones/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
