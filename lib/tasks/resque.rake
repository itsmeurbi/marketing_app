# frozen_string_literal: true

# Resque tasks
require 'resque/tasks'
require 'resque/scheduler/tasks'

task 'resque:setup' => :environment do
  Resque.schedule = YAML.load_file(Rails.root.join('config/schedule_jobs.yml'))
  ENV['QUEUES'] = 'default,sleep,wake_up,run,simple'
end
