class RequestReceiverSpy
  attr_reader :method, :action

  def send(method, action)
    @method = method
    @action = action
  end
end
