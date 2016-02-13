class Keyword < ActiveRecord::Base
  belongs_to :website
  has_many :positions

  after_save :check_position

  private

  def check_position
    positions.create(rank: hit_google)
  end

  def hit_google
    conn = Faraday.get('http://www.wp.pl')
    conn.status
  end
end
