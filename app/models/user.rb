class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def admin?
    self.admin
  end

  
  has_one :owned_group, foreign_key: 'owner_id', class_name: 'Group'
  before_save :build_owned_group, if: Proc.new{ |u| u.owned_group.nil? }
  validates_presence_of :owned_group

end
