require 'rails_helper'

RSpec.describe Api::V1::DishesController, type: :controller do
  describe 'GET #index' do
    let(:dish_1) { FactoryGirl.create(:dish) }
    let(:dish_2) { FactoryGirl.create(:dish) }

    let!(:review_1) { FactoryGirl.create(:review, dish: dish_1) }
    let!(:review_2) { FactoryGirl.create(:review, dish: dish_1) }
    let!(:review_3) { FactoryGirl.create(:review, dish: dish_2) }

    let!(:user_1) { FactoryGirl.create(:user) }

    it 'should return all dishes and their associated reviews and creators' do
      login_as(user_1)
      get :index
      json = JSON.parse(response.body)

      expect(json.length).to eq(2)
      expect(json[0]["name"]).to eq(dish_1.name)
      expect(json[1]["name"]).to eq(dish_2.name)

      expect(json[0]["reviews"].length).to eq(2)
      expect(json[1]["reviews"].length).to eq(1)

      expect(json[0]["reviews"][0]["id"]).to eq(review_1.id)
      expect(json[0]["reviews"][0]["rating"]).to eq(review_1.rating)
      expect(json[0]["reviews"][0]["body"]).to eq(review_1.body)
    end
  end
end
