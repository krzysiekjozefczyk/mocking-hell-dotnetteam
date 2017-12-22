class Transfer
  attr_accessor :id, :source, :target, :amount
  def initialize(id, source, target, amount)
    @id = id
    @source = source
    @target = target
    @amount = amount
  end

  def valid?
    !@source.nil? && !@target.nil? && @source.balance >= amount
  end
end
