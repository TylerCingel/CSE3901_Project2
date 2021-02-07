# Rediculous 6
# CSE 3901
# Project 2

# Numbers: 1, 2, 3
# Colors: Green, Blue, Red
# Shapes: Diamond, Tilte, Oval
# Opacity: Transparent, Translucent, Opaque

class Card
	attr_accessor :number, :color, :shape, :opacity
	def initialize(number, color, shape, opacity)
		@number = number
		@color = color
		@shape = shape
		@opacity = opacity
	end
	def compare(card)
		if (@number!=card.number && @color!=card.color && @shape!=card.shape && @opacity!=card.opacity)
			puts "Unique"
		else
			puts "Not Unique"
		end
	end
end
