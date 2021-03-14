require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'is valid with a first name, last name, email, and password' do
    user = User.new(
      first_name: 'Aaron',
      last_name: 'Summer',
      email: 'test@example.com',
      password: 'fjdksauteijwsieiw-jfdks',
    )
    expect(user).to be_valid
  end

  it 'is return a user full name as a string' do
    user = FactoryBot.build(
      :user,
      first_name: 'Joe',
      last_name: 'Tester',
    )

    expect(user.name).to eq 'Joe Tester'
  end

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  it 'performs geocoding', vcr: true do
    user = FactoryBot.create(:user, last_sign_in_ip: '161.185.207.20')
    expect {
      user.geocode
    }.to change(user, :location).from(nil).to('New York City, New York, US')
  end
end
