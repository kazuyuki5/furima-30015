require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation、kanji_family_name、kanji_fierst_name、kana_family_name、kana_first_name、birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが英数混合だが、字数が5文字以下であれば登録できない" do
        @user.password = "0000a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "kanji_family_nameが空では登録できない" do
       @user.kanji_family_name = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Kanji family name can't be blank")
      end
      it "kanji_first_nameが空では登録できない" do
        @user.kanji_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
      end
      it "kana_family_nameが空では登録できない" do
        @user.kana_family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank")
      end
      it "kana_first_nameが空では登録できない" do
        @user.kana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password:半角英数混合(半角数字のみ)' do
        @user.password = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'kana_family_nameとkana_first_nameはどちらかが空では登録できない' do
        @user.kana_family_name = ""
        @user.kana_first_name = "タロウ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank")
      end
      it 'kana_family_nameとkana_first_nameはどちらかが空では登録できない' do
        @user.kana_family_name = "ヤマダ"
        @user.kana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
       end
       it 'kana_family_nameは半角英数、全角漢字では登録できない' do
        @user.kana_family_name = "yamada1"
        @user.kana_family_name = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name is invalid. Input full-width katakana characters.")
      end
      it 'kana_first_nameは半角英数、全角漢字では登録できない' do
        @user.kana_first_name = "taro1"
        @user.kana_first_name = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid. Input full-width katakana characters.")
      end
    end
  end
end

