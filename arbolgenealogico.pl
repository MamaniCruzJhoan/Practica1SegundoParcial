% Definimos el Genero

varon(valentin_cruz_vicente).
varon(jose_luis_cruz_perez).
varon(miguel_angel_cruz_perez).
varon(basilio_cruz_lucas).
varon(jhonny_mamani_acero).
varon(jhoshua_thiago_mamani_cruz).
varon(uziel_jheremy_mamani_cruz).
varon(franck_cruz_marquina).
varon(alejandro_cruz_marquina).
varon(kevin_cruz_martinez).

mujer(maria_perez_mendoza).
mujer(dillma_cruz_perez).
mujer(jhoan_aracely_mamani_cruz).
mujer(betty_nina).
mujer(nancy_marquina_sarabia).
mujer(sonia_martinez).
mujer(heidi_cruz_nina).
mujer(sarahi_cruz_nina).
mujer(anahi_cruz_martinez).

% Definimos padre y madre

padre(valentin_cruz_vicente, dillma_cruz_perez).
padre(valentin_cruz_vicente, jose_luis_cruz_perez).
padre(valentin_cruz_vicente, miguel_angel_cruz_perez).
padre(valentin_cruz_vicente, basilio_cruz_lucas).

madre(maria_perez_mendoza, dillma_cruz_perez).
madre(maria_perez_mendoza, jose_luis_cruz_perez).
madre(maria_perez_mendoza, miguel_angel_cruz_perez).
madre(maria_perez_mendoza, basilio_cruz_lucas).

padre(jhonny_mamani_acero, jhoshua_thiago_mamani_cruz).
padre(jhonny_mamani_acero, jhoan_aracely_mamani_cruz).
padre(jhonny_mamani_acero, uziel_jheremy_mamani_cruz).

madre(dillma_cruz_perez, jhoshua_thiago_mamani_cruz).
madre(dillma_cruz_perez, jhoan_aracely_mamani_cruz).
madre(dillma_cruz_perez, uziel_jheremy_mamani_cruz).

padre(jose_luis_cruz_perez, heidi_cruz_nina).
padre(jose_luis_cruz_perez, sarahi_cruz_nina).

madre(betty_nina, heidi_cruz_nina).
madre(betty_nina, sarahi_cruz_nina).

padre(miguel_angel_cruz_perez, franck_cruz_marquina).
padre(miguel_angel_cruz_perez, alejandro_cruz_marquina).

madre(nancy_marquina_sarabia, franck_cruz_marquina).
madre(nancy_marquina_sarabia, alejandro_cruz_marquina).

padre(basilio_cruz_lucas, anahi_cruz_martinez).
padre(basilio_cruz_lucas, kevin_cruz_martinez).

madre(sonia_martinez, anahi_cruz_martinez).
madre(sonia_martinez, kevin_cruz_martinez).

%definimos las relacionesque seria Progenitor (padre o madre)

progenitor(X, Y) :- padre(X, Y); madre(X, Y).

% Hijo (varón o mujer)
hijo(X, Y) :- progenitor(Y, X).

% Hermano
hermano(X, Y) :- padre(Z, X), padre(Z, Y), varon(X), X \= Y.

% Hermana
hermana(X, Y) :- padre(Z, X), padre(Z, Y), mujer(X), X \= Y.

% Abuelo
abuelo(X, Y) :- padre(X, Z), progenitor(Z, Y).

% Abuela
abuela(X, Y) :- madre(X, Z), progenitor(Z, Y).

% Cónyuge (padre o madre de un mismo hijo)
conyuge(X, Y) :- padre(X, Z), madre(Y, Z), X \= Y.
conyuge(X, Y) :- padre(Y, Z), madre(X, Z), X \= Y.

% Tío 
tio(X, Y) :- hermano(X, Z), progenitor(Z, Y).
tio(X, Y) :- hermana(Z1, Z), progenitor(Z, Y), once(conyuge(X, Z1)), varon(X).

% Tía 
tia(X, Y) :- hermana(X, Z), progenitor(Z, Y).
tia(X, Y) :- hermano(Z1, Z), progenitor(Z, Y), once(conyuge(X, Z1)), mujer(X).
% Sobrino (varón)
sobrino(X, Y) :- (tio(Y, X); tia(Y, X)), varon(X).

% Sobrina 
sobrina(X, Y) :- (tio(Y, X); tia(Y, X)), mujer(X).

% Nieto 
nieto(X, Y) :- (abuelo(Y, X); abuela(Y, X)), varon(X).

% Nieta 
nieta(X, Y) :- (abuelo(Y, X); abuela(Y, X)), mujer(X).

% Primos y primas
primo(X, Y) :- progenitor(P1, X), progenitor(P2, Y), (hermano(P1, P2); hermana(P1, P2)), varon(X), X \= Y.
prima(X, Y) :- progenitor(P1, X), progenitor(P2, Y), (hermano(P1, P2); hermana(P1, P2)), mujer(X), X \= Y.












