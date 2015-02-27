class Location < ActiveRecord::Base
  has_many :assignments
  has_many :people, through: :assignments
  validates :name, presence: true

end
