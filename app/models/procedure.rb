class Procedure < ActiveRecord::Base
  belongs_to :insurance
  has_one :proceduretype
  belongs_to :treatment
 
  validate :validate_proceduretype_id
  validate :validate_insurance_id
  validates :name,  presence: true, length: { minimum: 3 }
  validates_numericality_of :value, greater_than: 0

 private
     def validate_proceduretype_id
       if !Proceduretype.exists?(self.proceduretype_id)
           errors.add(:proceduretype_id, "is_invalid")
       end
     end

     def validate_insurance_id
        if !Insurance.exists?(self.insurance_id)
            erros.add(:insurance_id, "is_invalid")
        end
     end

  def name_with_insurance
    "#{name} -> #{Insurance.find(id=insurance_id).name}"
  end

end
