class Assignment < ActiveRecord::Base
  belongs_to :person
  belongs_to :location
  validates :role, :location_id, :person_id, presence: true
  validate :unique_location

  def unique_location
    if person.assignments.find_by(location_id: location_id, role: role)
     errors.add(:unique_locatoin, "People cannot be assigned to the same location with the same role")
    end
  end

end
