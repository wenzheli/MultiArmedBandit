function [regret, pulls]=epsilon_greedy_dynamic(k, arms,k1,arms1, std, rounds, epsilon)
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
regret = zeros(1,rounds*2);     
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

% at T =1000, there is another new arms added -arms
average2 = zeros(k+k1,1);
pulls2 = zeros(k+k1,1);
arms2 = zeros(k+k1,1);
average2(1:k,1) = average;
pulls2 (1:k,1)=pulls;
arms2 (1:k,1)=arms;
arms2(k+1:k+k1,1)=arms1;
optimal = max(arms2);

% Play each machine once
for i=k+1:k+k1
    pulls2(i) = pulls2(i) + 1;
    average2(i) = normrnd(arms2(i),std);
    regret(1,i) = optimal - arms2(i);
end

for iter=rounds +k+1:rounds*2
    if rand < epsilon
        % randomly pull one of arm
        index = randi(k+k1);
        regret(1,iter) = optimal-arms2(index);
        average2(index,1) = (average2(index,1)*pulls2(index,1)+normrnd(arms2(index,1),std))/(pulls2(index,1)+1);
        pulls2(index,1) = pulls2(index,1) + 1;
    else
        % pull the arm with highest average award
        idx=1;
        m=0;
        for j=1:k+k1
            if average2(j,1) > m
                m = average2(j,1);
                idx = j;
            end
        end
        
        % pull the arms with index idx
        regret(1,iter) = optimal-arms2(idx);
        average2(idx,1) = (average2(idx,1)*pulls2(idx,1)+normrnd(arms2(idx,1),std))/(pulls2(idx,1)+1);
        pulls2(idx,1) = pulls2(idx,1) + 1;
        
    end
    
end

