# frozen_string_literal: true

class LandingPageController < ApplicationController
  layout 'landing-page-application'
  def index
    @corporations = Corporation.all
    @companies = Company.all
  end
end
