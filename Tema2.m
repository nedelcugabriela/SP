P = 40; 
D = 22; 
N = 50;
w0 = 2*pi/P; 
t_tr = 0:0.02:D; 
x_tr = sawtooth((pi/12)*t_tr,0.5)/2+0.5; 
t = 0:0.02:P;
x = zeros(1,length(t)); 
x(t<=D) = x_tr; 
                
figure(1);
plot(t,x),title('x(t)(linie solida) si reconstructia folosind N coeficienti (linie punctata)'); 
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