# frozen_string_literal: true

class Category < ApplicationRecord
  self.per_page = 3

  has_many :recipes
end
