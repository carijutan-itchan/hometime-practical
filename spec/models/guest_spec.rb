require 'rails_helper'

RSpec.describe Guest, type: :model do
  
  subject {
    Guest.create(first_name: first_name,
                 last_name: last_name,
                 email: email,
                 contact: contact)
  }

  let(:first_name) { 'Emman' }
  let(:last_name) { 'Borrico' }
  let(:email) { 'emmanborrico@gmail.com' }
  let(:contact) { '0959499231' }

  context "#validate" do

    it "is valid attributes" do 
      expect(subject).to be_valid
    end

    context "first_name with empty value" do
      let(:first_name) { ' ' }

      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "first_name with nil value" do
      let(:first_name) { nil }
      
      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "last_name with empty value" do
      let(:last_name) { ' ' }

      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "last_name with nil value" do
      let(:last_name) { nil }
      
      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "email with empty value" do
      let(:email) { ' ' }

      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "email with nil value" do
      let(:email) { nil }
      
      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "contact with empty value" do
      let(:contact) { ' ' }

      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "contact with nil value" do
      let(:contact) { nil }
      
      it "should not valid" do
        expect(subject).not_to be_valid
      end
    end

    context "duplicate values attribute" do

      before { subject }

      let(:guest) {
        Guest.new(first_name: first_name,
                     last_name: last_name,
                     email: email,
                     contact: contact).save
      }

      context "duplicate contact number" do
        let(:contact) { '0959499231' }

        it "is not valid contact" do
          expect(guest).to eq(false)
        end
      end

      context "duplicate email address" do
        let(:email) { 'emmanborrico@gmail.com' } 

        it "is not valid contact" do
          expect(guest).to eq(false)
        end
      end

    end
    it "should uniq contact"
  end
end
