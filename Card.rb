#Tyler Cingel

class Card
  attr_accessor :number, :color, :shape, :opacity

  def initialize(number, color, shape, opacity)
    @number = number
    @color = color
    @shape = shape
    @opacity = opacity
  end
  def toString()
  	return "#{@number}\t#{@color}\t#{@opacity}\t#{@shape}"
  end
end
