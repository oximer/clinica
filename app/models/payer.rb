class Payer < ActiveRecord::Base
  belongs_to :treatment
  has_one  :payment
  validate :validate_payment_id
  validate :validate_treatment_id
  validates :date,  presence: true

 private
     def validate_treatment_id
       if !Treatment.exists?(self.treatment_id)
           errors.add(:treatment_id, "is_invalid")
       end
     end

     def validate_payment_id
       if !Payment.exists?(self.payment_id)
           errors.add(:payment_id, "is_invalid")
       end
     end


end
