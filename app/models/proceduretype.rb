class Proceduretype < ActiveRecord::Base
belongs_to :proceduretype
validates :name,  presence: true, length: { minimum: 5 }
validates :followup, presence: true
end
