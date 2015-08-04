class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true 

  belongs_to :plan
  has_one :profile

  before_save :create_username
  after_create :create_profile 

  def to_param
    username
  end

  def create_profile
    self.build_profile
    self.profile.save
  end

  private

	  def create_username
	    self.username = username.downcase
	  end
end
