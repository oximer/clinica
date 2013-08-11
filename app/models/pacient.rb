class Pacient < ActiveRecord::Base
  has_many :telephones, :dependent => :destroy
  has_many :insureds, :dependent => :destroy
  has_many :treatments, :dependent => :destroy
  has_many :insurances, through: :insureds
  has_many :procedures, through: :treatments
  has_many :consultations, through: :treatments
  has_many :indicateds
  has_many :indications, through: :indicateds
  has_many :payers, through: :treatments
  
  validates :name, presence: true, length: {minimum: 10}, length: {maximum: 255}
  validate :validate_email
  validates :rg, presence: true

  accepts_nested_attributes_for :telephones, :allow_destroy => true
  accepts_nested_attributes_for :treatments, :allow_destroy => true
  accepts_nested_attributes_for :insureds, :allow_destroy => true

  private
 
    def validate_email
        email_regex = %r{^.+@.+$}
        (email =~ email_regex)
    end
end
