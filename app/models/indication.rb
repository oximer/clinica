class Indication < ActiveRecord::Base
 belongs_to :indicated
 validates :name, presence: true
end
