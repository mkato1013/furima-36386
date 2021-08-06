require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '内容に問題がない場合' do
    it 'ニックネーム、メールアドレス、パスワード、パスワード（確認）、お名前（全角）、お名前カナ（全角）、生年月日が存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'ニックネームが正しければ登録できる' do
      @user.nickname = 'ああ'
      expect(@user).to be_valid
    end

    it 'メールアドレスが正しければ登録できる' do
      @user.email = 'aaa@aaa'
      expect(@user).to be_valid
    end

    it 'パスワードが６文字で半角英数字混合であれば登録できる' do
      @user.password = '1a1a1a'
      @user.password_confirmation = '1a1a1a'
      expect(@user).to be_valid
    end


    it 'last_nameが正しければ登録できる' do
      @user.last_name = '佐藤'
      expect(@user).to be_valid
    end

    it 'first_nameが正しければ登録できる' do
      @user.first_name = 'たける'
      expect(@user).to be_valid
    end

    it 'last_name_kanaが正しければ登録できる' do
      @user.last_name = 'サトウ'
      expect(@user).to be_valid
    end

    it 'first_name_kanaが正しければ登録できる' do
      @user.last_name = 'タケル'
      expect(@user).to be_valid
    end

    it 'birthdayが正しければ登録できる' do
      @user.birthday = '1995/3/5'
      expect(@user).to be_valid
    end
   end

   context '内容に問題がある場合' do
    it 'メールアドレスが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it '重複したメールアドレスでは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end

    it 'メールアドレスに＠を含む必要がある' do
      @user.email = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    
    it 'passwordとpassword_confirmationは値が一致する' do
      @user.password = "000000"
      @user.password_confirmation = "000001"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'passwordは半角英語のみでは登録できない' do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it 'passwordは半角数字のみでは登録できない' do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it 'passwordは全角英数混合では登録できない' do
      @user.password = "A２４G６７"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it 'last_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.last_name = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters."
    end

    it 'first_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
    end

    it 'last_name_kanaは全角カタカナ以外では登録できないこと' do
      @user.last_name_kana = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters."
    end

    it 'first_name_kanaは全角カタカナ以外では登録できないこと' do
      @user.first_name_kana = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters."
    end
   end
  end
end