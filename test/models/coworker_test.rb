# frozen_string_literal: true

require 'test_helper'

class CoworkerTest < ActiveSupport::TestCase
  setup do
    @designer = users(:designer)
    @iphone_campain = campains(:iphone_campain)
  end

  test 'coworker is valid with all attribute' do
    coworker = Coworker.new(user: @designer,
                            role: 1,
                            campain: @iphone_campain)

    assert coworker.valid?
  end

  test 'coworker is not valid with no user relation' do
    coworker = Coworker.new(role: 1,
                            campain: @iphone_campain)

    refute coworker.valid?
  end

  test 'coworker is not valid with no role attribute' do
    coworker = Coworker.new(user: @designer,
                            campain: @iphone_campain)

    refute coworker.valid?
  end

  test 'coworker is valid with no campain relation' do
    coworker = Coworker.new(user: @designer,
                            role: 1)

    refute coworker.valid?
  end
end
