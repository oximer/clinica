class Treatment < ActiveRecord::Base
belongs_to :pacient
belongs_to :procedure
has_many :consultations
has_many :payers
has_many :payments, through: :payers

def self.list_tooths
    return ["18","17","16","15","14","13","12","11","21","22","23","24","25","26","27","28","48","47","46","45","44","43","42","41","31","32","33","34","35","36","37","38","55","54","53","52","51","61","62","63","64","65","85","84","83","82","81","71","72","73","74","75"	]
end

def self.list_faces
    return ["mesial","distal","oclusal","vestibular","lingual"]
end

validate :validate_pacient_id
validate :validate_done
validate :validate_procedure_id
validates_inclusion_of :tooth, :in => Treatment.list_tooths
validates_inclusion_of :face, :in => Treatment.list_faces
validates_numericality_of :discount, :greater_than_or_equal_to => 0
validates :done,  :inclusion => {:in => [true, false]}

accepts_nested_attributes_for :consultations, :allow_destroy => true



private

     def validate_pacient_id
       if !Pacient.exists?(self.pacient_id) and self.pacient_id != nil
           errors.add(:pacient_id, "#{self.pacient_id} is_invalid")
       end
     end

     def validate_procedure_id
       if !Procedure.exists?(self.procedure_id)
           errors.add(:procedure_id, "is_invalid")
       end
     end

     def validate_done
       if self.done
          consultation = Consultation.find_all_by_treatment_id(self.id, :order => "date").last
          if consultation == nil
             errors.add(:done, "Nao ha consulta associada ao tratamento")
             return
          else
             if (consultation.date > Date.today)
                errors.add(:done, "Nao se pode concluir um tratamento com consultado ainda a ser realizada.")
             end
          end
          return true;
       end
     end

end
