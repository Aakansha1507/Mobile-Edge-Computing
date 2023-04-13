function cc_sinr=cc_sinr_in(signal_power,gain,noise_power,if_power,if_link,cl_radius)
%if_power=interference power
%if_link=interference link
gain=gain';
for i=1:length(gain)
    for j=1:length(if_power)
        %cc_sinr_abs(i,j)=(signal_power(i)*gain(i))/(noise_power*(cl_radius^4)+(if_power(j)*if_link(j)));
        cc_sinr_abs(i,j)=(signal_power(i)*gain(i))/(noise_power+(if_power(j)*if_link(j)));
    end
end
cc_sinr=10*log10(cc_sinr_abs);
end
