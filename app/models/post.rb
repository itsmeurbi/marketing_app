# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :node
  has_one_attached :content
  validates :title, presence: true
  belongs_to :responsable, class_name: 'Coworker', foreign_key: 'coworker_id'
end
