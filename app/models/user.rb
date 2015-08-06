class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true 

  belongs_to :plan
  has_one :profile
  has_one :artist
  attr_accessor :stripe_card_token

  before_save :create_username
  after_create :create_profile 

  def to_param
    username
  end

  def create_profile
    self.build_profile
    self.profile.save
    if self.acct_type == 'Artist'
      self.build_artist
      self.artist.save 
    end
  end

  def save_with_payment
    if valid? 
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end

  private

	  def create_username
	    self.username = username.downcase
	  end
end
