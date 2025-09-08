class BankAccount
  def initialize
    @balance = 0
    @status = :created
  end

  def balance
    check_not_closed

    @balance
  end

  def deposit(amount)
    check_deposit(amount)

    @balance = balance + amount
  end

  def withdraw(amount)
    check_withdraw(amount)

    @balance = balance - amount
  end

  def open
    raise ArgumentError.new("You can't open an already open account") if opened?

    @status = :open
  end

  def close
    raise ArgumentError.new("You can't close an already closed account") unless opened?

    @status = :close
    @balance = 0
  end

  private

  def closed?
    @status == :close
  end

  def opened?
    @status == :open
  end

  def check_not_closed
    if closed?
      raise ArgumentError.new("You can't check the balance of a closed account")
    end
  end

  def check_deposit(amount)
    raise ArgumentError.new("You can't deposit money into a closed account") if closed?
    raise ArgumentError.new("You can't deposit money into a closed account") unless opened?
    raise ArgumentError.new("You can't deposit a negative amount") if amount.negative?
  end

  def check_withdraw(amount)
    raise ArgumentError.new("You can't withdraw money into a closed account") if closed?
    raise ArgumentError.new("You can't withdraw more than you have") if balance < amount
    raise ArgumentError.new("You can't withdraw a negative amount") if amount.negative?
  end
end
