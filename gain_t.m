function [ges,gmd,gmd_intf,ges_intf]=gain_t(m_users,d2d_users,alpha,pl_const,bandwidth,ra,n_cl_el)
bs=0;
%ra=ra(ra~=0);
for i=1:length(m_users)
    for j=1:n_cl_el
        ges(i)=gain_cal(m_users(i),bs,alpha,pl_const,bandwidth);
        
        if ra(i,j)>0
            gmd(i,j)=gain_cal(m_users(i),d2d_users(ra(i,j)),alpha,pl_const,bandwidth);
            gmd_intf(i,j)= gain_cal(d2d_users(ra(i,j)),bs,alpha,pl_const,bandwidth); % interference for mobile user
            ges_intf(i)=gain_cal(bs,d2d_users(ra(i,j)),alpha,pl_const,bandwidth);
        else
            gmd(i,j)=0;
            gmd_intf(i,j)=0;
        end
    end

end 
