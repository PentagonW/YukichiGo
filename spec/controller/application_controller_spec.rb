require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'current_user' do
    subject { controller.current_user }

    context 'userがあるとき' do
      before { allow(controller).to recieve(:browser_id).and_return('1234567890') }

      let(:user) { create(:user) }

      it { is_expected.to be_a User }
    end

    context 'userがないとき' do
      it { is_expected.to be_a User }
    end
  end
end