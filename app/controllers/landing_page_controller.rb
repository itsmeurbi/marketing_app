# frozen_string_literal: true

class LandingPageController < ApplicationController
  def index
    @corporations = Corporation.all
    @companies = Company.all
  end
end
