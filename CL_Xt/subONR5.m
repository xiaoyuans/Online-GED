function [w,G,loss] = subONR5(A,y,alpha,beta,lambda1,lambda2)
%%%用loss找出异常点
% 
% A     --- The input data
% y     --- The target value
% alpha,beta,lambda1,lambda2     --- The required hyperparameters

[T,d] = size(A);z = zeros(d,1);
n = zeros(d,1);w = zeros(d,1);
loss=zeros(1,T);%保存loss的大小
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
        %%计算损失
        loss(i)=0.5*(xt*w-yt)*(xt*w-yt)+lambda1*norm(w,1);
        if i>=4 && abs(loss(i)-loss(i-1))>0.07 && abs(loss(i-2)-loss(i-3))<0.01
%%%%%%%%%%%%% 2500
            z = zeros(d,1);
            n = zeros(d,1);
            w = zeros(d,1);
            w1=G(:,i-1);
            disp('The system changed in last instance!');
            disp(i-1);
            disp(loss(i-2));
            disp(loss(i-1));
            disp(loss(i));
            for b=1:d
                 if abs(w1(b))<0.08
                     w1(b)=0;
                 end
            end
            disp(w1);
        end
%         if i>=3 && abs(loss(i)-loss(i-1))>0.1 && abs(loss(i-1)-loss(i-2))<0.000007
%             %%% 320000
%             z = zeros(d,1);
%             n = zeros(d,1);
%             w = zeros(d,1);
%             w1=G(:,i-1);
%             disp('The system changed in last instance!');
%             disp(i);
%             disp(loss(i-2));
%             disp(loss(i-1));
%             disp(loss(i));
%             for b=1:d
%                  if abs(w1(b))<0.08
%                      w1(b)=0;
%                  end
%             end
%             disp(w1);
%         end
    end
    epochs = epochs+1; 
end
end