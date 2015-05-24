require 'spec_helper'

RSpec.describe AusPhones do
#  before :all do
#    @phone = AusPhones.new '+61 2 9900 0000'
#  end

  let(:phone) {AusPhones.new '+61 2 9900 0000'}

  it 'takes one parameter and returns an AusPhones' do
    expect(phone).to be_instance_of(AusPhones)
  end

  it 'recognises emergency numbers' do
    expect(AusPhones.new('000').is_emergency?).to eq(true)
    expect(AusPhones.new('999').is_emergency?).to eq(true)
  end

  it 'recognises emergency numbers as invalid' do
    expect(AusPhones.new('000').is_valid?).to eq(true)
    expect(AusPhones.new('999').is_valid?).to eq(true)
    expect(AusPhones.new('000').is_form_valid?).to eq(false)
    expect(AusPhones.new('999').is_form_valid?).to eq(false)
  end

  it 'validates central east region phone number as true' do
    expect(AusPhones.new('+61 2 3300 0000').is_form_valid?).to eq(true)
    expect(AusPhones.new('02 3300 0000').is_form_valid?).to eq(true)
    expect(AusPhones.new('(02) 3300 0000').is_form_valid?).to eq(true)
    expect(AusPhones.new('02-3300-0000').is_form_valid?).to eq(true)
  end

  it 'validates south east region phone number as true' do
    expect(AusPhones.new('+61 3 3300 0000').is_form_valid?).to eq(true)
    expect(AusPhones.new('03 3300 0000').is_form_valid?).to eq(true)
    expect(AusPhones.new('(03) 3300 0000').is_form_valid?).to eq(true)
    expect(AusPhones.new('03-3300-0000').is_form_valid?).to eq(true)
  end

  it 'validates north east region phone number as true' do
    expect(AusPhones.new('+61 7 3300 0000').is_form_valid?).to eq(true)
    expect(AusPhones.new('07 3300 0000').is_form_valid?).to eq(true)
    expect(AusPhones.new('(07) 3300 0000').is_form_valid?).to eq(true)
    expect(AusPhones.new('07-3300-0000').is_form_valid?).to eq(true)
  end

  it 'validates central and west region phone number as true' do
    expect(AusPhones.new('+61 8 2500 0000').is_form_valid?).to eq(true)
    expect(AusPhones.new('08 2500 0000').is_form_valid?).to eq(true)
    expect(AusPhones.new('(08) 2500 0000').is_form_valid?).to eq(true)
    expect(AusPhones.new('08-2500-0000').is_form_valid?).to eq(true)
  end

  it 'validates mobile number' do
    expect(AusPhones.new('+61 488 000 000').is_form_valid?).to eq(true)
    expect(AusPhones.new('0488 000 000').is_form_valid?).to eq(true)
    expect(AusPhones.new('(0488) 000 000').is_form_valid?).to eq(true)
    expect(AusPhones.new('(0)488 000 000').is_form_valid?).to eq(true)
  end

  it 'validates phone number as mobile' do
    expect(AusPhones.new('+61 488 000 000').is_mobile?).to eq(true)
  end

  it 'validates mobile carrier' do
    expect(AusPhones.new('0400 000 000').carrier).to eq('Telstra')
    expect(AusPhones.new('0401 000 000').carrier).to eq('Optus')
    expect(AusPhones.new('0404 000 000').carrier).to eq('Vodafone')
    expect(AusPhones.new('0420 000 000').carrier).to eq('Rail Corporation New South Wales')
    expect(AusPhones.new('0420 020 000').carrier).to eq('Dialogue Communications Pty Limited')
    expect(AusPhones.new('0420 030 000').carrier).to eq('Symbio Network Pty Ltd')
    expect(AusPhones.new('0420 100 000').carrier).to eq('Pivotel Satellite Pty Limited')
    expect(AusPhones.new('0420 119 000').carrier).to eq('COMPATEL Limited')
    expect(AusPhones.new('0469 000 000').carrier).to eq('Lycamobile')
    expect(AusPhones.new('0488 800 000').carrier).to eq('My Number Pty Ltd')
    expect(AusPhones.new('0489 840 000').carrier).to eq('Victorian Rail Track')
    expect(AusPhones.new('0489 900 000').carrier).to eq('Novatel Telephony Pty Ltd')
  end

  it 'validates phone number as satellite' do
    expect(AusPhones.new('014 000 000').is_satellite?).to eq(true)
  end

  it 'validates phone number as voip' do
    expect(AusPhones.new('0550 000 000').is_voip?).to eq(true)
  end

  it 'validates phone number as data' do
    expect(AusPhones.new('0198 000 000').is_data?).to eq(true)
  end

  it 'validates fictitious numbers' do
    expect(AusPhones.new('+61 1 5550 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 1 555 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 1 7010 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 1 701 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 2 5550 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 2 555 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 2 7010 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 2 701 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 3 5550 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 3 555 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 3 7010 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 3 701 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 4 5550 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 4 555 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 4 7010 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 4 701 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 5 5550 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 5 555 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 5 7010 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 5 701 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 6 5550 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 6 555 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 6 7010 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 6 701 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 7 5550 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 7 555 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 7 7010 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 7 701 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 8 5550 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 8 555 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 8 7010 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 8 701 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 9 5550 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 9 555 000 000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 9 7010 0000').is_fictitious?).to eq(true)
    expect(AusPhones.new('+61 9 701 000 000').is_fictitious?).to eq(true)
  end

  it 'validates phone number as test' do
    expect(AusPhones.new('12711').is_test?).to eq(true)
    expect(AusPhones.new('12722123').is_test?).to eq(true)
    expect(AusPhones.new('1272312').is_test?).to eq(true)
  end

  it 'validates test number carriers' do
    expect(AusPhones.new('12722123').carrier).to eq('Telstra')
    expect(AusPhones.new('1272312').carrier).to eq('Optus')
  end

  it 'correctly identifies invalid phone numbers' do
    expect(AusPhones.new('+61 2 9900 +0000').is_valid?).to eq(false)
    expect(AusPhones.new('+61 2 9900 +0000').is_form_valid?).to eq(false)
  end

  it 'identifies correct area codes' do
    expect(AusPhones.new('+61 (2) 3300 0000').area_code).to eq('02')
    expect(AusPhones.new('(02) 3300 0000').area_code).to eq('02')
  end

  it 'generates number for dialing local' do
    expect(AusPhones.new('(02) 3300 0000').dial_local).to eq('33000000')
    expect(AusPhones.new('(0)488 000 000').dial_local).to eq('0488000000')
  end

  it 'generates number for dialing domestic' do
    expect(AusPhones.new('(02) 3300 0000').dial_domestic).to eq('0233000000')
    expect(AusPhones.new('(0)488 000 000').dial_domestic).to eq('0488000000')
  end

  it 'generates number for dialing international' do
    expect(AusPhones.new('(02) 3300 0000').dial_international).to eq('61233000000')
    expect(AusPhones.new('(0)488 000 000').dial_international).to eq('61488000000')
  end




end