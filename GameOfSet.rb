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

def compareCards(c1=-1, c2=-1, c3=-1)
	if c1==c2 or c1==c3 or c2==c3
		return false
	elsif compareNumber(c1, c2, c3) and compareColor(c1, c2, c3) and compareShape(c1, c2, c3) and compareOpacity(c1, c2, c3)
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
	deckSize = 2
	for a in 0..deckSize do
		for b in 0..deckSize do
			for c in 0..deckSize do
				for d in 0..deckSize do
					tempCard = Card.new(numbers[a],colors[b],shapes[c],opacity[d])	
					cardDeck.push(tempCard)
				end
			end
		end
	end
	cardDeck = cardDeck.shuffle
	for makePlayDeck in 0..11 do
		playDeck.push(cardDeck.pop())
	end
	while cardDeck.length > 0 and playDeck.length > 0
		puts "Deck size: "+cardDeck.length.to_s()
		for x in 0...playDeck.length do
			puts "Card "+(x+1).to_s()+": \t"+playDeck[x].toString
		end
		card1 = card2 = card3 = ""
		print "Enter card 1, 'b' for bot, or skip to get new cards: "
		card1 = gets
		newCards = false
		puts card1.include?"b"
		if card1.length > 1
			if !card1.include?"b"
				print "Enter card 2: "
				card2 = gets
				print "Enter card 3: "
				card3 = gets
			else
				card1 = card2 = card3 = -1
				for x in 0...playDeck.length do
					for y in 0...playDeck.length do
						for z in 0...playDeck.length do
							if compareCards(playDeck[x], playDeck[y], playDeck[z])
								card1 = x+1
								card2 = y+1
								card3 = z+1
							end
						end
					end
				end
				if card1 == -1
					puts "No possible sets"
				else
					puts "Set found: "+card1.to_s()+" "+card2.to_s()+" "+card3.to_s()
				end
			end
			if compareCards(playDeck[card1.to_i()-1], playDeck[card2.to_i()-1], playDeck[card3.to_i()-1])
				remCard1 = playDeck[card1.to_i()-1]
				remCard2 = playDeck[card2.to_i()-1]
				remCard3 = playDeck[card3.to_i()-1]
				setDeck.push([remCard1, remCard2, remCard3])
				playDeck.delete(remCard1)
				playDeck.delete(remCard2)
				playDeck.delete(remCard3)
				newCards = true
			else
				puts "Insufficient set"
			end
		else
			newCards = true
		end
		
		if newCards
			for y in 0..2 do
				playDeck.push(cardDeck.pop())
			end
		end
	end
	puts "Congratulations, you win!"
	puts "Your sets:"
	for x in 0...setDeck.length do
		puts "Set "+(x+1).to_s()
		for y in 0..2 do
			puts "\t"+setDeck[x][y].toString
		end
		puts ""
	end
end
