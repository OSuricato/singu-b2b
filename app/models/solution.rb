class Solution < ApplicationRecord
  has_and_belongs_to_many :contacts

    # Add any validations you need for the Solution attributes
    validates :title, presence: true
    validates :subtitle, presence: true
    validates :description, presence: true
    validates :image, presence: true
end
