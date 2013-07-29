function [regret, pulls]=epsilon_greedy(k, arms,std, rounds, epsilon)
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
    if rand < epsilon
        % randomly pull one of arm
        index = randi(k);
        regret(1,iter) = optimal-arms(index);
        average(index,1) = (average(index,1)*pulls(index,1)+normrnd(arms(index,1),std))/(pulls(index,1)+1);
        pulls(index,1) = pulls(index,1) + 1;
    else
        % pull the arm with highest average award
        idx=1;
        m=0;
        for j=1:k
            if average(j,1) > m
                m = average(j,1);
                idx = j;
            end
        end
        
        % pull the arms with index idx
        regret(1,iter) = optimal-arms(idx);
        average(idx,1) = (average(idx,1)*pulls(idx,1)+normrnd(arms(idx,1),std))/(pulls(idx,1)+1);
        pulls(idx,1) = pulls(idx,1) + 1;
        
    end
    
end
