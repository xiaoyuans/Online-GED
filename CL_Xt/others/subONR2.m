function [w,G,er] = subONR2(A,y,alpha,beta,lambda1,lambda2)
%%%找出异常点

% 
% A     --- The input data
% y     --- The target value
% alpha,beta,lambda1,lambda2     --- The required hyperparameters
G=[];%保存每次迭代的w结果，观察它在多少次迭代时收敛
er=[];%保存w的变化大小
[T,d] = size(A);z = zeros(d,1);
n = zeros(d,1);w = zeros(d,1);
K=1;
K0=2000;%判断是否出现异常
epochs = 1;
while (epochs < 2)
    for i = 1:T
        w1=w;
        xt = A(i,:);yt = y(i);
        I = find(xt~=0);
        for j = 1:length(I)
            a = I(j);
            if abs(z(a)) <= lambda1
                w(a,1) = 0;
            else
                w(a,1) = -1/((beta + sqrt(n(a)))/alpha + lambda2)*(z(a) - sign(z(a))*lambda1);
            end   
        end
        % update g, n, z
%         sg = sigmoid(xt*w);
        for j = 1:length(I)
            a = I(j);
%             g = (sg-yt)*sg*(1-sg)*xt(a); % changing according to different problem
            g = (xt*w-yt)*xt(a);
            sigma = (sqrt(n(a) + g*g) -sqrt(n(a)))/alpha;
            z(a) = z(a)+g-sigma*w(a);
            n(a) = n(a)+g*g;
        end
        err=norm(w-w1);%w的变化
        er=[er,err];
        G=[G,w];
        if i>=2 && er(i)~=0
            K=er(i-1)/er(i);
        end
        if K>=K0
            disp('The system changed in last instance!');
            disp(i-1);
            disp(K);
            disp(er(i));
            disp(er(i-1));
        end
    end
    epochs = epochs+1; 
end
end