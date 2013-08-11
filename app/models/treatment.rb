class Treatment < ActiveRecord::Base
belongs_to :pacient
belongs_to :procedure
has_many :consultations
has_many :payers
has_many :payments, through: :payers

#validate :validate_pacient_id
validate :validate_procedure_id
validates_numericality_of :discount, :greater_than_or_equal_to => 0
validates :done,  :inclusion => {:in => [true, false]}

private
     def validate_pacient_id
       if !Pacient.exists?(self.pacient_id)
           errors.add(:pacient_id, "is_invalid")
       end
     end
     def validate_procedure_id
       if !Procedure.exists?(self.procedure_id)
           errors.add(:procedure_id, "is_invalid")
       end
     end

end
