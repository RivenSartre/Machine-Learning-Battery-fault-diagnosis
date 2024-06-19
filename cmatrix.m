function [cmx] = cmatrix(test_simu,test_y,p)
test_y1=zeros(2000);
for i=1:length(test_y)
    if test_simu(i)<p
        test_y1(i)=0;
    else 
        test_y1(i)=1;
    end
end

cmx=zeros(2,2);
for i=1:length(test_y)
    if test_y1(i)==0 && test_y(i)==0
        cmx(1,1)=cmx(1,1)+1;
    elseif test_y1(i)==0 && test_y(i)==1
        cmx(1,2)=cmx(1,2)+1;
    elseif test_y1(i)==1 && test_y(i)==1
        cmx(2,2)=cmx(2,2)+1;
    elseif test_y1(i)==1 && test_y(i)==0
        cmx(2,1)=cmx(2,1)+1;
    end
end
end

