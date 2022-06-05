clear;
real=[0;0;0;0;0;0;2;0;0;-0.1;0;0;0;0;0;0;0;0;0;0;0];
norm_r=norm(real);
s=size(real);
load('2D_Cubic.mat');
w2=subONR(R,Xt,0.1,1,1,0.01);
for b=1:s(1)
    if abs(w2(b))<0.08
        w2(b)=0;
    end
end
err_o=norm(real-w2)/norm_r;
                           