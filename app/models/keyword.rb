class Keyword < ActiveRecord::Base
  belongs_to :website
  has_many :positions
end
