class User < ApplicationRecord
  validates :name, presence: true,  length: { in: 1..40 }
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable,omniauth_providers: %i(twitter)
  mount_uploader :avatar, AvatarUploader
  
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable,:validatable,:omniauthable,omniauth_providers: [:twitter]

  attr_accessor :current_password

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = User.dummy_email(auth)
      user.remote_user_avatar_url = auth["info"]["avatar"]
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?           
      update_attributes(params, *options)   
    else
      super
    end
  end


  private
    def self.dummy_email(auth)
      "#{auth["uid"]}-#{auth["provider"]}@example.com"
    end

  protected
    def confirmation_required?
      false
    end

    def password_required?
      super && provider.blank? 
    end
end
