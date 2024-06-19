function [accuracy, percision, recall, F1score] = modelscore(cmx)
    TP=cmx(1,1);
    FN=cmx(1,2);
    FP=cmx(2,1);
    TN=cmx(2,2);
    accuracy=(TP+TN)/(TP+FN+FP+TN);
    percision=TP / (TP + FP);
    recall=TP / (TP + FN);
    F1score=2*(percision*recall)/(percision+recall);
end

