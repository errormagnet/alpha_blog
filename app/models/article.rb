# frozen_string_literal: true

# Article method
class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 12, maximum: 220 }
end
