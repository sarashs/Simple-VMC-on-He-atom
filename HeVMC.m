clear
N=1e4; %number of steps
M=100; %number of walkers
el=zeros(N,1);
r1=ones(M,3);
r2=ones(M,3);
for k=1:M
r1(k,:)=20*rand(1,3)-10;
r2(k,:)=20*rand(1,3)-10;
end
r1init=r1;
r1new=zeros(M,3);
r2new=zeros(M,3);
elave=zeros(10,1);
elvar=zeros(10,1);
for j=1:10
alpha=(j)*0.05;
deltainit=0.4;
delta=deltainit;
acceptance=0;
for i=1:N
    for k=1:M
    [ phiold ] = Hewavefuncinit( r1(k,:),r2(k,:),alpha );
    r1new(k,:)=2*rand(1,3)-1;
    r1new(k,:)=r1new(k,:)/norm(r1new(k,:));
    r2new(k,:)=2*rand(1,3)-1;
    r2new(k,:)=r2new(k,:)/norm(r2new(k,:));
    r1new(k,:)=r1(k,:)+r1new(k,:)*delta;
    r2new(k,:)=r2(k,:)+r2new(k,:)*delta;
    [ phinew ] = Hewavefuncinit( r1new(k,:),r2new(k,:),alpha );
    w=(phinew^2)/(phiold^2);
    if w>=rand || (phiold==0)
        r1(k,:)=r1new(k,:);
        r2(k,:)=r2new(k,:);
    acceptance=acceptance+1/N/M;
    end
    end
el(i,j)=El(r1,r2,alpha,M);
end
elave(j)=sum(el(:,j))/N;
elvar(j)=sum(el(:,j).^2)/N-elave(j)^2;
j
end