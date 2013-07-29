function [regret, pulls]= epsilon_n_greedy(k, arms,std,rounds,c)
%    The function implements UCB1 policy for multi-armed bandit problems
%     Input: 
%         k:  number of arms
%         std:  standard deviation
%         rounds: number of trials
%         c:  integer, parameter
%     Output: 
%         regret: regret for each round. row vector 
%         pulls: number of pulls for each arm
optimal = max(arms);         % the reward for optimal arm
pulls = zeros(k,1);          % initialize pulls
regret = zeros(1,rounds); 
average = zeros(k,1);
epsilons = zeros(rounds,1);
% initialize epsilons
d=1;
for i=1:rounds
    epsilons(i,1)= min(1,c*k/(d*d*i));
end

% play machine j that maximize average_xj + sqrt(2*lgn/nj)
for iter = 1:rounds
    if rand < epsilons(iter,1)
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




