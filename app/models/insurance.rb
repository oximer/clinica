class Insurance < ActiveRecord::Base
belongs_to :insured
has_many :procedures
has_many :proceduretypes, through: :procedures
validates :name,  presence: true, length: { minimum: 3 }

def allInsurance
    return "teste"
  end

end
