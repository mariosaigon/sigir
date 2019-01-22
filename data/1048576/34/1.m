clear;

%%Cargamos la señal
load('.\senal_ej3.mat');

%%Representamos la señal inicial
figure(1);
plot(modulata);
title('Señal recibida a demodular');

%%Establecemos los parametros para demodular la señal
P=16;
N=4;
fc=10;
wc=20*pi;
Ts=1;
Tsm=1/50;
t=0:Tsm:64;
t=t(1:3200);

%%Obtenemos la señal en banda base de la componente en fase y encuadratura de la señal
SenalBanadaBase_enfase=modulata.*cos(wc.*t);
SenalBanadaBase_encuad=modulata.*(-sin(wc.*t));

%%Pasamos dichas señales en Banda Base por un FPB  -> Obtenemos la parte
%%real y la parte imaginaria de la señal
[b,a]=butter(8,0.5);
xdin_fase=2*filtfilt(b,a,SenalBanadaBase_enfase);
xdin_cuad=2*filtfilt(b,a,SenalBanadaBase_encuad);

%%Representamos dichas partes de la señal
figure(2);
subplot(2,1,1);
plot(t,xdin_fase,'b');
title('Señal temporal demodulada en fase');

subplot(2,1,2);
plot(t,xdin_cuad,'r');
title('Señal temporal demodulada en cuadratura');

%%Tomamos una muestra real y otra imaginaria de cada estado mediante
%%interpolacion (interp1)
parteReal=interp1(1:1:3200,xdin_fase,25:50:3175);
parteIm=interp1(1:1:3200,xdin_cuad,25:50:3175);

%Volvemos a construir la señal a raiz de los estados
Senal=parteReal+1i*parteIm;

%%Se realiza la fft a cada tramo de 16 muestras (estados) de la señal
sec1R=Senal(1:16);
fftSec1R=fft(sec1R);

sec2R=Senal(17:32);
fftSec2R=fft(sec2R);

sec3R=Senal(33:48);
fftSec3R=fft(sec3R);

sec4R=Senal(49:64);
fftSec4R=fft(sec4R);

%%Construimos de nuevo la señal
concatSenal=[fftSec1R fftSec2R fftSec3R fftSec4R];
concatSenal=round(concatSenal);

%%Obtenemos la parte real e imaginaria de la señal
concatParteReal=real(concatSenal);
concatParteIm=imag(concatSenal);

%%Se realiza el mapeado inverso segun constelacion 4QAM 
mapeado=zeros(1,64);
for a=1:64
    if concatParteReal(a)<0 && concatParteIm(a)<0
        mapeado(a)=0;
    elseif concatParteReal(a)<0 && concatParteIm(a)>0
        mapeado(a)=1;
    elseif concatParteReal(a)>0 && concatParteIm(a)<0
        mapeado(a)=2;
    else 
        mapeado(a)=3;
    end       
    
end

%%Imprimimos secuencia nuemrica
fprintf('Secuencia numerica captada:\n');
fprintf('%d ',mapeado);

%%Imprimimos Mensaje
fprintf('\n\nEl mensaje codificado en ASCII 6 bits es:\nFeliz navidad y 2017\n')
