class Challenge < ActiveRecord::Base
  has_and_belongs_to_many :users

  def to_s
    "#{date} - #{id}"
  end
end
