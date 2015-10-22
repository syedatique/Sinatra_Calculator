require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'date'

get '/' do

  erb :home

end


get '/age_calculator' do

  @dob = params[:dob].to_s
  @dob = Date.parse(@dob)

 # binding.pry
 today = Date.toda      #.strftime("%d/%m/%Y")
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

get '/sleeps' do

  @d = params[:dates].to_s
  @dates = Date.parse(@d)

  christmas = Date.new(@dates.year, 12, 25)
  @sleeps = (christmas - @dates).to_i

  @result = case @sleeps
    when 0
      "OMG! Check your stockings! Santa's been!!"
    when 1..10
      "Only #{@sleeps} sleep#{'s' unless @sleeps == 1} to go. It's getting close!"
    when 11..24
      "The advent calendar is getting a workout with only #{@sleeps} sleeps to go."
    when 25..54
      "#{@sleeps} sleeps until Christmas. Better get the cards for Australian friends written."
    when 55..100
      "#{@sleeps} sleeps. Check back soon."
    when 101..250
      "You're too keen. I feel almost mean telling you there's #{@sleeps} sleeps still left."
    when 251..366
      "It's hardly even Easter! There still #{@sleeps} sleeps until Christmas."
    else
      "Oh noes! You missed it! Gotta wait until next year now :-("
    end

erb :sleeps
end

get '/measurement_calc' do
  @measure = params[:measure].to_f

  @result = case @operator
    when "m"
      @measure * 1.6093
    when 'f'
      @measure * 0.3048
    when 'i'
      @measure * 2.54
    when 'k'
      @measure * 0.6214
    when 'e'
      @measure * 3.2808
    when 'c'
      @measure * 0.3937
    end

  erb :measurement_calc
end


get '/volume_calc' do

  @vol_cal = params[:vol_cal]

  @result = case @operator
  when 'c'
    @vol_cal ** 3
  when 's'
    (4.0 / 3.0) * Math::PI * (vol_cal ** 3)
  end

  erb :volume_calc
end