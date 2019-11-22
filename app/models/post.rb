# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :content, presence: true
end
