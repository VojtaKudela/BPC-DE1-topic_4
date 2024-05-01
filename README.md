# Topic 4: PWM-Based Tone Generator
Členové týmu

1. Vít Janoš (zodpovědný za obsluhu sedmisegmentového displeje)
2. Vojtěch Kudela (zodpovědný za obsluhu maticové klávesnice a správu GitHub)
3. David Matějček (zodpovědný za komparátor a testování)
4. Antonín Putala (zodpovědný za generátor, PWM modulátor a demo nahrávky)

## Teoretický popis a vysvětlení

**Zvuk** je podélné mechanické vlnění. Zvuková vlna působí výchylku od atmosférického tlaku. Aby byl zvuk pro člověka slyšitelný, musí být o kmitočtu 20 Hz až 20 kHz a větší výchylku než práh slyšení P0 = 2·10<sup>-5</sup> Pa. Dlužno podotknout, že citlivost lidského sluchu je frekvenčně závislé, práh slyšení i kmitočtový rozsah se liší dle jednotlivce. Lidské ucho vnímá hlasitost logaritmicky, proto se hlasitost vyjadřuje v decibelové míře.

Periodické zvukové signály se nazývají **tóny**. Tyto tóny mají svou základní frekvenci, která je označovaná jako výška. Podle výšky také nese tón název. V hudební teorii se používá označení oktáva pro zdvojnásobení kmitočtu. Pokud zdvojnásobíme kmitočet tónu, ponese stejný název pouze bude ležet ve vyšší oktávě. Jako základní tón se užívá komorní A s kmitočtem f = 440 Hz. Oktáva se v evropské hudební teorii rozděluje na 12 dílů. Ty se nazývají půltóny. Každému půltónu je přiřazen kmitočet. Tento kmitočet se určí jako součin základního kmitočtu a poměru pro konkrétní půltón. Pokud změníme frekvenci základního tónu, změní se kmitočty všech půltónů. 

![Princip PWM modulace](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/ForReadMe/PWM_princip.png)

## Hardwarový popis a demo aplikace
Zařízení bylo oživeno a testováno na desce NEXY-A7-50T. Tato deska obsahuje mimo jiné osmimístný sedmisegmentový display, 16 LED diod a 5 tlačítek, což jsou periferie, které byly užity. Další zařízení byla připojena na vnější porty JA a JB. Na ty byly připojeny vnější periférie Jack 3,5mm pro připojení reproduktoru a maticová klávesnice upravená jako klaviatura piana pro zadávání tónu do zařízení.
![Pohled na zařízení](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/1713725654572.jpg)

### Top level
Jedná se nejvyšší úroveň 
![Pohled na zařízení](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/ForReadMe/top_level.png)

## Sofwarový popis
Ceké zařízení je možno si rozdělit do tří velkých bloků: DISPLAY_AND_GEN, DEMO MAIN a MATRIX_CONTROL. Každý z nich obsahuje odlišnou část zařízení. DISPLAY_AND_GEN má podřízenou obsluhu displeje, generaci signálů, PWM modulátor a obsluhu tlačítek volume mode. Obsahuje mimo jiné blok MAIN_LOOP, který umožňuje přechod zařízení mezi jednotlivými módy. Blok DEMO_MODE obsahuje informace o frekvenci a hlasitosti tří demo nahrávek a pomocnou logiku pro vytvoření příslušného signálu. MATRIX_CONTROL má za úkol obsluhovat maticovou klávesnici a předávat ostatním blokům informaci o tom, které tlačítko bylo stisknuto. Obvod CODER_1_FROM
_16 je pomocný blok, který zajišťuje rozsvícení odpovídající diody, vždy při stisku klávesy. Všechny tyto bloky jsou zastřešeny design source DISPLAY_AND_GEN_AND_DEMO, který je přímo podřízen TOP_LEVEL.
![Zapojení DISPLAY_AND_GEN_DEMO](https://github.com/VojtaKudela/BPC-DE1-topic_4/blob/main/Picture/ForReadMe/display_and_gen_and_demo.png)
Podrobnější popisy funkcí a schéma zapojení jednotlivých bloků naleznete v [dokumentaci](https://github.com/VojtaKudela/BPC-DE1-topic_4/raw/main/Dokumentace.docx)

### Odkazy k projektu
* Demonstrační video funkce PWM tónového generátoru naleznete [zde](https://youtu.be/y9z3xt5LS8A).
* Podrobnější informace k projektu naleznete v [dokumentaci](https://github.com/VojtaKudela/BPC-DE1-topic_4/raw/main/Dokumentace.docx).

### Reference
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
