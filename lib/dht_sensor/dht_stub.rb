class DhtStub
  class NullLogger
    def debug(*) end
  end

  # Note: #type and #pin are not yet available on the dth_sensor class
  attr_reader :type, :pin

  def initialize(type, pin, logger: NullLogger.new)
    @type = type
    logger.debug "DHT Type --> #{type}"

    @pin = pin
    logger.debug "DHT Pin  --> #{pin}"

    @temperature = 42.0
    @humidity = 69.0

    self
  end

  def to_a
    [@temperature, @humidity]
  end

  private

  attr_writer :humidity, :temperature
end
