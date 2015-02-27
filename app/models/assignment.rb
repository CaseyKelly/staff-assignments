class Assignment < ActiveRecord::Base
  belongs_to :person
  belongs_to :location
  validates :role, :location_id, :person_id, presence: true
end
