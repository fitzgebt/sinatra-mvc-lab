

class PigLatinizer

    def piglatinize(text)
        if !text.include?(" ")
            text_array = text.split("")
            if text.start_with?(/[aeiouAEIOU]/)
                text_array = text_array << "way"
            elsif text.start_with?(/[^aeiouAEIOU]{3}/)
                text_three = text_array.slice!(0,3)
                text_array = text_array << text_three << 'ay'
            elsif text.start_with?(/[^aeiou]{2}/)
                first_two = text_array.slice!(0,2)
                text_array = text_array << first_two << 'ay'
            else
                first = text_array.shift
                text_array = text_array << first << 'ay'
            end
            text_array.join('')
        else
            text_array = text.split(' ')
            a = text_array.collect {|word| PigLatinizer.new.piglatinize(word)}
            a.join(" ")
        end

    end

end