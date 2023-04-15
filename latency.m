function [t_loc_ac,t_d2d,t_es_min]=latency(gmd,lambda_loc,lambda_d2d,lambda_es,t_loc,L,bandwidth,sinr_d2d,xd,fd,sinr_m,noise,n_devices)
for i=1:n_devices
    for j=1:length(gmd)  
t_loc_ac(j)=lambda_loc(j)*t_loc(j);
t_d2d(j)=lambda_d2d(j)*L(j)/(bandwidth*log2(1+sinr_d2d(j)))+ lambda_d2d(j)*L(j)*xd/fd;
t_es_min(j)=lambda_es(j)*L(j)/(bandwidth*log2(1+sinr_m(i)/noise));
    end
end
end
