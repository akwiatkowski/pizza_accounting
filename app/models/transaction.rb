class Transaction < ActiveRecord::Base
  attr_accessible :amount, :desc, :direction

  belongs_to :group
  belongs_to :creator, class_name: 'User'
  belongs_to :payer, class_name: 'User'

  validates_presence_of :amount, :direction, :group, :creator, :payer

  DIRECTIONS = { incoming: 1, outgoing: 5 }
end
