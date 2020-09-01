# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  has_attached_file :recipe_img, styles: { recipe_index: '300x300>', recipe_show: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :recipe_img, content_type: %r{\Aimage/.*\z}
end
