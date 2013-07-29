function idx =  getIndexFromProbability(weights,k)
%  return index of arms based on probabilities 
%    idex : output index

% normalize the weights such that sum of probabilities equal to 1
for i=1:k
    weights(i,1)=weights(i,1)/sum(weights(:,1));
end

% random generator for index based on probablities
r = rand;
idx = 1;
interval_s = 0;     % start interval
interval_e = 0;     % end interval
for i=1:k
    interval_e = interval_e + weights(i,1);
    if r >interval_s && r <= interval_e
        idx = i;
        break;
    end
    interval_s = interval_e;
end

