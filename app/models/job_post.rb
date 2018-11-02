class JobPost < ApplicationRecord
  belongs_to :family, optional: true
end
