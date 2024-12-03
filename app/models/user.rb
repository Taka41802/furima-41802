class User < ApplicationRecord
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_ruby, presence: true
  validates :first_name_ruby, presence: true
  validates :date_of_birth, presence: true

  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]+\z/, message: 'は半角英数字混合で入力してください' }

  has_many :items
  has_many :purchases
end
