Instrukcja u¿ywania biblioteki szablonów do uk³adania macierzy ZMPW stamp_i, stamp_ix, stamp_u

1. Zawartoœæ biblioteki

stamp_i jest szablonem ga³êzi zdefiniowanej pr¹dowo z pr¹dem nie wziêtym do wektora niewiadomych

stamp_ix jest szablonem ga³êzi zdefiniowanej pr¹dowo z pr¹dem wziêtym do wektora niewiadomych

stamp_u jest szablonem ga³êzi zdefiniowanej napiêciowo zawsze z pr¹dem wziêtym do wektora niewiadomych

2. Szablon stamp_i

Szablon stamp_i wstawia do macierzy wk³ad wnoszony przez a-t¹ ga³¹Ÿ pr¹dow¹, uniwersaln¹ z pr¹dem nie wzietym do wektora niewiadomych,
która zawiera dowolny niepusty podzbiór elementów spoœród:

gaa - przewodnoœæ
gab - Ÿród³o pr¹dowe sterowane napiêciem ga³êzi b-tej
kac - Ÿród³o pr¹dowe sterowane pr¹dem ga³êzi c-tej
jaa - zród³o pr¹dowe niezalezne

Numery zmiennych sieciowych s¹ nastêpuj¹ce:

ma - numer wêz³a poczatkowego a-tej ga³êzi
na - numer wêz³a koñcowego a-tej ga³êzi
mb - numer wêz³a poczatkowego b-tej ga³êzi
nb - numer wêz³a koñcowego b-tej ga³êzi
ic - numer pr¹du ga³êzi c-tej (steruj¹cej pr¹dem)

Wartoœci wspó³czynników elementów:

vgaa - wartoœæ przewodnosci
vgab - wartoœæ Ÿr. pr¹d. ster. napiêciem
vkac - wartoœæ ¿r. pr¹d. ster. pr¹dem
vjaa - wartoœæ Ÿr. pr¹dowego

Wywo³anie szablonu:

[Y,B]=stamp_i(Y,B,ma,na,{'gaa',vgaa},{'gab',vgab,mb,nb),{'kac',vkac,ic},{'jaa',vjaa})
Uwaga {...} oznacza opcjonalnoœæ

na przyk³¹d

dla przewodnoœci: [Y,B]=stamp_i(Y,B,ma,na,'gaa',vgaa)

dla przewodnoœci i Ÿr. pr¹dowego ster nap.: [Y,B]=stamp_i(Y,B,ma,na,'gaa',vgaa,'gab',vgab,mb,nb)

dla Ÿr. pr¹dowego ster pr¹dem i niezale¿nego: [Y,B]=stamp_i(Y,B,ma,na,'kac',vkac,ic,'jaa',vjaa)

3.Szablon stamp_ix

Szablon stamp_ix wstawia do macierzy wk³ad wnoszony przez a-t¹ ga³¹Ÿ pr¹dow¹, uniwersaln¹ z pr¹dem wzietym do wektora niewiadomych,
która zawiera dowolny niepusty podzbiór elementów spoœród:

gaa - przewodnoœæ
gab - Ÿród³o pr¹dowe sterowane napiêciem ga³êzi b-tej
kac - Ÿród³o pr¹dowe sterowane pr¹dem ga³êzi c-tej
jaa - zród³o pr¹dowe niezalezne

Numery zmiennych sieciowych s¹ nastêpuj¹ce:

ia - numer pr¹du ga³êzi a-tej 
ma - numer wêz³a poczatkowego a-tej ga³êzi
na - numer wêz³a koñcowego a-tej ga³êzi
mb - numer wêz³a poczatkowego b-tej ga³êzi
nb - numer wêz³a koñcowego b-tej ga³êzi
ic - numer pr¹du ga³êzi c-tej (steruj¹cej pr¹dem)

Wartoœci wspó³czynników elementów:

vgaa - wartoœæ przewodnosci
vgab - wartoœæ Ÿr. pr¹d. ster. napiêciem
vkac - wartoœæ ¿r. pr¹d. ster. pr¹dem
vjaa - wartoœæ Ÿr. pr¹dowego

Wywo³anie szablonu:

[Y,B]=stamp_ix(Y,B,ma,na,ia,{'gaa',vgaa},{'gab',vgab,mb,nb),{'kac',vkac,ic},{'jaa',vjaa})
Uwaga {...} oznacza opcjonalnoœæ

na przyk³¹d

dla przewodnoœci: [Y,B]=stamp_ix(Y,B,ma,na,ia,'gaa',vgaa)

dla przewodnoœci i Ÿr. pr¹dowego ster nap.: [Y,B]=stamp_ix(Y,B,ma,na,ia,'gaa',vgaa,'gab',vgab,mb,nb)

dla Ÿr. pr¹dowego ster pr¹dem i niezale¿nego: [Y,B]=stamp_ix(Y,B,ma,na,ia,'kac',vkac,ic,'jaa',vjaa)

3.Szablon stamp_u

Szablon stamp_u wstawia do macierzy wk³ad wnoszony przez a-t¹ ga³¹Ÿ napieciow¹, uniwersaln¹ z pr¹dem wziêtym do wektora niewiadomych,
która zawiera dowolny niepusty podzbiór elementów spoœród:

raa - rezystancja
tab - Ÿród³o napiecowe sterowane napiêciem ga³êzi b-tej
rac - Ÿród³o napieciowe sterowane pr¹dem ga³êzi c-tej
eaa - zród³o napiêciowe niezalezne

Numery zmiennych sieciowych s¹ nastêpuj¹ce:

ia - numer pr¹du ga³êzi a-tej 
ma - numer wêz³a poczatkowego a-tej ga³êzi
na - numer wêz³a koñcowego a-tej ga³êzi
mb - numer wêz³a poczatkowego b-tej ga³êzi
nb - numer wêz³a koñcowego b-tej ga³êzi
ic - numer pr¹du ga³êzi c-tej (steruj¹cej pr¹dem)

Wartoœci wspó³czynników elementów:

vraa - wartoœæ rezystancji
vtab - wartoœæ Ÿr. nap. ster. napiêciem
vrac - wartoœæ ¿r. nap. ster. pr¹dem
veaa - wartoœæ Ÿr. napieciowego

Wywo³anie szablonu:

[Y,B]=stamp_u(Y,B,ma,na,ia,{'raa',vraa},{'tab',vtab,mb,nb),{'rac',vrac,ic},{'eaa',veaa})
Uwaga {...} oznacza opcjonalnoœæ

na przyk³ad

dla rezystancji: [Y,B]=stamp_u(Y,B,ma,na,ia,'raa',vraa)

dla rezystanncii i Ÿr. nap. ster nap.: [Y,B]=stamp_u(Y,B,ma,na,ia,'raa',vraa,'tab',vtab,mb,nb)

dla Ÿr. napieciowego ster pr¹dem i niezale¿nego: [Y,B]=stamp_u(Y,B,ma,na,ia,'rac',vrac,ic,'eaa',veaa)    