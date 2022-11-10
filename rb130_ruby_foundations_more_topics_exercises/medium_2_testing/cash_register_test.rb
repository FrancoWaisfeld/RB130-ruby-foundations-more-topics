require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'cash_register.rb'
require_relative 'transaction.rb'

Minitest::Reporters.use!

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction1 = Transaction.new(20)
    transaction1.amount_paid = 20

    previous_total = register.total_money
    register.accept_money(transaction1)
    current_total = register.total_money

    assert_equal(previous_total + 20, current_total)
  end

  def test_change
    register = CashRegister.new(1000)
    transaction1 = Transaction.new(25)
    transaction1.amount_paid = 40
    assert_equal(15, register.change(transaction1))
  end

  def test_give_receipt
    item_cost = 20
    register = CashRegister.new(1000)
    transaction1 = Transaction.new(item_cost)
    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction1)
    end
  end

  def test_prompt_for_payment
    transaction1 = Transaction.new(20)
    amount = StringIO.new("25.5\n")
    output = StringIO.new
    transaction1.prompt_for_payment(input: amount, output: output)
    assert_equal(25.5, transaction1.amount_paid)
  end
end
