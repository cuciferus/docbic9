class ClinicsController < InheritedResources::Base
  belongs_to :vizita, :singleton => true
end
