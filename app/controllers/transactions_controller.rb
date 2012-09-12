class TransactionsController < InheritedController
  nested_belongs_to :group

  before_filter :assign_creator, on: [:create]

  def assign_creator
    resource.creator = current_user
  end
end
