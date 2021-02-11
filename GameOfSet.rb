# Tyler Cingel
# CSE 3901
# Project 2

# @number: 1, 2, 3
# @color: Green 'G', Blue 'B', Red 'R'
# @shape: Diamond '<>', Tilte '~', Oval '0'
# @cpacity: Transparent '|', Translucent '||', Opaque '|||'

require './Card'

#Compares if the numbers for 3 cards are valid for a set
def compareNumber(c1, c2, c3)
	if c1.number == c2.number and c1.number == c3.number
		return true
	elsif c1.number != c2.number and c1.number != c3.number and c2.number != c3.number
		return true
	else
		return false
	end
end

#Compares if the colors for 3 cards are valid for a set
def compareColor(c1, c2, c3)
	if c1.color == c2.color and c1.color == c3.color
		return true
	elsif c1.color != c2.color and c1.color != c3.color and c2.color != c3.color
		return true
	else
		return false
	end
end

#Compares if the shapes for 3 cards are valid for a set
def compareShape(c1, c2, c3)
	if c1.shape == c2.shape and c1.shape == c3.shape
		return true
	elsif c1.shape != c2.shape and c1.shape != c3.shape and c2.shape != c3.shape
		return true
	else
		return false
	end
end

#Compares if the opacities for 3 cards are valid for a set
def compareOpacity(c1, c2, c3)
	if c1.opacity == c2.opacity and c1.opacity == c3.opacity
		return true
	elsif c1.opacity != c2.opacity and c1.opacity != c3.opacity and c2.opacity != c3.opacity
		return true
	else
		return false
	end
end

#Compares 3 cards and returns true if they are a valid set, or false otherwise
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
	numbers = [1,2,3]		#Symbols for number of shapes
	colors = ['R','G','B']		#Symbols for color of shapes
	shapes = ['<>','~','0']	#Symbols representing shapes
	opacity = ['|','||','|||']	#Deterministic of opacity
	cardDeck = []	#Deck of cards still not put into a set or in play
	playDeck = []	#Deck of cards currently in play
	setDeck = []	#Deck of cards that have already been placed in sets
	deckSize = 2
	#Makes all 81 unique cards and shuffles
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
	#Gets first play deck
	for makePlayDeck in 0..11 do
		playDeck.push(cardDeck.pop())
	end
	while cardDeck.length > 0 and playDeck.length > 0	#Loop that runs until both card deck and play deck are empty
		puts "Deck size: "+cardDeck.length.to_s()
		#Prints cards in play
		for x in 0...playDeck.length do
			puts "Card "+(x+1).to_s()+": \t"+playDeck[x].toString
		end
		card1 = card2 = card3 = ""
		print "Enter card 1, 'b' for bot, or skip to get new cards: "
		card1 = gets
		newCards = false
		puts card1.include?"b"
		if card1.length > 1
			if !card1.include?"b"	#User enters a potential deck
				print "Enter card 2: "
				card2 = gets
				print "Enter card 3: "
				card3 = gets
			else			#Handy-dandy bot to find a set for the user, or lets us know if there is none
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
				setDeck.push([remCard1, remCard2, remCard3])	#Adds set to set deck
				playDeck.delete(remCard1)			#Removes cards from play deck
				playDeck.delete(remCard2)
				playDeck.delete(remCard3)
				newCards = true
			else
				puts "Insufficient set"
			end
		else
			newCards = true
		end
		
		if newCards	#Whether because there are no valid sets, or a set was just made, adds 3 new cards to play deck
			for y in 0..2 do
				playDeck.push(cardDeck.pop())
			end
		end
	end
	puts "Congratulations, you win!"
	puts "Your sets:"
	for x in 0...setDeck.length do	#Prints all sets made during game
		puts "Set "+(x+1).to_s()
		for y in 0..2 do
			puts "\t"+setDeck[x][y].toString
		end
		puts ""
	end
end
