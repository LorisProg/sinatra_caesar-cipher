require 'sinatra'
#require 'sinatra/reloader'

get "/" do
	message = params["message"]
	key = params["key"]
	if message
		ciphered = caesar_cipher(message, key.to_i)
	end
	erb :index, :locals => {:ciphered => ciphered}
end

def caesar_cipher (text, key)

  alpha = ("a".."z").to_a
  text.split("").each_with_index do |letter, index|
    if /[a-zA-Z]/.match(letter)  # checks that the characher is a letter
      if /[A-Z]/.match(letter)
        upper = true
      end
        
      letter = letter.downcase

      newIndex = alpha.index(letter) + key
      
      if newIndex > 25
        newIndex -= 26
      end
              
      text[index] = alpha[newIndex]
          
      if upper
        text[index] = text[index].upcase
      end
    end
  end
  return text
end