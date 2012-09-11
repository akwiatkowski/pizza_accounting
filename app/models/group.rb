class Group < ActiveRecord::Base
  attr_accessible :desc, :location, :name

  validates_presence_of :name

  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'

  before_save :generate_default_name

  def generate_default_name
    self.name ||= self.owner.email
  end

end
