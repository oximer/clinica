class Treatment < ActiveRecord::Base
belongs_to :pacient
belongs_to :procedure
has_many :consultations
has_many :payers
has_many :payments, through: :payers

#validate :validate_pacient_id
validate :validate_done
validate :validate_procedure_id
validates_numericality_of :discount, :greater_than_or_equal_to => 0
validates :done,  :inclusion => {:in => [true, false]}

accepts_nested_attributes_for :consultations, :allow_destroy => true

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

     def validate_done
       if self.done
          consultation = Consultation.find_by_treatment_id(self.id)
          if consultation == nil
             errors.add(:done, "Nao ha consulta associada ao tratamento")
             return
          else
             consultation.date > Date.today
             errors.add(:done, "Nao se pode concluir um tratamento com consultado ainda a ser realizada.")
          end
          return true;
       end
     end

end
