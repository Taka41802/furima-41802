class User < ApplicationRecord
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :last_name_ruby, presence: true
    validates :first_name_ruby, presence: true
  end
  validates :date_of_birth, presence: true

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: 'は半角英数字混合で6文字以上にしてください' },
                       if: :password_required?

  has_many :items
  has_many :purchases

  private

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
