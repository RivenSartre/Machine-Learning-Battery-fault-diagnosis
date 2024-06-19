function [FPR_p,TPR_p,AUC] = printROC(label,p)

%%初始定义
confu = zeros(2,2);     %定义混淆矩阵
FPR_p=[]; TPR_p=[];     %定义画图变量
xx=1;
 
%%ROC运算
for value=0:0.001:1
    box = zeros(1,size(p,2));   %定义缓存向量
    for i=1:size(p,2)  
        if p(i)>=value    %判断阈值
            box(i) = 1;
        else
            box(i) = 0;
        end
        
        if box(i)==0 && label(i)==0     %导入混淆矩阵
            confu(2,2) = confu(2,2) + 1;     %TN
        elseif box(i)==0 && label(i)==1
            confu(1,2) = confu(1,2) + 1;     %FN
        elseif box(i)==1 && label(i)==0
            confu(2,1) = confu(2,1) + 1;     %FP
        elseif box(i)==1 && label(i)==1
            confu(1,1) = confu(1,1) + 1;     %TP
        end
    end
    
    TN=confu(2,2); FN=confu(1,2); FP=confu(2,1); TP=confu(1,1);
    FPR = FP/(FP+TN);   %定义式
    TPR = TP/(TP+FN);
    FPR_p(xx) = FPR;  %画图坐标赋值
    TPR_p(xx) =  TPR;
    xx=xx+1;
end
AUC = -1*trapz(FPR_p,TPR_p);    %求AUC值（曲线的面积）

%%画ROC图
%figure(1)
%plot(x_label,y_label);
%title({'ROC曲线', ['AUC = ', num2str(AUC)]});
%xlabel("FPR");
%ylabel("TPR");
%hold on
%plot(x_label, yy,'g');
end

