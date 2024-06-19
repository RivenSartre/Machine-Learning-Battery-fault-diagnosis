function [net,test_simu] = naiveBPN(train_x,train_y,test_x,hiddennum)
net = newff(train_x, train_y, hiddennum, {'tansig', 'purelin'}, 'trainlm'); % 建立模型，传递函数使用purelin，采用梯度下降法训练

W1 = net. iw{1, 1}; %输入层到中间层的权值
B1 = net.b{1}; %中间各层神经元阈值

W2 = net.lw{2, 1}; %中间层到输出层的权值
B2 = net. b{2}; %输出层各神经元阈值

%% 第五步 网络参数配置（ 训练次数，学习速率，训练目标最小误差等）
net.trainParam.epochs = 10000; % 训练次数，这里设置为1000次
net.trainParam.lr = 0.01; % 学习速率，这里设置为0.01
net.trainParam.goal = 0.0001; % 训练目标最小误差，这里设置为0.00001

%% 第六步 BP神经网络训练
net = train(net, train_x, train_y); %开始训练，其中inputn,outputn分别为输入输出样本

%% 第八步 BP神经网络预测
test_simu = sim(net, test_x); %用训练好的模型进行仿真
end

