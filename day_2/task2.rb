class PasswordFile
  def initialize(file_path)
    @file = File.open(file_path, "r")
  end

  def lines
    unless @lines
      @lines = []
      @file.each_line { |line| @lines << PasswordLine.new(line.chomp) }
    end
    @lines
  end
end

class PasswordLine
  def initialize(line)
    # split the entire line into separate arrays for range, letter and user input
    @line = line.split
  end

  def range_start
    # splits the first array at the "-", takes the first [0] array and turns it into the range start number
    @line[0].split('-')[0].to_i
  end

  def range_end
    # splits the first array at the "-", takes the second [1] array and turns it into the range end number
    @line[0].split('-')[1].to_i
  end

  def letter
    # takes the second [1] array and takes everything but the last character -> e.g "g:" would be "g"
    @line[1][0...-1]
  end

  def input
    @line[2]
  end
end

class InRange
  def initialize(password_line)
    @password_line = password_line
  end
  def valid?
    password_line.input.chars.count(password_line.letter).between?(password_line.range_start, password_line.range_end)
  end

  private
  attr_reader :password_line
end

class NewPolicy
  def initialize(password_line)
    @password_line = password_line
  end

  def valid?
    [password_line.input[password_line.range_start - 1], password_line.input[password_line.range_end - 1]].count(password_line.letter) == 1
  end
  private
  attr_reader :password_line
end

class PolicyCheck
  def initialize(password_lines)
    @password_lines = password_lines
  end

  def valid_lines(policy)
    @password_lines.select do |password_line|
      policy.new(password_line).valid?
    end
  end
end


file = PasswordFile.new("input.txt")
policy_check = PolicyCheck.new(file.lines)


p policy_check.valid_lines(InRange).length
p policy_check.valid_lines(NewPolicy).length
