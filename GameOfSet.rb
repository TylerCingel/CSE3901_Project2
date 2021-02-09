# Tyler Cingel
# CSE 3901
# Project 2

# @number: 1, 2, 3
# @color: Green 'G', Blue 'B', Red 'R'
# @shape: Diamond '<>', Tilte '~', Oval '0'
# @cpacity: Transparent '|', Translucent '||', Opaque '|||'

=begin
	TODO
	Make loop that runs until cardDeck is empty
	Hand out 12 cards
	Make interface that attempts to make a set
	Make new array that stores sets
=end

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
	numbers = [1,2,3]
	colors = ['R','G','B']
	shapes = ['<>','~','0']
	opacity = ['|','||','|||']
	cardDeck = []
	playDeck = []
	setDeck = []
	for a in 0..2 do
		for b in 0..2 do
			for c in 0..2 do
				for d in 0..2 do
					tempCard = Card.new(numbers[a],colors[b],shapes[c],opacity[d])	
					cardDeck.push(tempCard)
				end
			end
		end
	end
	cardDeck = cardDeck.shuffle
	for x in 0..11 do
		playDeck.push(cardDeck.pop())
	end
	while cardDeck.length > 0
		for x in 0..playDeck.length-1 do
			puts "Card "+(x+1).to_s()+": \t"+playDeck[x].toString
		end
		print "Enter card 1 or n to get new cards: "
		card1 = gets
		if card1=='n' # TODO still asking for card 2 and 3 after entering 'n'
			for x in 0..2 do
				playDeck.push(cardDeck.pop())
			end
		else
			print "Enter card 2: "
			card2 = gets
			print "Enter card 3: "
			card3 = gets
			if compareCards(playDeck[card1.to_i()-1], playDeck[card2.to_i()-1], playDeck[card3.to_i()-1])
				# TODO add as set to setDeck and ensure correct cards are removed from playDeck
				for x in 0..2 do
					playDeck.push(cardDeck.pop())
				end
			else
				puts "Insufficient set"
			end
		end
	end
end
