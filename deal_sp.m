function rs_signal=deal_sp(signal,D,sample_length,q)
    maxIter=20;
    data=framing(signal,sample_length,q);
    [theta]=SAStOMP(data,D,maxIter,3.6);
    rs=D*theta;
    rs_signal=linear_ovladd(signal,rs,sample_length,q);
   
end