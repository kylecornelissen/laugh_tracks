class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :city
  validates_presence_of :img_url

  def self.age_filter(age)
    self.where(age: age.to_i)
  end

  def special_count
    specials.count
  end

  def self.average_age
    self.average(:age)
  end

  def self.list_cities
    self.distinct.pluck(:city)
  end
end
