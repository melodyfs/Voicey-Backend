require 'rails_helper'

RSpec.describe Memo, type: :model do
  subject  {
      User.new(name: "Joan", email: "joan@test.com")
  }

  describe "Validations" do
     it "is valid with valid attributes" do
         memo = Memo.new(
             title: "The memo",
             date: DateTime.now.utc,
             text_body: "Its text body",
             user: subject
         )
         expect(memo).to be_valid
     end

     it "is invalid without an title" do
         memo = Memo.new(
             title: nil,
             date: DateTime.now.utc,
             text_body: "Its text body",
             user: subject
         )
         expect(memo).to_not be_valid
     end

     it "is invalid without a date" do
         memo = Memo.new(
             title: "The memo",
             date: nil,
             text_body: "Its text body",
             user: subject
         )
         expect(memo).to_not be_valid
     end

     it "is invalid without a user" do
         memo = Memo.new(
             title: "The memo",
             date: DateTime.now.utc,
             text_body: "Its text body",
             user: nil
         )
         expect(memo).to_not be_valid
     end

     it "is invalid without a text body" do
         memo = Memo.new(
             title: "The memo",
             date: DateTime.now.utc,
             text_body: nil,
             user: subject
         )
         expect(memo).to_not be_valid
     end
  end

  describe "Associations" do
      it "should have many memos" do
          assoc = Memo.reflect_on_association(:user)
          expect(assoc.macro).to eq :belongs_to
      end
  end

end
