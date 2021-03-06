P = 40; 
D = 10; 
N = 50;
w0 = 2*pi/P;
t_tr = 0:0.02:D;
x_tr = sawtooth((pi/12)*t_tr,0.5)/2+0.5; 
t = 0:0.02:P; 
x = zeros(1,length(t)); 
x(t<=D) = x_tr; 
                
figure(1);
plot(t,x),title('x(t)(linie solida) si reconstructia folosind N coeficienti (linie punctata)'); %afisare x(t)
hold on;


for k = -N:N 
    x_t = x_tr; 
    x_t = x_t .* exp(-1i*k*w0*t_tr); 
    X(k+N+1) = 0; 
    for i = 1:length(t_tr)-1
        X(k+N+1) = X(k+N+1) + (t_tr(i+1)-t_tr(i)) * (x_t(i)+x_t(i+1))/2; 
    end
end

for i = 1:length(t) 
    x_finit(i) = 0; 
    for k=-N:N
        x_finit(i) = x_finit(i) + (1/P) * X(k+51) * exp(1i*k*w0*t(i));  
    end
end
plot(t,x_finit,'--');

figure(2);
w=-50*w0:w0:50*w0; 
stem(w/(2*pi),abs(X)),title('Spectrul lui x(t)');
figure(2);
w=-50*w0:w0:50*w0;
stem(w/(2*pi),abs(X)),title('Spectrul lui x(t)');

%Conform cursului de SS, teoria seriilor Fourier (trigonometrica, armonica si complexa) ne spune
%ca orice semnal periodic poate fi aproximat printr-o suma infinita de sinusuri
%si cosinusuri de diferite frecvente, fiecare ponderat cu un anumit coeficient. 
%Acesti coeficienti reprezinta practic spectrul (amplitudinea pentru anumite frecvente).
%Semnalul reconstruit foloseste un numar finit de termeni(N=50) si se apropie ca
%forma de semnalul original, insa prezinta o marja de eroare. Cu cat marim
%numarul de coeficienti ai SF, aceasta marja de eroare va fi din ce in ce mai
%mica. In plus se observa faptul ca semnalul poate fi aproximat printr-o
%suma de sinusoide, variatiile semnalului prezentand un caracter sinusoidal.