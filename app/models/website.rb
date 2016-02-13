class Website < ActiveRecord::Base
  belongs_to :account
  has_many :keywords
  validates :name, :url, presence: true

  after_save :check_position

  def check_position
    positions.create(rank: hit_google)
  end

  private

  def hit_google
    conn = Faraday.get('http://www.wp.pl')
    conn.status
  end



end
