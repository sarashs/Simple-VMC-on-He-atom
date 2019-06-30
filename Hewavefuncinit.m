function [ phi ] = Hewavefuncinit( r1,r2,alpha )

phi=exp(-2*norm(r1))*exp(-2*norm(r2))*exp((norm(r1-r2)/2/(1+alpha*norm(r1-r2)))); 

end

