# Tyler Cingel
# CSE 3901
# Project 2

# @number: 1, 2, 3
# @color: Green 'g', Blue 'b', Red 'r'
# @shape: Diamond 'd', Tilte 't', Oval 'o'
# @cpacity: Transparent 'tp', Translucent 'tl', Opaque 'op'

require './Card'

def compareNumber(c1, c2, c3)
	if c1.number == c2.number and c1.number == c3.number
		return true
	elsif c1.number != c2.number and c1.number != c3.number and c2.number != c3.number
		return true
	else
		return false
	end
end

def compareColor(c1, c2, c3)
	if c1.color == c2.color and c1.color == c3.color
		return true
	elsif c1.color != c2.color and c1.color != c3.color and c2.color != c3.color
		return true
	else
		return false
	end
end

def compareShape(c1, c2, c3)
	if c1.shape == c2.shape and c1.shape == c3.shape
		return true
	elsif c1.shape != c2.shape and c1.shape != c3.shape and c2.shape != c3.shape
		return true
	else
		return false
	end
end

def compareOpacity(c1, c2, c3)
	if c1.opacity == c2.opacity and c1.opacity == c3.opacity
		return true
	elsif c1.opacity != c2.opacity and c1.opacity != c3.opacity and c2.opacity != c3.opacity
		return true
	else
		return false
	end
end

def compareCards(c1, c2, c3)
	if compareNumber(c1, c2, c3) and compareColor(c1, c2, c3) and compareShape(c1, c2, c3) and compareOpacity(c1, c2, c3)
		return true
	else
		return false
	end
end

class Main
	card1 = Card.new(2,'g','o','tp')
	card2 = Card.new(3,'b','t','tl')
	card3 = Card.new(1,'r','d','op')
	card4 = Card.new(2,'b','o','tl')
	card5 = Card.new(2,'r','o','op')
	puts compareCards(card1, card2, card3)
	puts compareCards(card1, card4, card5)
	puts compareCards(card2, card4, card5)
end
