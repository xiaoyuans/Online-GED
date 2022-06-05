function [w,G,losss] = subONR6(A,y,alpha,beta,lambda1,lambda2)
%%%用losss找出异常点
% 
% A     --- The input data
% y     --- The target value
% alpha,beta,lambda1,lambda2     --- The required hyperparameters

[T,d] = size(A);z = zeros(d,1);
n = zeros(d,1);w = zeros(d,1);

losss=zeros(1,T);%保存loss的大小

G=zeros(d,T);%保存每次迭代的w结果，观察它在多少次迭代时收敛
epochs = 1;
while (epochs < 2)
    for i = 1:T
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
        G(:,i)=w;
        if i==1
            losss(i)=0.5*(xt*w-yt)*(xt*w-yt)+lambda1*norm(w,1);
        else
            losss(i)=losss(i-1)-lambda1*norm(G(:,i-1),1)+0.5*(xt*w-yt)*(xt*w-yt)+lambda1*norm(w,1);
        end            
%         if i>=4 && losss(i)-losss(i-1)>0.27 && losss(i-1)-losss(i-2)>0.27 && losss(i-1)-losss(i-2)<19 && abs(losss(i-2)-losss(i-3))==0
%             %%% 320000
%             z = zeros(d,1);
%             n = zeros(d,1);
%             w = zeros(d,1);
%             w1=G(:,i-2);
%             disp('The system changed in last instance!');
%             disp(i-1);
%             disp(losss(i-1));
% %             disp(lossss(i));
%             for b=1:d
%                 if abs(w1(b))<0.08
%                     w1(b)=0;
%                 end
%             end
%             disp(w1);
%         end
        if i>=3 && losss(i)-losss(i-1)>0.26 && abs(losss(i-1)-losss(i-2))<0.04
%%%%%%%%%%%%% 2500
            z = zeros(d,1);
            n = zeros(d,1);
            w = zeros(d,1);
            w1=G(:,i-2);
            disp('The system changed in last instance!');
            disp(i-1);
            disp(losss(i-2));
%             disp(lossss(i));
            for b=1:d
                if abs(w1(b))<0.08
                    w1(b)=0;
                end
            end
            disp(w1);
        end
    end
    epochs = epochs+1; 
end
end