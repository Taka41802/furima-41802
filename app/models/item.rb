class Item < ApplicationRecord
  # has_one :purchase
  belongs_to :user
  has_one_attached :image

  validates :image, :name, :content, :category_id, :condition_id, :burden_id, :area_id, :number_of_day_id, :price, presence: true

  validates :category_id, :condition_id, :burden_id, :area_id, :number_of_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :number_of_day
end
