Instrukcja u�ywania biblioteki szablon�w do uk�adania macierzy ZMPW stamp_i, stamp_ix, stamp_u

1. Zawarto�� biblioteki

stamp_i jest szablonem ga��zi zdefiniowanej pr�dowo z pr�dem nie wzi�tym do wektora niewiadomych

stamp_ix jest szablonem ga��zi zdefiniowanej pr�dowo z pr�dem wzi�tym do wektora niewiadomych

stamp_u jest szablonem ga��zi zdefiniowanej napi�ciowo zawsze z pr�dem wzi�tym do wektora niewiadomych

2. Szablon stamp_i

Szablon stamp_i wstawia do macierzy wk�ad wnoszony przez a-t� ga��� pr�dow�, uniwersaln� z pr�dem nie wzietym do wektora niewiadomych,
kt�ra zawiera dowolny niepusty podzbi�r element�w spo�r�d:

gaa - przewodno��
gab - �r�d�o pr�dowe sterowane napi�ciem ga��zi b-tej
kac - �r�d�o pr�dowe sterowane pr�dem ga��zi c-tej
jaa - zr�d�o pr�dowe niezalezne

Numery zmiennych sieciowych s� nast�puj�ce:

ma - numer w�z�a poczatkowego a-tej ga��zi
na - numer w�z�a ko�cowego a-tej ga��zi
mb - numer w�z�a poczatkowego b-tej ga��zi
nb - numer w�z�a ko�cowego b-tej ga��zi
ic - numer pr�du ga��zi c-tej (steruj�cej pr�dem)

Warto�ci wsp�czynnik�w element�w:

vgaa - warto�� przewodnosci
vgab - warto�� �r. pr�d. ster. napi�ciem
vkac - warto�� �r. pr�d. ster. pr�dem
vjaa - warto�� �r. pr�dowego

Wywo�anie szablonu:

[Y,B]=stamp_i(Y,B,ma,na,{'gaa',vgaa},{'gab',vgab,mb,nb),{'kac',vkac,ic},{'jaa',vjaa})
Uwaga {...} oznacza opcjonalno��

na przyk��d

dla przewodno�ci: [Y,B]=stamp_i(Y,B,ma,na,'gaa',vgaa)

dla przewodno�ci i �r. pr�dowego ster nap.: [Y,B]=stamp_i(Y,B,ma,na,'gaa',vgaa,'gab',vgab,mb,nb)

dla �r. pr�dowego ster pr�dem i niezale�nego: [Y,B]=stamp_i(Y,B,ma,na,'kac',vkac,ic,'jaa',vjaa)

3.Szablon stamp_ix

Szablon stamp_ix wstawia do macierzy wk�ad wnoszony przez a-t� ga��� pr�dow�, uniwersaln� z pr�dem wzietym do wektora niewiadomych,
kt�ra zawiera dowolny niepusty podzbi�r element�w spo�r�d:

gaa - przewodno��
gab - �r�d�o pr�dowe sterowane napi�ciem ga��zi b-tej
kac - �r�d�o pr�dowe sterowane pr�dem ga��zi c-tej
jaa - zr�d�o pr�dowe niezalezne

Numery zmiennych sieciowych s� nast�puj�ce:

ia - numer pr�du ga��zi a-tej 
ma - numer w�z�a poczatkowego a-tej ga��zi
na - numer w�z�a ko�cowego a-tej ga��zi
mb - numer w�z�a poczatkowego b-tej ga��zi
nb - numer w�z�a ko�cowego b-tej ga��zi
ic - numer pr�du ga��zi c-tej (steruj�cej pr�dem)

Warto�ci wsp�czynnik�w element�w:

vgaa - warto�� przewodnosci
vgab - warto�� �r. pr�d. ster. napi�ciem
vkac - warto�� �r. pr�d. ster. pr�dem
vjaa - warto�� �r. pr�dowego

Wywo�anie szablonu:

[Y,B]=stamp_ix(Y,B,ma,na,ia,{'gaa',vgaa},{'gab',vgab,mb,nb),{'kac',vkac,ic},{'jaa',vjaa})
Uwaga {...} oznacza opcjonalno��

na przyk��d

dla przewodno�ci: [Y,B]=stamp_ix(Y,B,ma,na,ia,'gaa',vgaa)

dla przewodno�ci i �r. pr�dowego ster nap.: [Y,B]=stamp_ix(Y,B,ma,na,ia,'gaa',vgaa,'gab',vgab,mb,nb)

dla �r. pr�dowego ster pr�dem i niezale�nego: [Y,B]=stamp_ix(Y,B,ma,na,ia,'kac',vkac,ic,'jaa',vjaa)

3.Szablon stamp_u

Szablon stamp_u wstawia do macierzy wk�ad wnoszony przez a-t� ga��� napieciow�, uniwersaln� z pr�dem wzi�tym do wektora niewiadomych,
kt�ra zawiera dowolny niepusty podzbi�r element�w spo�r�d:

raa - rezystancja
tab - �r�d�o napiecowe sterowane napi�ciem ga��zi b-tej
rac - �r�d�o napieciowe sterowane pr�dem ga��zi c-tej
eaa - zr�d�o napi�ciowe niezalezne

Numery zmiennych sieciowych s� nast�puj�ce:

ia - numer pr�du ga��zi a-tej 
ma - numer w�z�a poczatkowego a-tej ga��zi
na - numer w�z�a ko�cowego a-tej ga��zi
mb - numer w�z�a poczatkowego b-tej ga��zi
nb - numer w�z�a ko�cowego b-tej ga��zi
ic - numer pr�du ga��zi c-tej (steruj�cej pr�dem)

Warto�ci wsp�czynnik�w element�w:

vraa - warto�� rezystancji
vtab - warto�� �r. nap. ster. napi�ciem
vrac - warto�� �r. nap. ster. pr�dem
veaa - warto�� �r. napieciowego

Wywo�anie szablonu:

[Y,B]=stamp_u(Y,B,ma,na,ia,{'raa',vraa},{'tab',vtab,mb,nb),{'rac',vrac,ic},{'eaa',veaa})
Uwaga {...} oznacza opcjonalno��

na przyk�ad

dla rezystancji: [Y,B]=stamp_u(Y,B,ma,na,ia,'raa',vraa)

dla rezystanncii i �r. nap. ster nap.: [Y,B]=stamp_u(Y,B,ma,na,ia,'raa',vraa,'tab',vtab,mb,nb)

dla �r. napieciowego ster pr�dem i niezale�nego: [Y,B]=stamp_u(Y,B,ma,na,ia,'rac',vrac,ic,'eaa',veaa)    