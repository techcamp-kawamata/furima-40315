class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :purchases

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）での入力が必須です' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）での入力が必須です' }
    validates :last_name_kana, format: { with: /\p{katakana}/, message: '全角（カタカナ）での入力が必須です' }
    validates :first_name_kana, format: { with: /\p{katakana}/, message: '全角（カタカナ）での入力が必須です' }
    validates :birthday
  end
  validates :password,
            format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[^\p{Hiragana}\p{Katakana}\p{Han}]+\z/, message: '半角英数字混合で、6文字以上で入力してください' }
end
