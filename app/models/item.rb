class Item < ApplicationRecord
  # has_one :purchase
  belongs_to :user
  has_one_attached :image

  validates :name, :content, :category_id, :condition_id, :burden_id, :area_id, :number_of_day_id, :price, presence: true

  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
