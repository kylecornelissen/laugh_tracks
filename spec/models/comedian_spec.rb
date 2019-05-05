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

    it '.average_age' do
      andy = Comedian.create(name: "Andy Kauffman", age: 34, city: "New York, NY", img_url: "andy.png")
      brian = Comedian.create(name: "Brian Regan", age: 60, city: "Miami, FL", img_url: "brian.png")

      expect(Comedian.average_age).to eq(47)
    end

    it '.list_cities' do
      andy = Comedian.create(name: "Andy Kauffman", age: 34, city: "New York, NY", img_url: "andy.png")
      brian = Comedian.create(name: "Brian Regan", age: 60, city: "Miami, FL", img_url: "brian.png")

      expect(Comedian.list_cities).to eq([brian.city, andy.city])
    end
  end

  describe 'instance methods' do
    it '.special_count' do
      andy = Comedian.new(name: "Andy Kauffman", age: 35, city: "New York, NY", img_url: "andy.png")
      andy.save
      special_1 = Special.new(name: "Man On The Moon", run_time: 60)
      special_1.comedian = andy
      special_1.save
      special_2 = Special.new(name: "Andy Live in NY", run_time: 50)
      special_2.comedian = andy
      special_2.save

      expect(andy.special_count).to eq(2)
    end
  end

end
