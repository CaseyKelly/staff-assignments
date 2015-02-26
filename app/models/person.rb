class Person < ActiveRecord::Base
  validates :title, presence: :true, unless: ->(person){person.first_name.present?}
  validates :first_name, presence: :true, unless: ->(person){person.title.present?}
  validates :last_name, presence: :true

def full_name
  "#{title} #{first_name} #{last_name}"
end

end
