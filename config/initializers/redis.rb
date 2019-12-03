# frozen_string_literal: true

$redis = Resque.redis = Redis.new(url: ENV['REDIS_URL'])
