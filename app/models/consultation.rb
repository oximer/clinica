class Consultation < ActiveRecord::Base
  belongs_to :treatment
  validate :validate_treatment_id
  #validate :validate_canceled_reason
  validates :date,  presence: true

def self.list_reasons
    return ["Solicitacao do paciente","Solicitacao do Dentista","Outros"]
end

 private
     def validate_treatment_id
       if !Treatment.exists?(self.treatment_id)
           errors.add(:treatment_id, "is_invalid")
       end
     end

     def validate_canceled_reason
       if self.canceled == true
           return self.list_reasons.include? self.reason
       end
     end
end
