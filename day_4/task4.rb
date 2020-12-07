# class PassportData
#   attr_reader :passportchecker
#   def initialize
#     file = File.open("passports.txt")
#     file_data = file.read.split
#
#     @passportchecker = @data.split("\n")
#     puts passportchecker
#   end
#
#   def validpassport
#     # passportchecker.split
#     # line.include("byr" && "iyr" && "eyr" && "hgt" && "hcl" && "ecl" && "pid")
#     end
# end

# file_data = File.open("passports.txt", "r").map(&:chomp)
# credentials = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
# each_passport.include? "byr" && "iyr" && "eyr" && "hgt" && "hcl" && "ecl" && "pid"

# step 1 split the array into individual passports
# all_passports = File.open("passports.txt", chomp: true).read
# individual_passport = all_passports.split("\n\n")
# valid_passport_no = 0
# criteria = "pid" && "byr" && "iyr" && "eyr" && "hgt" && "hcl" && "ecl"
# individual_passport.select do |element|
#   if element.include? criteria
#
#       puts element + "
#         **********
#         "
#       valid_passport_no +=1
#
#
#
#   else
#     puts "no passports meet this criteria"
#   end
# end
# puts valid_passport_no
# step 2 check if each passport contains all of the credentials
#282 not correct

all_passports = File.open("passports.txt", chomp: true).read
individual_passport = all_passports.split("\n\n")
counter = 0
eyecolour = ('amb') or ('blu') 
individual_passport.each do |element|
if element.count(':') >= 7
  if element.include?('byr')
    if element.include?('iyr')
      if element.include?('eyr')
        if element.include? eyecolour
          if element.include?('hgt')
            if element.include?('cm'&&'in')
              if element.include?('hcl')
                if element.include?('ecl')
                  if element.include?('pid')
                      puts element + "
                      ------
                      "
                      counter += 1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
puts counter
end
# not 272 lol
