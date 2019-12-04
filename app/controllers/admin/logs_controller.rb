# frozen_string_literal: true

module Admin
  class LogsController < Admin::ApplicationController
    def index
      @logs = Log.all
    end
  end
end
