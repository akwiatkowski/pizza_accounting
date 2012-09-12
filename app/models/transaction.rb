class Transaction < ActiveRecord::Base
  attr_accessible :amount, :desc, :direction, :payer, :payer_id

  belongs_to :group
  belongs_to :creator, class_name: 'User'
  belongs_to :payer, class_name: 'User'

  validates_presence_of :amount, :direction, :group, :creator, :payer

  DIRECTIONS = { incoming: 1, outgoing: 5 }

  def incoming_direction!
    self.direction = DIRECTIONS[:incoming]
  end

  def outgoing_direction!
    self.direction = DIRECTIONS[:outgoing]
  end

  def incoming?
    self.direction == DIRECTIONS[:incoming]
  end
  
  def outgoing?
    self.direction == DIRECTIONS[:outgoing]
  end

  before_validation :fix_sign

  def fix_sign
    self.amount *= -1.0 if outgoing? and self.amount > 0
    self.amount *= -1.0 if incoming? and self.amount < 0
  end

  validates_numericality_of :amount, greater_than: 0, if: Proc.new {|p| self.incoming?}
  validates_numericality_of :amount, less_than: 0, if: Proc.new {|p| self.outgoing?}

end
