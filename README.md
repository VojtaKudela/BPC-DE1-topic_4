# Topic 4: PWM-Based Tone Generator
Členové týmu

1. Vít Janoš (zodpovědný za obsluhu sedmisegmentového displeje)
2. Vojtěch Kudela (zodpovědný za obsluhu maticové klávesnice a správu GitHub)
3. David Matějček (zodpovědný za komparátor a testování)
4. Antonín Putala (zodpovědný za generátor, PWM modulátor a demo nahrávky)


## Teoretický popis a vysvětlení

**Zvuk** je podélné mechanické vlnění. Zvuková vlna působí výchylku od atmosférického tlaku. Aby byl zvuk pro člověka slyšitelný, musí být o kmitočtu 20 Hz až 20 kHz a větší výchylku než práh slyšení P0 = 2·10<sup>-5</sup> Pa. Dlužno podotknout, že citlivost lidského sluchu je frekvenčně závislé, práh slyšení i kmitočtový rozsah se liší dle jednotlivce. Lidské ucho vnímá hlasitost logaritmicky, proto se hlasitost vyjadřuje v decibelové míře.

Periodické zvukové signály se nazývají **tóny**. Tyto tóny mají svou základní frekvenci, která je označovaná jako výška. Podle výšky také nese tón název. V hudební teorii se používá označení oktáva pro zdvojnásobení kmitočtu. Pokud zdvojnásobíme kmitočet tónu, ponese stejný název pouze bude ležet ve vyšší oktávě. Jako základní tón se užívá komorní A s kmitočtem f = 440 Hz. Oktáva se v evropské hudební teorii rozděluje na 12 dílů. Ty se nazývají půltóny. Každému půltónu je přiřazen kmitočet. Tento kmitočet se určí jako součin základního kmitočtu a poměru pro konkrétní půltón. Pokud změníme frekvenci základního tónu, změní se kmitočty všech půltónů. 

### Princip PWM modulace
Generace zvukových signálů pomocí FPGA působí problém, protože zvukový signál je spojitý, zatímco FPGA má pouze dvoustavové výstupy. Řešením je užití **pulzně šířkové modulace** (PWM). PWM je modulace, při které se střída výstupního obdélníkového signálu mění v závislosti na okamžité hodnotě modulovaného signálu. Velká výchylka okamžitého signálu se projeví větší střídou, menší výchylka menší střídou. Hlavním benefitem je 1bitový výstup, který může být přímo zaveden do reproduktoru. Pokud je potřeba získat původní signál stačí užít dolní propust.

 **Schéma principu PWM modulace**
 ![Princip PWM modulace](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/ForReadMe/PWM_princip.png)


## Hardwarový popis a demo aplikace
Zařízení bylo oživeno a testováno na desce NEXY-A7-50T. Tato deska obsahuje mimo jiné osmimístný sedmisegmentový display, 16 LED diod a 5 tlačítek, což jsou periferie, které byly užity. Další zařízení byla připojena na vnější porty JA a JB. Na ty byly připojeny vnější periferie Jack 3,5mm pro připojení reproduktoru a maticová klávesnice upravená jako klaviatura piana pro zadávání tónu do zařízení.

### Náhled na zařízení
![Pohled na zařízení](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/1713725654572.jpg)


### Top level
Jedná se nejvyšší úroveň celého zařízení. Zde jsou utvořeny vývody pro jednotlivé periferie, které jsou poté přiřazeny pomocí contrainu. Vývody BTNC, BTND, BTNU, BTNR a BTNL jsou připojeny k jednotlivým tlačítkům na desce. Vývod LED[15:0] je připojen k LED diodám na desce. Vývody CA, CB, CC, CD, CE, CF, CG, DP, AN[7:0] řídí sedmisegmentový display. Vývod CLK100MHZ je potom připojen na zdroj hodinových pulzů a AUD_PWM je připojen přes Sallen-Key dolní propust na mono Jack. Vývody s0, s1, s2, s3 jsou připojeny ke sloupcům maticové klávesnice a vývody r0, r1, r2, r3 jsou připojeny k řádkům maticové klávesnice. Vývod JB je připojen na vnější Jack, který slouží k připojení reproduktorů nebo sluchátek. Konkrétně je připojen na pin 1 na svorkovnici JB. 

