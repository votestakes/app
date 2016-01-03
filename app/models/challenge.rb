class Challenge < ActiveRecord::Base
  has_and_belongs_to_many :users

  belongs_to :creator, class_name: "User"

  def members
    users + [creator]
  end

  def user_joined? user
    user == creator || users.where(id: user.id).any?
  end

  def to_s
    "#{date} - #{id}"
  end
end

