class Consultation < ActiveRecord::Base
  belongs_to :treatment
  validate :validate_treatment_id
  validates :date,  presence: true

 private
     def validate_treatment_id
       if !Treatment.exists?(self.treatment_id)
           errors.add(:treatment_id, "is_invalid")
       end
     end
end
