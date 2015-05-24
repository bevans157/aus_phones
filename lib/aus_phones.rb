require 'aus_phones/version'
require 'ostruct'
require 'yaml'
require 'active_support/core_ext/hash/keys'

class AusPhones
  attr_reader :input, :phone_number

  CNF = OpenStruct.new(YAML::load_file(File.join(__dir__, '../config/phones.yml')).deep_symbolize_keys)

  def initialize(input='')
    raise RuntimeError.new('Not a string') unless input.is_a? String
    @input        = input
    @phone_number = build
  end

  def is_valid?
    phone_number.is_valid
  end

  def is_form_valid?
    phone_number.is_form_valid
  end

  def is_emergency?
    phone_number.type == 'emergency'
  end

  def is_mobile?
    phone_number.type == 'mobile'
  end

  def is_landline?
    phone_number.type == 'landline'
  end

  def is_satellite?
    phone_number.type == 'satellite'
  end

  def is_voip?
    phone_number.type == 'voip'
  end

  def is_data?
    phone_number.type == 'data'
  end

  def is_nongeo?
    phone_number.type == 'nongeo'
  end

  def is_test?
    phone_number.type == 'test'
  end

  def is_fictitious?
    phone_number.type == 'fictitious'
  end

  def type
    phone_number.type
  end

  def region
    phone_number.region
  end

  def carrier
    phone_number.carrier
  end

  def description
    phone_number.description
  end

  def area_code
    phone_number.area_code
  end

  def dial_local
    phone_number.number
  end

  def dial_domestic
    #
  end

  def dial_international
    #
  end

  def format_local
    #
  end

  def format_domestic
    #
  end

  def format_international
    #
  end


  private

  def build
    # Create a data structure
    phone_number = OpenStruct.new(
        is_valid:      false,
        is_form_valid: false,
        type:          nil,
        region:        nil,
        carrier:       nil,
        description:   nil,
        area_code:     nil,
        number:        nil
    )

    # Clean out non standard characters
    cleaned      = input.gsub(/[^0-9\+]/, '')

    # Remove international prefix
    cleaned      = cleaned.gsub(/\+#{CNF.prefix}/, '0')

    # Match Number to profile
    CNF.phones.each do |profile|
      m = Regexp.new(profile[:pattern]).match(cleaned)
      if m then
        phone_number.is_valid      = true
        phone_number.is_form_valid = profile[:valid]
        phone_number.area_code     = profile[:area_code]
        phone_number.type          = profile[:type]
        phone_number.carrier       = profile[:carrier]
        phone_number.state         = profile[:state]
        phone_number.region        = profile[:region]
        phone_number.description   = profile[:description]
        phone_number.number        = m[1]
      end
    end

    phone_number
  end


end
