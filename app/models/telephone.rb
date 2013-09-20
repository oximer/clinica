class Telephone < ActiveRecord::Base
  belongs_to :pacient
  validates :number, length: { minimum: 7 }
  validates :ddd, length: {maximum: 3}, length: {minimum: 2}
  #validate :validate_pacient_id 

  def number_with_ddd
    "#{ddd} #{number}"
  end

  def first_preferred
     Telephone.where(:pacient_id => self.pacient_id).where('preferred != ?', true)
  end

private
     def validate_pacient_id
       if !Pacient.exists?(self.pacient_id)
           errors.add(:pacient_id, "is_invalid")
       end
     end

end
