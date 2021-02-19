class CarEngine
  def initialize (make, color)
    @make = make
    @color = color
    @engine_state = false
  end

  def start_engine
    if @engine_state
      puts "Engine already running"
    else
      @engine_state = true
      puts "Engine idle"
    end
  end

  def stop_engine
    if @engine_state
      @engine_state = false
      puts "Engine off"
    else
      puts "Engine already off"
    end
  end
end
