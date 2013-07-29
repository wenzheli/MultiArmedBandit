function [regret, pulls]=pursuit(k, arms,std, rounds, learningRate)
%     The function implements epsilon greedy policy for multi-armd 
%     bandit problem. 
%     Input :
%         arms: the mean reward for each arm
%         k: number of arms
%         std: standard deviation
%         rounds: number steps
%         epsilon: parameter for epsilon greedy policy
%     Output: 
%         regret: regret for each round. row vector 
%         pulls: number of pulls for each arm

optimal = max(arms);         % the reward for optimal arm
pulls = zeros(k,1);          % initialize pulls
regret = zeros(1,rounds);     
% initialize each average as 1
average = zeros(k,1);
for i=1:k
    average(i,1) = 1;
end

% initialize probability for each arm as 1/k
p = zeros(k,1);
for i=1:k
    p(i,1) = 1/k;
end

% iterate
for iter=1:rounds
        % decide which arm to pull based on weights
        idx = getIndexFromProbability(p,k);
        % pull the arms with index idx
        regret(1,iter) = optimal-arms(idx);
        average(idx,1) = (average(idx,1)*pulls(idx,1)+normrnd(arms(idx,1),std))/(pulls(idx,1)+1);
        pulls(idx,1) = pulls(idx,1) + 1;    
        
        % get the index of max average value
        m = 0;
        idx2 = 1;
        for i=1:k
            if m < average(i,1)
                m = average(i,1);
                idx2 = i;
            end
        end
        % update the probabilit for each arm
        for i=1:k
            if i == idx2
                p(i,1) = p(i,1) + learningRate * (1 - p(i,1));
            else
                p(i,1) = p(i,1) + learningRate * (0 - p(i,1));
            end
        end
        
        % normalize the p
        for i=1:k
            p(i,1)=p(i,1)/sum(p(:,1));
        end
end
