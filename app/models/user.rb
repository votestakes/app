class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :trackable, :omniauthable, :omniauth_providers => [:facebook]

  has_and_belongs_to_many :challenges

  def accept_challenge challenge
    challenge.users << self unless challenge.creator == self
  end

  def to_s
    "#{name}"
  end

  class << self
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        # user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        # user.image = auth.info.image # assuming the user model has an image
      end
    end

    def new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end

end
