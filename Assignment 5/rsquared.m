sse=0;
sst=0;
for m=1:length(data)
   sse=sse+(y(m)-yhat(m))^2; 
end
for n=1:length(data)
    sst=sst+(y(n)-mean(y))^2;
end
rsquare=1-sse/sst;