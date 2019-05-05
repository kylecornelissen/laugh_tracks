require 'rails_helper'

RSpec.describe Comedian, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :city }
    it { should validate_presence_of :img_url }
  end

  describe 'relationships' do
    it { should have_many :specials }
  end

  describe 'class methods' do
    it '.age_filter' do
      andy = Comedian.create(name: "Andy Kauffman", age: 34, city: "New York, NY", img_url: "andy.png")
      brian = Comedian.create(name: "Brian Regan", age: 60, city: "Miami, FL", img_url: "brian.png")

      expect(Comedian.age_filter("34")).to eq([andy])
    end
  end

end
