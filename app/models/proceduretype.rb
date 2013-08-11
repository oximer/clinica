class Proceduretype < ActiveRecord::Base
validates :name,  presence: true, length: { minimum: 5 }
validates :followup, presence: true
end
