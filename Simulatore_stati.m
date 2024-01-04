n_bit = input("Inserire il numero di bit: ");

init = [1 zeros(1, n_bit - 1)]; %parte dal primo stato nella forma 1 0 0...

n_ciclo = 0;

temp = init;

while 1 % condizione generica sempre vera
  disp(temp)

  n_ciclo = n_ciclo + 1;
  temp_shift = circshift(temp, 1); % shift senza XOR
  
  if temp(1, end-1) == temp(1, end) % XOR con uscita 0
      temp_shift(1, 1) = 0;
  else % XOR con uscita 1
      temp_shift(1, 1) = 1;
  end

  temp = temp_shift;
  
  if temp == init
      break
  end
end

fprintf("Lunghezza del ciclo = %d stati", n_ciclo)

