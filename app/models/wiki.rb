class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    slug.nil? || title_changed?
  end

  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators, source: :user

  validates :user, presence: true
end
