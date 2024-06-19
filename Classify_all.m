function [cmx_all] = Classify_all(test_simu,test_y,p)
[u,v]=size(test_y);
test_y1=zeros(u,v);
for i=1:v
    for j=1:3
        if test_simu(j,i)<p
            test_y1(j,i)=0;
        else 
            test_y1(j,i)=1;
        end
    end
end

b=test_y1(1,:)*1+test_y1(2,:)*2+test_y1(3,:)*4;
c=test_y(1,:)*1+test_y(2,:)*2+test_y(3,:)*4;
cmx_all=zeros(2,1);
for i=1:v
    if b(i)==c(i)
        cmx_all(1)=cmx_all(1)+1;
    else 
        cmx_all(2)=cmx_all(2)+1;
    end
end
end

