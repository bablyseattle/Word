class Word
	attr_accessor(:word, :definition)
	@@list = []

	def initialize(attributes)
		@word = attributes.fetch(:word)
		@definition = []
	end

	def save
		@@list.push(self)
	end

	def self.all
		@@list
	end

	def self.empty
		@@list = []
	end

	def self.find_word(word)
		@@list.each do |item|
			if item.word == word
				return item
			end
		end

	end
	def self.sort
		@@list = @@list.sort! do |a, b|
			a.word <=> b.word
		end
	end
	def add_definition(definition)
		@definition.push(definition)
		
	end
end