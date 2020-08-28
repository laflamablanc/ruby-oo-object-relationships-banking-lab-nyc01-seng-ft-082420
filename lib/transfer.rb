class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? && (self.sender.balance > self.amount) && self.status != "complete"
      self.receiver.balance += self.amount
      self.sender.balance -= self.amount
      self.status = "complete"
    elsif self.status = "closed"
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else #bad transfers
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
