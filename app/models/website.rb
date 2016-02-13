class Website < ActiveRecord::Base
  belongs_to :account
  has_many :positions
  validates :name, :url, presence: true

  after_save :check_position

  private

  def check_position
    positions.create(rank: (1..10).to_a.sample)
  end

end
