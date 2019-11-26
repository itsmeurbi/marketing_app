# frozen_string_literal: true

class Campain < ApplicationRecord
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'
  has_many :coworkers
  has_many :nodes
  has_many :posts, through: :nodes
  has_many :edges, through: :nodes
  has_one_attached :image
  belongs_to :company, polymorphic: true
  scope :coworker_campains, lambda { |user|
                              joins(:coworkers).includes(coworkers: :user)
                                               .where(coworkers: { user: user })
                            }

  validates :name,
            :start_date,
            :end_date,
            :objective,
            :campain_type,
            :product,
            :image,
            presence: true
  validates :name, :objective, :campain_type, :product, length: { in: 5..30 }

  def published_posts_number
    posts.where(published: true).count
  end

  def number_of_post_with_media
    posts.left_joins(:content_attachment)
         .where('active_storage_attachments.id is not NULL')
         .count
  end

  def number_of_post_without_media
    posts.left_joins(:content_attachment)
         .where('active_storage_attachments.id is NULL')
         .count
  end
end
