def math
  math_string = get_message
  if /[^0-9\*{2}\.\+\-()=<>:\%\/]/ =~ math_string.gsub(' ','')
    chan_send("Illegal characters inside the expression!")
  else
    if /=/ =~ math_string
      half = math_string.split('=')
      a = eval(half[0])
      b = eval(half[1])
      if a == b
        chan_send("#{a} == #{b} [TRUE]")
      else
        chan_send("#{a} == #{b} [FALSE]")
      end
    elsif /</ =~ math_string
      half = math_string.split('<')
      a = eval(half[0])
      b = eval(half[1])
      if a < b == true
        chan_send("#{a} < #{b} [TRUE]")
      else
        chan_send("#{a} < #{b} [FALSE]")
      end
    elsif />/ =~ math_string
      half = math_string.split('>')
      a = eval(half[0])
      b = eval(half[1])
      if a > b == true
        chan_send("#{a} > #{b} [TRUE]")
      else
        chan_send("#{a} > #{b} [FALSE]")
      end
    elsif /:/ =~ math_string
      half = math_string.split(':')
      a = eval(half[0])
      b = eval(half[1])
      if a == b
        chan_send("#{a} : #{b} [EQ]")
      elsif a < b
        chan_send("#{a} : #{b} [LT]")
      elsif a > b
        chan_send("#{a} : #{b} [GT]")
      end
    else
      value = eval(math_string).to_s
      chan_send(value)
    end
  end
end
