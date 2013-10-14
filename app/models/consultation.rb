class Consultation < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :treatment
  validate :validate_treatment_id
  validate :validate_canceled_reason
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
           return Consultation.list_reasons.include? self.canceled_reason
       else
           return self.canceled_reason == ""
       end
     end
end
