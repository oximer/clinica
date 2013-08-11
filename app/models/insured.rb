class Insured < ActiveRecord::Base
belongs_to :pacient
has_one :insurance
#validate :validate_pacient_id
validate :validate_insurance_id

private
     def validate_pacient_id
       if !Pacient.exists?(self.pacient_id)
           errors.add(:pacient_id, "is_invalid")
       end
     end

     def validate_insurance_id
       if !Insurance.exists?(self.insurance_id)
           errors.add(:insurance_id, "is_invalid")
       end
     end

end
