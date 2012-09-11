class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_one :owned_group, foreign_key: 'owner_id', class_name: 'Group'
  after_initialize :build_owned_group, if: Proc.new { self.owned_group.nil? }

  before_save :set_default_owned_group_name, if: Proc.new { self.owned_group.name.nil? }

  def set_default_owned_group_name
    self.owned_group.name = self.email
  end

  validates_presence_of :owned_group

  has_and_belongs_to_many :groups
  has_many :created_transactions, class_name: 'User', foreign_key: :creator_id
  has_many :paid_transactions, class_name: 'User', foreign_key: :payer_id


end
