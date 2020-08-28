class BankAccount
  attr_reader :name
  attr_accessor :status, :balance

  @@all =[]

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self
  end

  def self.all
    @@all    
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.balance > 0 && self.status == "open"
      return true
    else
      return false
    end
  end

  def close_account
    @status = "closed"
  end
end
