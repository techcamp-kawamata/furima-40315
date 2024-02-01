require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameと、emailと、passwordと、password_confirmationと、last_nameと、first_nameと、last_name_kanaと、first_name_kanaと、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'メールアドレスが必須であること(emailが空では登録できない)' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'パスワードが必須であること(passwordが空では登録できない)' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'ニックネームが必須であること(nicknameが空では登録できない)' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it '姓の入力が必須であること(姓が空では登録できない)' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '姓は全角(漢字・ひらがな・カタカナ)での入力が必須であること(半角では入力できない)' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角（漢字・ひらがな・カタカナ）での入力が必須です')
      end
      it '名前の入力が必須であること(名前が空白では登録できない)' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名前は全角(漢字・ひらがな・カタカナ)での入力が必須であること(半角では登録できない)' do
        @user.first_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）での入力が必須です')
      end
      it '姓のカナの入力が必須であること(姓のカナが空白だと登録できない)' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '姓のカナはカタカナでの入力が必須であること(漢字だと登録できない)' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角（カタカナ）での入力が必須です')
      end
      it '名前のカナの入力が必須であること(名前のカナが空白だと登録できない)' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '名前のカナはカタカナでの入力が必須であること(漢字だと登録できない)' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角（カタカナ）での入力が必須です')
      end
      it 'メールアドレスが一意性であること(重複したemailが存在する場合は登録できない)' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること(emailは@を含まないと登録できない)' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードは、６文字以上の入力が必須であること(passwordが5文字以下では登録できない)' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードとパスワード(確認)は、値の一致が必須であること(passwordとpassword_confirmationが不一致では登録できない)' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードは半角英数字混合であること(全部英字では登録できない)' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字混合で、6文字以上で入力してください')
      end
      it 'パスワードは半角英数字混合であること(全部数字では登録できない)' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字混合で、6文字以上で入力してください')
      end
      it 'パスワードは半角英数字混合であること(全角では入力できない)' do
        @user.password = '００００００A'
        @user.password_confirmation = '００００００A'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字混合で、6文字以上で入力してください')
      end
      it '誕生日の入力が必須であること(誕生日を選択しないと登録できない)' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
