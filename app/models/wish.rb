class Wish < ApplicationRecord
  belongs_to :user

  validates :title, :url, presence: true
  enum priority: [ :normal, :high, :very_high ] 
end
