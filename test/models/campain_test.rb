# frozen_string_literal: true

require 'test_helper'

class CampainTest < ActiveSupport::TestCase
  test 'campain is valid with name' do
    vans = Campain.new(name: 'Vans')

    assert vans.valid?
  end

  test 'campain is not valid whitout a name' do
    campain = Campain.new

    refute campain.valid?
  end
end
