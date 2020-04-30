# Lab 9-13: UART

#### Objectives

Cílem této práce je zrealizovat UART( Univerzální asynchronní přijimáč-vysílač) pomocí VHDL struktury a navrhnout
implementaci do hardwarových komponent.
V práci se věnuji pouze vysílači. Pro reálné použití by bylo nezbytné doplnit přijímač.

 
## UART Description

V dnešní době je UART masivně nahrazován technologii USB, ale u zařízení s nižší komunikační rychlostí (boud-ratem)
se s ním stále můžeme setkat. 

Nejdůležitější vlastností UART je struktura jeho vysílaného rámce, na které je postaven celý kód. 
![alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/UART_Frame.svg/1280px-UART_Frame.svg.png "Logo Title Text 1")




## Hardware description

Můj projekt je realizován pomocí totožného hardwaru, který jsme použivali na cvičení. 
-CoolRunner-II CPLD starter board (XC2C256-TQ144)


## Code description
Celý kód je rozdělen do dvou částí, a to top a transmitter. 
Transmitter obsahuje jeden základní proces, který se spouští náběžnou hranou vstupního clk. Zpracování události náběžné hrany je řešeno konečným automatem.
Dokud není spuštěn BTN0, automat vysílá pouze HL. Po stisknutí BTN0 se realizuje odesílání datových bitů. Ve stavu start bit se načtou všechny datové i konfigurační informace a
vyšle se start bit a automat přejde do stavu 2. Ve stavu 2 se vysílají postupně všechny datové bity do definovaného počtu, parity bit a stop bit. 
Automat se znovu přepíná do stavu 1 a vše se opakuje. V tomto stavu se současně testuje stav BTN0. Veškeré změny konfigurace nebo datových bitů se načtou pouze ve stavu 1, čímž jsou zajištěny
konstatní podmínky v průběhu odesíláni jednoho rámce. 
 
## Simulation
![alt text](https://github.com/libormatejek/Digital-eletronics1/blob/master/Labs/project/simulation/sim1.png "Logo Title Text 1")


## References
top module - https://github.com/libormatejek/Digital-eletronics1/blob/master/Labs/project/UART_matejek/top.vhd

trasmitter module- https://github.com/libormatejek/Digital-eletronics1/blob/master/Labs/project/UART_matejek/transmitter.vhd

test transmitter- https://github.com/libormatejek/Digital-eletronics1/blob/master/Labs/project/UART_matejek/testTransmit.vhd


Počítačová cvičení 1-8

https://en.wikipedia.org/wiki/Universal_asynchronous_receiver-transmitter

https://www.youtube.com/watch?v=sTHckUyxwp8
