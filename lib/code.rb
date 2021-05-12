class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(char_arr)
    char_arr.all? {|char| POSSIBLE_PEGS.key?(char.upcase)}
  end  

  def initialize(char_arr)
    if Code.valid_pegs?(char_arr) 
      @pegs = char_arr.map(&:upcase)
    else
      raise "not a valid peg"
    end    
  end  

  def self.random(length)
    random_pegs = []
    length.times {random_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end 
  
  def self.from_string(str)
    Code.new(str.split(""))
  end  

  def [](idx)
    @pegs[idx]
  end  

  def length
    @pegs.length
  end 
  
  def num_exact_matches(guess_code)
    count = 0
    (0...guess_code.length).each do |i|
      count += 1 if guess_code[i] == self[i]
    end  
     count
  end  

  def num_near_matches(guess_code)
    count = 0
    (0...guess_code.length).each do |i|
      if guess_code[i] != self[i] && self.pegs.include?(guess_code[i])
        count += 1
      end  
    end 
    count
  end  

  def ==(guess_code)
    guess_code == self.pegs
  end  
end
