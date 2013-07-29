function [regret, pulls]=Exp3(k, arms,std, rounds, gamma)
%     The function implements epsilon greedy policy for multi-armd 
%     bandit problem. 
%     Input :
%         arms: the mean reward for each arm
%         k: number of arms
%         std: standard deviation
%         rounds: number steps
%         gamma: parameter for epsilon greedy policy
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

% initialize w. Set as 1 for each w(i)
w = zeros(k,1);
for i=1:k
    w(i,1) = 1;
end
p = zeros(k,1);
% iterate
for iter=1:rounds
    % Set probability    
    for i=1:k
        p(i,1)=(1-gamma)*w(i,1)/sum(w(:,1)) + gamma/k;
    end
    % decide which arm to pull based on weights
    idx = getIndexFromProbability(p,k);
    % pull the arms with index idx
    regret(1,iter) = optimal-arms(idx);
    r = normrnd(arms(idx,1),std);
    average(idx,1) = (average(idx,1)*pulls(idx,1)+r)/(pulls(idx,1)+1);
    pulls(idx,1) = pulls(idx,1) + 1;    
        
    
    % update the probabilit for each arm
    for i=1:k
        if i == idx
            w(i,1)=w(i,1)*exp((gamma*r/p(i,1))/k);
        end
    end
end
