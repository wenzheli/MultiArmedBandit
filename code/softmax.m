function [regret, pulls]=softmax(k, arms,std, rounds, temperature)
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

for iter=1:rounds
        weights = zeros(k,1);   % probability for pulling each arm
        sum = 0;
        % get the sum
        for i=1:k
            sum = sum + exp(average(i,1)/temperature);
        end
        % get the weight for each arm
        for i=1:k
            weights(i,1) = exp(average(i,1)/temperature)/sum;
        end
        % decide which arm to pull based on weights
        idx = getIndexFromProbability(weights);
        % pull the arms with index idx
        regret(1,iter) = optimal-arms(idx);
        average(idx,1) = (average(idx,1)*pulls(idx,1)+normrnd(arms(idx,1),std))/(pulls(idx,1)+1);
        pulls(idx,1) = pulls(idx,1) + 1;    
end
