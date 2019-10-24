class Post < ApplicationRecord
  before_action :authenticate_user!
  belongs_to :user

  validates :content, presence: true
end
