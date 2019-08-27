# frozen_string_literal: true

class LandingPageController < ApplicationController
  def index
    @corporations = Corporation.all
  end
end
