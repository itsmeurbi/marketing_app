# frozen_string_literal: true

class Petition < ApplicationRecord
  belongs_to :user
  belongs_to :responsable, class_name: 'Coworker', foreign_key: 'coworker_id'
  belongs_to :post
  enum status: %i[active pending approved]
  validates :message, presence: true
  validates :status, presence: true
  scope :pending, -> { where.not(status: :approved) }
  scope :coworker_petitions, lambda { |campain, coworker|
                               joins(:post)
                                 .joins(post: :node)
                                 .joins(post: { node: :campain })
                                 .where(posts: { nodes: { campain: campain } },
                                        responsable: coworker)
                             }
end
