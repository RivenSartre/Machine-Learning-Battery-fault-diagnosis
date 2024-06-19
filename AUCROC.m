function [X,Y,auc]=AUCROC(predict,ground_truth)
%初始点为(0.0,0.0)
x = 0.0;
y = 0.0;
pos_num=sum(ground_truth==1);
neg_num=sum(ground_truth==0);
%根据该数目可以计算出沿x轴或者y轴的步长
x_step = 1.0/neg_num;
y_step = 1.0/pos_num;
%首先对predict中的分类器输出值按照从大到小排列
[predict,index] = sort(predict,'descend');
ground_truth = ground_truth(index);
%对predict中的每个样本分别判断他们是FP或者是TP
%遍历ground_truth的元素，
%若ground_truth[i]=1,则TP增加了1，往y轴方向上升y_step
%若ground_truth[i]=0,则FP增加了1，往x轴方向上升x_step
for i=1:length(ground_truth)
    if ground_truth(i) == 1
        y = y + y_step;
    else
        x = x + x_step;
    end
    X(i)=x;
    Y(i)=y;
end

%trapz，matlab自带函数，计算小矩形的面积,返回auc
auc = trapz(X,Y);          
end
