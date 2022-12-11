# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  context 'relationships' do
    it { should have_many(:posts).dependent(:destroy) }
  end

  context 'validates' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  it '#full_name' do
    expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
  end
end
