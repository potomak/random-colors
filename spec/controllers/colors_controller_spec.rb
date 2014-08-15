require 'rails_helper'

RSpec.describe ColorsController, :type => :controller do

  describe 'GET show' do
    it 'returns http success' do
      get :show, format: :json
      expect(response).to be_success
    end

    context 'with some colors' do
      before { 5.times { Color.new.randomize.save } }

      let!(:latest) do
        color = Color.new.randomize
        color.save
        color
      end

      it 'assigns latest color to @color' do
        get :show, format: :json
        expect(assigns(:color)).to eq(latest)
      end
    end
  end

end
