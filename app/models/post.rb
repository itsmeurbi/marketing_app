# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :node
  has_one_attached :content
  has_many :petitions
  validates :title, presence: true
  validates :content_status, presence: true
  belongs_to :responsable, class_name: 'Coworker', foreign_key: 'coworker_id'
  enum content_status: %i[pending review approved]
  after_create :mark_node
  after_destroy :unmark_node

  def mark_node
    node.update!(color: '#eb8f34')
  end

  def unmark_node
    node.update!(color: '#34dbeb')
  end
end
