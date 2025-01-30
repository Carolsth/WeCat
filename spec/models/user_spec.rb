require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it "should create a valid user" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "should not create a valid user" do
      user = build(:user, username: nil)
      expect(user).to_not be_valid

      user2 = build(:user, email: nil)
      expect(user2).to_not be_valid

      user3 = build(:user, password: nil)
      expect(user3).to_not be_valid

      user4 = build(:user, phone: nil)
      expect(user4).to_not be_valid

      user5 = build(:user, name: nil)
      expect(user).to_not be_valid
    end
  end

    context "phone number format" do
      it "should validate the correct phone number" do
        user = build(:user, phone: "11991649257")
        expect(user).to be_valid

        user1 = build(:user, phone: "11-99164-9257")
        expect(user1).to_not be_valid

        user2 = build(:user, phone: "11 991649257")
        expect(user2).to_not be_valid

        user3 = build(:user, phone: "991649257")
        expect(user3).to_not be_valid

        user4 = build(:user, phone: "119916A9257")
        expect(user4).to_not be_valid
      end
    end

    context "Username duplicated" do
      it "Invalid" do
        create(:user, username: "John Doe")
        user_duplicate = build(:user, username: "John Doe")
        expect(user_duplicate).to_not be_valid
        expect(user_duplicate.errors[:username]).to include("has already been taken")
      end
    end

    context "E-mail duplicated" do
      it "Invalid" do
        create(:user, email: "teste@gmail.com")
        email_duplicate = build(:user, email: "teste@gmail.com")
        expect(email_duplicate).to_not be_valid
        expect(email_duplicate.errors[:email]).to include("has already been taken")
      end
    end
end
