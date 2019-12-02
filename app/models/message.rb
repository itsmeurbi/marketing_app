# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'
  has_one_attached :image
end
