class Room < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :bookings




  def self.search(name,building,size)
    where("name LIKE ? and building LIKE? and size LIKE? ",  "%#{name}%","%#{building}%","%#{size}%")
  end



end



