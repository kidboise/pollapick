class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable, 
         :recoverable, :rememberable, :trackable, :validatable, omniauth_providers: [:facebook, :twitter]

  has_many :votes
  has_many :options, through: :votes
  has_many :rating_votes
  has_many :polls, through: :rating_votes

  has_many :authorizations
  SOCIALS = {
    facebook: 'Facebook',
    twitter: "twitter"
  }

  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, 
                                        :token => auth.credentials.token, 
                                        :secret => auth.credentials.secret).first_or_initialize
    authorization.profile_page = auth.info.urls.first.last unless authorization.persisted?
    if authorization.user.blank?
      user = current_user.nil? ? User.where('email = ?', auth['info']['email']).first : current_user
      if user.blank?
        user = User.new
        user.password = Devise.friendly_token[0, 20]
        user.fetch_details(auth)
        user.save
      end
      authorization.user = user
      authorization.save
    end
    authorization.user
  end

  def fetch_details(auth)
    self.name = auth.info.name
    self.email = auth.info.email
  end
end