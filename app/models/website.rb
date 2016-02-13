class Website < ActiveRecord::Base
  belongs_to :account
  validates :name, :url, presence: true
end