![TOP_LEVEL](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/ForReadMe/top_level.png)

### Připojení jednotlivých vodičů na svorkovnici JA
![Připojení jednotlivých vodičů na svorkovnici JA](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/ForReadMe/Zapojeni.png)

### Tabulka rozložení tlačítek na maticovém displeji
![Rozložení tlačítek na maticovém displeji](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/ForReadMe/Tabulka%20rozlo%C5%BEen%C3%AD%20tla%C4%8D%C3%ADtek%20na%20maticov%C3%A9m%20displeji%20.png)


## Sofwarový popis
Celé zařízení je možno si rozdělit do tří velkých bloků: DISPLAY_AND_GEN, DEMO MAIN a MATRIX_CONTROL. Každý z nich obsahuje odlišnou část zařízení. DISPLAY_AND_GEN má podřízenou obsluhu displeje, generaci signálů, PWM modulátor a obsluhu tlačítek volume mode. Obsahuje mimo jiné blok MAIN_LOOP, který umožňuje přechod zařízení mezi jednotlivými módy. Blok DEMO_MODE obsahuje informace o frekvenci a hlasitosti tří demo nahrávek a pomocnou logiku pro vytvoření příslušného signálu. MATRIX_CONTROL má za úkol obsluhovat maticovou klávesnici a předávat ostatním blokům informaci o tom, které tlačítko bylo stisknuto. Obvod CODER_1_FROM
_16 je pomocný blok, který zajišťuje rozsvícení odpovídající diody, vždy při stisku klávesy. Všechny tyto bloky jsou zastřešeny design source DISPLAY_AND_GEN_AND_DEMO, který je přímo podřízen TOP_LEVEL. Podrobnější popisy funkcí a schéma zapojení jednotlivých bloků naleznete v [dokumentaci](https://github.com/VojtaKudela/BPC-DE1-topic_4/raw/main/Dokumentace.docx)

![Zapojení DISPLAY_AND_GEN_DEMO](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/ForReadMe/display_and_gen_and_demo.png)


## Simulace komponentů 
Zde naleznete pár simulací **_vybraných_** komponentů. Více simulací naleznete v [dokumentaci](https://github.com/VojtaKudela/BPC-DE1-topic_4/raw/main/Dokumentace.docx).

### Simulace PWM_MOD - *mod_in = x"0F"*
![Simulace SAW_GEN](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/Sim/PWM_3.png)

### Simulace TRI_GEN
![Simulace TRI_GEN](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/Sim/tri_gen.png)

### Simulace SAW_GEN
![Simulace SAW_GEN](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/Sim/saw_gen.png)

### Simulace MAIN_LOOP
![Simulace SAW_GEN](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/Sim/main_loop.png)


## Instrukční návod
Toto zařízení představuje elektronický klávesový hudební nástroj s třemi předvolbami zvuku. Na výstupní konektor je možné připojit reproduktor i sluchátka. Zařízení také obsahuje tři DEMO nahrávky. 

### Popis částí
![Popis částí](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/ForReadMe/Popis%20%C4%8D%C3%A1st%C3%AD.png)

### Popis ovládacích prvků
Po spuštění desky zařízení začne pracovat. Chod zařízení řídí tlačítky na desce. Umožňují nastavovat hlasitost, přepínat mezi jednotlivými módy zařízení a provést reset. Displej podává informaci o aktuálním stavu zařízení.

![Popis ovládacích prvků](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/ForReadMe/Popis%20ovl%C3%A1dac%C3%ADch%20prvk%C5%AF.png)

### Nastavení hlasitosti
Hlasitost nastavíte stiskem tlačítek **VOLUME +/‒**. Hlasitost je možné nastavovat v **rozmezí 0 – 15**. Při stisku se na displeji zobrazí nastavená velikost hlasitosti. *Při nastavování hlasitosti nebude zařízení vytvářet žádné zvuky*. Hlasitost má vliv na hlasitost při ovládání prostřednictvím klaviatury, **_při přehrávání demo nahrávek nebude mít vliv_**.

### Nastavení módu
Mód zařízení nastavíte stiskem tlačítek MODE PŘEDCHOZÍ/DALŠÍ. Zařízení pracuje ve třech módech jako hudební nástroj: **SQUARE**, **TRIANGLE** a **SAW**. Tyto módy poskytují uživateli různé barvy zvuku. Při těchto módech bude reagovat klaviatura na stisknutí jednotlivých kláves.

Další tři módy obsahují DEMO nahrávky. Jedná se o módy: **DEMOA**, **DEMOB** a **DEMOC**. Při přepnutí začne demo nahrávka vždy od začátku. Na začátek se lze vrátit též stisknutím tlačítka reset.

Nastavený mód bude zobrazen na displeji.


### Klaviatura
Před hraním se ujistěte, že je zvolen mód **SQUARE**, **TRIANGLE** nebo **SAW**. Klávesy mají shodné uspořádaní jako na klavíru. Zařízení má rozsah od **_a_** po **_c2_**. Zařízení může generovat vždy pouze **jeden tón**. Generovanému tónu odpovídá světelná kontrolka na desce. *Pokud po puštění tlačítka bude i nadále zařízení generovat zvuk, zmáčkněte tlačítko RESET*.

![Klaviatura](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/ForReadMe/Klaviatura.png)

### Demo nahrávky
Zvolte jeden z módů: **DEMOA**, **DEMOB**, **DEMOC**. Nahrávka začne automaticky hrát. Při stisknutí RESET začne hrát od začátku. Pozor v tomto módu se neprojeví změny hlasitosti ani stisknutí klávesy na klaviatuře!

Jednotlivé DEMO nahrávky odpovídají těmto skladbám:

* **DEMOA: _Für Elise – Lugwig van Beethoven_**
* **DEMOB: _Do you heard a people sing – Claude-Michel Schönberg_**
* **DEMOC: _Entertainer – Scott Joplin_**


Pro ukázku obsluhy zařízení a jeho činnosti za chodu ve formě videa klikněte [zde](https://youtu.be/y9z3xt5LS8A).

## Odkazy k projektu
* Demonstrační video funkce PWM tónového generátoru naleznete [zde](https://youtu.be/y9z3xt5LS8A).
* Podrobnější informace k projektu naleznete v [dokumentaci](https://github.com/VojtaKudela/BPC-DE1-topic_4/raw/main/Dokumentace.docx).


## Reference
1. [Online VHDL Testbench Template Generator (lapinoo.net)](https://vhdl.lapinoo.net/testbench/).
2. Analogová elektronika 2 – doc. Ing Roman Šotner, PhD.
3. [Pulsně šířková modulace (dhservis.cz)](http://www.dhservis.cz/psm.htm).
4. [František Fuka: Hudba z geekovsko-matematického hlediska - DevFest Praha 2012 (youtube.com)](https://www.youtube.com/watch?v=RQuRFCE5NzI).
5. [Do you hear a people sing? – Claude-Michel Schönberg](https://www.youtube.com/watch?v=gYb9sRLUDyM).
6. [Für Elise – Ludwig van Beethoven](https://www.youtube.com/watch?v=q9bU12gXUyM).
7. [Entertainer – Scott Joplin](https://www.youtube.com/watch?v=Fxk9qwCFf8s).
8. [Bc. Václav Štěpán – Funkční generator na principu přímé digitální syntézy](https://dspace.cvut.cz/bitstream/handle/10467/61546/F3-DP-2015-Stepan-Vaclav-diplomka-kompl.pdf?sequence=1).
9. [Nexys A7 - Digilent Reference](https://digilent.com/reference/programmable-logic/nexys-a7/start).
10. [Elektronická učebnice - ELUC (ikap.cz)](https://eluc.ikap.cz/verejne/lekce/924).
