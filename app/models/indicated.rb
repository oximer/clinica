class Indicated < ActiveRecord::Base
  belongs_to :pacient
  has_one :indication

  validate :validate_pacient_id
  validate :validate_indication_id

  private
     def validate_pacient_id
       if !Pacient.exists?(self.pacient_id) and self.pacient_id != nil 
           errors.add(:pacient_id, "is_invalid")
       end
     end
 
     def validate_indication_id
        if !Indication.exists?(self.indication_id)
            erros.add(:indication_id, "#{self.pacient_id} is_invalid")
        end
     end   

end
