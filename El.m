function [ el ] = El( r1,r2,alpha,M )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
el=0;
for x=1:M
nr1=norm(r1(x,:));
nr2=norm(r2(x,:));
nr1r2=norm(r1(x,:)-r2(x,:));
el=el-4+(r1(x,:)/nr1-r2(x,:)/nr2)*((r1(x,:)-r2(x,:))/nr1r2)'/(1+alpha*nr1r2)^2-1/4/(1+alpha*nr1r2)^4-1/nr1r2/(1+alpha*nr1r2)^3+1/nr1r2;%+alpha/(1+alpha*nr1r2)^3-1/nr1r2/(alpha+alpha*nr1r2)^2;
end
el=el/M;
end

