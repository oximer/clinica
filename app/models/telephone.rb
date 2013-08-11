class Telephone < ActiveRecord::Base
  belongs_to :pacient
  validates :number, length: { minimum: 7 }
  validates :ddd, length: {maximum: 3}, length: {minimum: 2}
  #validate :validate_pacient_id 

private
     def validate_pacient_id
       if !Pacient.exists?(self.pacient_id)
           errors.add(:pacient_id, "is_invalid")
       end
     end


end
