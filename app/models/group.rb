class Group < ActiveRecord::Base
  attr_accessible :desc, :location, :name

  validates_presence_of :name

  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'
  has_and_belongs_to_many :users
end
