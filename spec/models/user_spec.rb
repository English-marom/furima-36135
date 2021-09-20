require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'しっかりと内容が正しければ' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは＠を含まないと登録できない' do
      @user.email = 'maron.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it 'passwordが必要であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上が必要であること' do
      @user.password = 'aaaa8'
      @user.password_confirmation = 'aaaa8'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが半角英数であること' do
      @user.password = 'aaaaa'
      @user.password_confirmation='aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it 'passwordが半角数字のみの場合は登録できない' do
      @user.password = '11111'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password には英字と数字の両方を含めて設定してください")
    end

    it 'passwordが全角の場合は登録できない' do
      @user.password = 'AAAAA'
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end

    it 'passwordとpasswordは、値が一致が必要であること' do
      @user.password = 'abc123'
      @user.password_confirmation='abcd123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'お名前(全角)は、名字が必須であること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'お名前(全角)は、名前が必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'お名前(全角)で漢字、ひらがな、カタカナ、が必須であること' do
      @user.first_name = 'English１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end

    it 'お名前カナ(全角)は、名前が必須であること' do
      @user.kana_first_name = 'ひめ田'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name is invalid. Input full-width katakana characters.")
    end

    it 'お名前カナ(全角)は、全角、カタカナでの入力が必須であること' do
      @user.kana_last_name = 'ひめ田'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name is invalid. Input full-width katakana characters.")
    end

    it '生年月日が必須であること' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end

