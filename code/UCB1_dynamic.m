function [regret, pulls]= UCB1_dynamic(k, arms,k1,arms1,std,rounds)
%    The function implements UCB1 policy for multi-armed bandit problems
%     Input: 
%         k:  number of arms
%         std:  standard deviation
%         rounds: number of trials
%     Output: 
%         regret: regret for each round. row vector 
%         pulls: number of pulls for each arm

optimal = max(arms);         % the reward for optimal arm
pulls = zeros(k,1);          % initialize pulls
regret = zeros(1,2*rounds); 
average = zeros(k,1);
% Play each machine once
for i=1:k
    pulls(i) = pulls(i) + 1;
    average(i) = normrnd(arms(i),std);
    regret(1,i) = optimal - arms(i);
end

% play machine j that maximize average_xj + sqrt(2*lgn/nj)
for i = k+1:rounds
    % select the arm to pull
    temp = zeros(k,1);
    index = 1;
    m = 0;
    for j=1:k
        temp(j) = average(j,1) + sqrt(2*log(i)/pulls(j,1));
        if m < temp(j)
            m = temp(j);
            index = j;
        end
    end
    
    % play arm with index
    regret(1,i) = optimal - arms(index);
    average(index) = (average(index) * pulls(index) + normrnd(arms(index),std))/(pulls(index)+1);
    pulls(index) = pulls(index) + 1;
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
% play each arm for new added arms
% Play each machine once
for i=k+1:k+k1
    pulls2(i) = pulls2(i) + 1;
    average2(i) = normrnd(arms2(i),std);
    regret(1,i) = optimal - arms2(i);
end

% play machine j that maximize average_xj + sqrt(2*lgn/nj)
for i = rounds +k+1: 2*rounds;
    % select the arm to pull
    temp = zeros(k+k1,1);
    index = 1;
    m = 0;
    for j=1:k+k1
        temp(j) = average2(j,1) + sqrt(2*log(i)/pulls2(j,1));
        if m < temp(j)
            m = temp(j);
            index = j;
        end
    end
    
    % play arm with index
    regret(1,i) = optimal - arms2(index);
    average2(index) = (average2(index) * pulls2(index) + normrnd(arms2(index),std))/(pulls2(index)+1);
    pulls2(index) = pulls2(index) + 1;
end


