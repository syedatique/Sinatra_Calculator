require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'date'

get '/age_calculator' do

  @dob = params[:dob].to_s
  @dob = Date.parse(@dob)

 # binding.pry
 today = Date.today
#   # .strftime("%d/%m/%Y")

case 
when @dob.year > today.year
   @result = "You are from FUTURE!!"
 when @dob.year == today.year
   @result = "Your age is: #{0}"
 when @dob.year < today.year
  if @dob.month > today.month || (@dob.month == today.month && @dob.day > today.day)
    age = today.year - @dob.year - 1
  else 
    age = today.year - @dob.year
  end
  @result = "Your age is : #{age}"
end

erb :age_calculator
end

get '/calculat8r' do
    # ask the user which operation they want to perform
    # puts `clear`
    # puts "Good choice - which simple operation do you want to perform?"
    # print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
    
    @first_number = params[:first_number].to_f
    @second_number = params[:second_number].to_f
    @operator = params[:operator]


    @result = case @operator
    when '+'
      @first_number + @second_number
    when '-'
      @first_number - @second_number
    when '*'
      @first_number * @second_number
    when '/'
      @first_number / @second_number
    when 'sqrt'
        Math::sqrt(@first_number)
    when 
      @first_number ** @second_number
    end

  erb :calculat8r
end