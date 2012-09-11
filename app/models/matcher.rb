class Matcher
  def initialize
    @payers = Array.new
    @buyers = Array.new
    @budget = 0.0
  end

  # total sum of order
  attr_accessor :budget

  # host person acts like a bank, collect money and repay later
  attr_accessor :host_name

  def add_payer(_h)
    @payers << _h
  end

  def add_buyer(_h)
    @buyers << _h
  end

  def match!
    match_for_person
    generate_transactions
  end

  attr_reader :people

  def match_for_person
    @people = Hash.new

    # initialize people
    (@buyers + @payers).each do |p|
      pn = p[:name]
      @people[pn] = { balance: 0.0, payers: [], buyers: [], should_pay: [] } if @people[pn].nil?
    end

    # add transactions

    @buyers.each do |t|
      tn = t[:name]
      @people[tn][:balance] -= t[:amount]
      @people[tn][:buyers] << t
    end

    @payers.each do |t|
      tn = t[:name]
      @people[tn][:balance] += t[:amount]
      @people[tn][:payers] << t
    end

  end

  attr_reader :people_by_balance, :people_debtor, :people_creditor, :host

  def generate_transactions
    @transactions = Array.new

    if host_name and not @people[host_name].nil?
      @host = @people[host_name]
      puts @host.inspect
      # flip him!

      # TODO something better!

      #@host[:balance] *= 1.0
      #@host[:payers].each do |p|
      #  p[:amount] *= -1.0
      #end
      #@host[:buyers].each do |p|
      #  p[:amount] *= -1.0
      #end
      #
      #tp = @host[:payers]
      #tb = @host[:buyers]
      #@host[:payers] = tb
      #@host[:buyers] = tp
      #
      #
      #puts @people.to_yaml
    end

    @people_by_balance = @people.keys.map { |p| [p, @people[p][:balance]] }.sort { |a, b| a[1] <=> b[1] }
    @people_debtor = @people_by_balance.select { |p| p[1] < 0.0 }.sort { |a, b| b[1] <=> a[1] }
    @people_creditor = @people_by_balance.select { |p| p[1] > 0.0 }.sort { |a, b| a[1] <=> b[1] }

    # who should pay who
    @people_debtor.each do |d|
      value = d[1] * -1.0
      debtor = d[0]

      @people_creditor.each do |c|
        creditor_value = c[1]
        creditor_name = c[0]
        transaction_value = 0.0
        # create repay transaction

        if value > creditor_value
          # full repay
          transaction_value = creditor_value
        else
          # repay all that (s)he can
          transaction_value = value
        end

        if transaction_value > 0.0
          @people[debtor][:should_pay] << { creditor: creditor_name, amount: transaction_value }

          @people[debtor][:balance] += transaction_value
          d[1] += transaction_value

          @people[creditor_name][:balance] -= transaction_value
          c[1] -= transaction_value

        elsif transaction_value < 0.0
          raise Error
        end

      end

      # find
    end

  end

  def to_s
    s = ""
    @people.keys.each do |p|
      person = @people[p]
      s += "#{p}: balance/should has #{person[:balance]}"
      s += ", should pay: #{person[:should_pay].size} transaction" if person[:should_pay].size > 0
      s += "\n"
      person[:should_pay].each do |sp|
        s += "* should pay: #{sp[:amount]} to #{sp[:creditor]}\n"
      end
    end
    return s
  end

end