f_clock = input("Inserire la frequenza di clock: ");

%% Importazione dati
tabella = readtable("Misure_gen_12_bit_task10.txt", NumHeaderLines = 0);
tabella.Properties.VariableNames = ["t" "Q"];

t = tabella.t;

Q = tabella.Q;

%% Figura
fig = figure;

%% Plot dei dati sperimentali
plot(t, Q, ".b")

xlabel("Tempo [s]")
ylabel("\DeltaV [V]")

%%
t_bit = 1/f_clock; %durata temporale di un bit

sequenza_Q = [];

t_iniziale = 0;
t_finale = t_bit;

for t_intervallo = 0:t_bit:max(t)
   
    indici = find(t >= t_iniziale & t <= t_finale);

    if mean(Q(indici)) > 2.5
        risultato_bit = 1;
    else
        risultato_bit = 0;
    end    
    sequenza_Q = [sequenza_Q risultato_bit];

    t_iniziale = t_iniziale + t_bit;
    t_finale = t_finale + t_bit;
end

fmt = ['Sequenza delle uscite Q: ' repmat('%d', 1, length(sequenza_Q))];
fprintf(fmt, sequenza_Q)

stati_max = input("\n Quale numero di stati massimi, prima che riparta lo stessa sequenza, si prevedono: ");

if sequenza_Q(1 : stati_max) - sequenza_Q(stati_max+1 : 2*stati_max) == zeros(1, stati_max)
    disp("Sì, potrebbe essere periodico")
else
    disp("No, non è periodico")
end