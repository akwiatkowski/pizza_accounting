require 'spec_helper'

describe Matcher do
  it "should perform simple match" do
    m = Matcher.new

    m.budget = 30.0

    m.add_payer(name: 'olek', amount: 20.0)
    m.add_payer(name: 'lukasz', amount: 10.0)
    m.add_payer(name: 'tytus', amount: 50.0)

    m.host_name = 'tytus'

    m.add_buyer(name: 'olek', amount: 7.0, product: 'wisniowa')
    m.add_buyer(name: 'lukasz', amount: 6.0, product: 'rosol')
    m.add_buyer(name: 'tytus', amount: 5, product: 'salatka')
    m.add_buyer(name: 'tytus', amount: 12, product: 'nalesnik')

    m.match!

    #puts m.people.to_yaml
    #puts m.people_by_balance.to_yaml
    #puts m.people_debtor.to_yaml
    #puts m.people_creditor.to_yaml
    puts m.to_s

  end
end
