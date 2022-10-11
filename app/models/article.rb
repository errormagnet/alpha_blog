# frozen_string_literal: true

# Article method
class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 12, maximum: 220 }
end
