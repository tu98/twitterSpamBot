require 'jumpstart_auth'

class MicroBlogger
	attr_reader :client

	def initialize
		puts "initializing"
		@client = JumpstartAuth.twitter
	end

	def tweet(message)
		if message.length <= 140
			@client.update(message)
		else
			puts "message is too long"
		end
	end

	def run
		puts "Welcome to the JSL Twitter Client"
		command = ''

		while command != 'q'
			printf 'Enter command: '
			command = gets.chomp
			parts = command.split(' ')
			command = parts[0]

			case command
			when 'q' then puts 'Goodbye!'
			when 't' then tweet(parts[1..-1].join(' '))
			when 'dm' then dm(parts[1], parts[2..-1].join(' ')) #dm[1] is name
			else
				puts 'okay'
			end
		end
	end

	def dm(target, message)
		puts "Trying to send #{target} this direct message:"
		puts message
		self.tweet("d #{target} #{message}")
	end

end

good_one = 'a' * 140
bad_one = 'a' * 141

blogger = MicroBlogger.new
blogger.run