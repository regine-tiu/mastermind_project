require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end 

  def print_matches(guess_code)
    puts @secret_code.num_exact_matches(guess_code)
    puts @secret_code.num_near_matches(guess_code)
  end  

   def ask_user_for_guess
    puts "Enter a code"
    user_input = Code.from_string(gets.chomp)
    print_matches(user_input)
    @secret_code == user_input
   end
end
