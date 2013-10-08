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
  accepts_nested_attributes_for :indicateds, :allow_destroy => true

  def preferred_telephone
     value = Telephone.where(:pacient_id => self.id).where('preferred != ?', true).first
     if value == nil
	return Telephone.where(:pacient_id => self.id).first.number_with_ddd
     else
        value.number_with_ddd
     end
  end

 def insurance_list
    list = ""
    insureds = Insured.find_all_by_pacient_id(self.id)
    insureds.each do |insured|
        insurances = Insurance.find_all_by_id(insured.insurance_id)
        insurances.each do |insurance|
            if insured == insureds.last
                list = list + insurance.name
            else
                list = list + insurance.name + ",<br/>"
            end
        end
    end
    return list.strip
  end   


    #Insurance.find_by_id(Insured.find_by_pacient_id(pacient.id).insurance_id).name


  private
 
    def validate_email
        email_regex = %r{^.+@.+$}
        (email =~ email_regex)
    end

end
