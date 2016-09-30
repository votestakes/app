class Challenge < ActiveRecord::Base
  has_and_belongs_to_many :users

  belongs_to :creator, class_name: "User", required: true
  belongs_to :event, required: true

  def members
    users + [creator]
  end

  def user_joined? user
    user == creator || users.where(id: user.id).any?
  end

  def meme_top
    # TODO: load the name from event.name
    "#{creator} will be #{emotion} if the #{event.name} has a low voter turnout."
  end

  def meme_bottom
    "Is #{stakes} enough to incentivize #{challengee} to vote?"
  end

  def meme_url
    top = self.meme_top.tr(' ', '-').gsub('?', '~q').downcase
    bottom = self.meme_bottom.tr(' ', '-').gsub('?', '~q').downcase
    "https://memegen.link/#{meme_name}/#{top}/#{bottom}.jpg?alt=#{meme_style}"
  end

  def to_s
    "#{date} - #{id}"
  end
end
