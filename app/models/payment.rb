class Payment < ActiveRecord::Base
belongs_to :payer
validates :name,  presence: true, length: { minimum: 2 }
end
