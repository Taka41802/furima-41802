require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '山田',
                      first_name: '太郎', last_name_ruby: 'ヤマダ', first_name_ruby: 'タロウ', date_of_birth: '2000-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000', last_name: '山田',
                      first_name: '太郎', last_name_ruby: 'ヤマダ', first_name_ruby: 'タロウ', date_of_birth: '2000-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: '', password_confirmation: '', last_name: '山田',
                      first_name: '太郎', last_name_ruby: 'ヤマダ', first_name_ruby: 'タロウ', date_of_birth: '2000-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password_confirmationが一致しないと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'password1', password_confirmation: 'password2', last_name: '山田',
                      first_name: '太郎', last_name_ruby: 'ヤマダ', first_name_ruby: 'タロウ', date_of_birth: '2000-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'password1', password_confirmation: 'password1', last_name: '',
                      first_name: '太郎', last_name_ruby: 'ヤマダ', first_name_ruby: 'タロウ', date_of_birth: '2000-01-01')
      user.valid?
      expect(user.errors.full_messages).to include('Last name 全角文字を使用してください')
    end

    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'password1', password_confirmation: 'password1', last_name: '山田',
                      first_name: '', last_name_ruby: 'ヤマダ', first_name_ruby: 'タロウ', date_of_birth: '2000-01-01')
      user.valid?
      expect(user.errors.full_messages).to include('First name 全角文字を使用してください')
    end

    it 'last_name_rubyが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'password1', password_confirmation: 'password1', last_name: '山田',
                      first_name: '太郎', last_name_ruby: '', first_name_ruby: 'タロウ', date_of_birth: '2000-01-01')
      user.valid?
      expect(user.errors.full_messages).to include('Last name ruby 全角文字を使用してください')
    end

    it 'first_name_rubyが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'password1', password_confirmation: 'password1', last_name: '山田',
                      first_name: '太郎', last_name_ruby: 'ヤマダ', first_name_ruby: '', date_of_birth: '2000-01-01')
      user.valid?
      expect(user.errors.full_messages).to include('First name ruby 全角文字を使用してください')
    end

    it 'date_of_birthが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'password1', password_confirmation: 'password1', last_name: '山田',
                      first_name: '太郎', last_name_ruby: 'ヤマダ', first_name_ruby: 'タロウ', date_of_birth: '')
      user.valid?
      expect(user.errors.full_messages).to include("Date of birth can't be blank")
    end

    it 'emailが一意でないと登録できない' do
      user1 = User.create(nickname: 'test', email: 'test@example.com', password: 'password1', password_confirmation: 'password1', last_name: '山田',
                          first_name: '太郎', last_name_ruby: 'ヤマダ', first_name_ruby: 'タロウ', date_of_birth: '2000-01-01')
      user2 = User.new(nickname: 'test2', email: 'test@example.com', password: 'password2', password_confirmation: 'password2', last_name: '佐藤',
                       first_name: '次郎', last_name_ruby: 'サトウ', first_name_ruby: 'ジロウ', date_of_birth: '1999-12-31')
      user2.valid?
      expect(user2.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが6文字以上でないと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: '12345', password_confirmation: '12345', last_name: '山田',
                      first_name: '太郎', last_name_ruby: 'ヤマダ', first_name_ruby: 'タロウ', date_of_birth: '2000-01-01')
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字混合でないと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: '12345678', password_confirmation: '12345678', last_name: '山田',
                      first_name: '太郎', last_name_ruby: 'ヤマダ', first_name_ruby: 'タロウ', date_of_birth: '2000-01-01')
      user.valid?
      expect(user.errors.full_messages).to include('Password は半角英数字混合で6文字以上にしてください')
    end
  end
end
