# frozen_string_literal: true

require 'test_helper'

class CampainTest < ActiveSupport::TestCase
  setup do
    @image = Rack::Test::UploadedFile.new('test/fixtures/files/example.jpg', 'image/jpg')
  end

  test 'campaign is valid with all attributes' do
    vans = Campain.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campain_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager),
                       image: @image)

    assert vans.valid?
  end

  test 'campaign is not valid with no image' do
    vans = Campain.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campain_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager))

    refute vans.valid?
  end

  test 'campaign is not valid with no name' do
    vans = Campain.new(start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campain_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager),
                       image: @image)

    refute vans.valid?
  end

  test 'campaign is not valid with not start_date' do
    vans = Campain.new(name: 'Vans',
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campain_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager),
                       image: @image)

    refute vans.valid?
  end

  test 'campaign is not valid with no end_date' do
    vans = Campain.new(name: 'Vans',
                       start_date: Time.now,
                       objective: 'Posicionamiento',
                       campain_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager),
                       image: @image)

    refute vans.valid?
  end

  test 'campaign is not valid with no objective' do
    vans = Campain.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       campain_type: 1,
                       product: 'iPhone 11',
                       manager: users(:manager),
                       image: @image)

    refute vans.valid?
  end

  test 'campaign is not valid with no campain_type' do
    vans = Campain.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       product: 'iPhone 11',
                       manager: users(:manager),
                       image: @image)

    refute vans.valid?
  end

  test 'campaign is not valid with no product' do
    vans = Campain.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campain_type: 1,
                       manager: users(:manager),
                       image: @image)

    refute vans.valid?
  end

  test 'campaign is not valid with no manager' do
    vans = Campain.new(name: 'Vans',
                       start_date: Time.now,
                       end_date: Time.now - 1.day,
                       objective: 'Posicionamiento',
                       campain_type: 1,
                       product: 'iPhone 11',
                       image: @image)

    refute vans.valid?
  end
end
