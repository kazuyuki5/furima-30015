require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @tweet = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context "商品が保存できる場合" do
      it "画像、商品名、商品説明、状態、カテゴリー、配送料の負担、発送元の地域、発送までの日数、価格があれば商品出品は保存される" do
        expect(@item).to be_valid
      end
      it "テキストのみあればツイートは保存される" do
      end
    end
    context "商品が保存できない場合" do
      it "テキストがないとツイートは保存できない" do
      end     
      it "ユーザーが紐付いていないとツイートは保存できない" do
      end
    end
  end
end
