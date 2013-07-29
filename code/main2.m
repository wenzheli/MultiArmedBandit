% parameters
rounds = 1000;
ks = [10,20,30,40];
   
for iteration=1:4
    k=ks(iteration);
arms = rand(k,1);
std= rand(k,1);

% % Test for epsilon greedy policy
% epsilon_greedy_1 = zeros(1000,rounds);
% for iter = 1:1000
%     epsilon_greedy_1(iter,:) = epsilon_greedy(k,arms,std,rounds,0.1);
% end
% 
% epsilon_greedy_2 = zeros(1000,rounds);
% for iter = 1:1000
%     epsilon_greedy_2(iter,:) = epsilon_greedy(k,arms,std,rounds,0.01);
% end
% 
% epsilon_greedy_3 = zeros(1000,rounds);
% for iter = 1:1000
%     epsilon_greedy_3(iter,:) = epsilon_greedy(k,arms,std,rounds,0.001);
% end
% 
% epsilon_greedy_4 = zeros(1000,rounds);
% for iter = 1:1000
%     epsilon_greedy_4(iter,:) = epsilon_greedy(k,arms,std,rounds,0.0001);
% end
% 
% figure 
% plot(mean(epsilon_greedy_1(:,:)),'b');
% hold on;
% plot(mean(epsilon_greedy_2(:,:)),'c');
% plot(mean(epsilon_greedy_3(:,:)),'m');
% plot(mean(epsilon_greedy_4(:,:)),'k');
% axis([1 rounds 0 0.12])
% ylabel('regret');
% xlabel('trial');
% legend('\epsilon =0.1', '\epsilon =0.01','\epsilon =0.001','\epsilon =0.0001');
% title('Regret for \epsilon greedy policy with different level of \epsilon value');
% 
% % disp(' '); disp('Hit any key to continue...'); pause
% 
% % test for SoftMax Policy
% softmax_1 = zeros(1000,rounds);
% for iter = 1:1000
%     softmax_1(iter,:) = epsilon_greedy(k,arms,std,rounds,0.1);
% end
% 
% softmax_2 = zeros(1000,rounds);
% for iter = 1:1000
%     softmax_2(iter,:) = epsilon_greedy(k,arms,std,rounds,0.01);
% end
% 
% softmax_3 = zeros(1000,rounds);
% for iter = 1:1000
%     softmax_3(iter,:) = epsilon_greedy(k,arms,std,rounds,0.001);
% end
% 
% softmax_4 = zeros(1000,rounds);
% for iter = 1:1000
%     softmax_4(iter,:) = epsilon_greedy(k,arms,std,rounds,0.0001);
% end
% 
% figure
% plot(mean(softmax_1(:,:)),'b');
% hold on;
% plot(mean(softmax_2(:,:)),'c');
% plot(mean(softmax_3(:,:)),'m');
% plot(mean(softmax_4(:,:)),'k');
% axis([1 rounds 0 0.12])
% ylabel('regret');
% xlabel('trial');
% legend('temperature =0.1', 'temperature =0.01','temperature =0.001','temperature =0.0001');
% title('Regret for softmax policy with different level of temperature value');
% 
% 
% % disp(' '); disp('Hit any key to continue...'); pause
% 
% % test UCB1
% UCB1_1 = zeros(1000,rounds);
% for iter = 1:1000
%     UCB1_1(iter,:) = UCB1(k,arms,std,rounds);
% end
% figure
% plot(mean(UCB1_1(:,:)),'b');
% axis([1 rounds 0 0.12])
% ylabel('regret');
% xlabel('trial');
% title('Regret for UCB1 policy');
% % disp(' '); disp('Hit any key to continue...'); pause
% 
% % test Pursuit 
% pursuit_1 = zeros(1000,rounds);
% pulls_1 = zeros(k,1000);
% for iter = 1:1000
%     [pursuit_1(iter,:),pulls_1(:,iter)] = pursuit(k,arms,std,rounds,0.5);
% end
% 
% pursuit_2 = zeros(1000,rounds);
% pulls_2 = zeros(k,1000);
% for iter = 1:1000
%     [pursuit_2(iter,:),pulls_2(:,iter)] = pursuit(k,arms,std,rounds,0.25);
% end
% 
% pursuit_3 = zeros(1000,rounds);
% pulls_3 = zeros(k,1000);
% for iter = 1:1000
%     [pursuit_3(iter,:),pulls_3(:,iter)] = pursuit(k,arms,std,rounds,0.1);
% end
% 
% pursuit_4 = zeros(1000,rounds);
% pulls_4 = zeros(k,1000);
% for iter = 1:1000
%     [pursuit_4(iter,:),pulls_4(:,iter)] = pursuit(k,arms,std,rounds,0.05);
% end
% 
% figure
% plot(mean(pursuit_1(:,:)),'b');
% hold on;
% plot(mean(pursuit_2(:,:)),'c');
% plot(mean(pursuit_3(:,:)),'m');
% plot(mean(pursuit_4(:,:)),'k');
% axis([1 rounds 0 0.12])
% ylabel('regret');
% xlabel('trial');
% legend('learningRate =0.5', 'learningRate =0.25','learningRate =0.1','learningRate =0.05');
% title('Regret for pursuit policy with different level of learning rate value');
% 
% % disp(' '); disp('Hit any key to continue...'); pause
% % test epsilon_n_greedy
% epsilon_n_greedy_1 = zeros(1000,rounds);
% pulls_1 = zeros(k,1000);
% for iter = 1:1000
%     [epsilon_n_greedy_1(iter,:),pulls_1(:,iter)] = epsilon_n_greedy(k,arms,std,rounds,1);
% end
% 
% epsilon_n_greedy_2 = zeros(1000,rounds);
% pulls_2 = zeros(k,1000);
% for iter = 1:1000
%     [epsilon_n_greedy_2(iter,:),pulls_2(:,iter)] = epsilon_n_greedy(k,arms,std,rounds,2);
% end
% 
% epsilon_n_greedy_3 = zeros(1000,rounds);
% pulls_3 = zeros(k,1000);
% for iter = 1:1000
%     [epsilon_n_greedy_3(iter,:),pulls_3(:,iter)] = epsilon_n_greedy(k,arms,std,rounds,5);
% end
% 
% epsilon_n_greedy_4 = zeros(1000,rounds);
% pulls_4 = zeros(k,1000);
% for iter = 1:1000
%     [epsilon_n_greedy_4(iter,:),pulls_4(:,iter)] = epsilon_n_greedy(k,arms,std,rounds,10);
% end
% 
% figure
% plot(mean(epsilon_n_greedy_1(:,:)),'b');
% hold on;
% plot(mean(epsilon_n_greedy_2(:,:)),'c');
% plot(mean(epsilon_n_greedy_3(:,:)),'m');
% plot(mean(epsilon_n_greedy_4(:,:)),'k');
% axis([1 rounds 0 0.12])
% ylabel('regret');
% xlabel('trial');
% legend('c =1', 'c =2','c=5','c =10');
% title('Regret for \epsilon n-greedy policy with different level of c value');
% 
% % disp(' '); disp('Hit any key to continue...'); pause
% 
% % test Exp3
% Exp3_1 = zeros(1000,rounds);
% pulls_1 = zeros(k,1000);
% for iter = 1:1000
%     [Exp3_1(iter,:),pulls_1(:,iter)] = Exp3(k,arms,std,rounds,0.1);
% end
% 
% Exp3_2 = zeros(1000,rounds);
% pulls_2 = zeros(k,1000);
% for iter = 1:1000
%     [Exp3_2(iter,:),pulls_2(:,iter)] = Exp3(k,arms,std,rounds,0.2);
% end
% 
% Exp3_3 = zeros(1000,rounds);
% pulls_3 = zeros(k,1000);
% for iter = 1:1000
%     [Exp3_3(iter,:),pulls_3(:,iter)] = Exp3(k,arms,std,rounds,0.5);
% end
% 
% Exp3_4 = zeros(1000,rounds);
% pulls_4 = zeros(k,1000);
% for iter = 1:1000
%     [Exp3_4(iter,:),pulls_4(:,iter)] = Exp3(k,arms,std,rounds,0.8);
% end
% 
% figure
% plot(mean(Exp3_1(:,:)),'b');
% hold on;
% plot(mean(Exp3_2(:,:)),'c');
% plot(mean(Exp3_3(:,:)),'m');
% plot(mean(Exp3_4(:,:)),'k');
% axis([1 rounds 0 0.5])
% ylabel('regret');
% xlabel('trial');
% legend('\gamma =0.1', '\gamma =0.2','\gamma= 0.5','\gamma =0.8');
% title('Regret for Exp3 policy with different level of \gamma value');
% 
% % disp(' '); disp('Hit any key to continue...'); pause

% comparisions of different algorithms 
epsilon_greedy_1 = zeros(1000,rounds);
for iter = 1:1000
    epsilon_greedy_1(iter,:) = epsilon_greedy(k,arms,std,rounds,0.01);
end

softmax_1 = zeros(1000,rounds);
for iter = 1:1000
    softmax_1(iter,:) = epsilon_greedy(k,arms,std,rounds,0.01);
end

UCB1_1 = zeros(1000,rounds);
for iter = 1:1000
    UCB1_1(iter,:) = UCB1(k,arms,std,rounds);
end

pursuit_1 = zeros(1000,rounds);
pulls_1 = zeros(k,1000);
for iter = 1:1000
    [pursuit_1(iter,:),pulls_1(:,iter)] = pursuit(k,arms,std,rounds,0.05);
end

epsilon_n_greedy_1 = zeros(1000,rounds);
pulls_1 = zeros(k,1000);
for iter = 1:1000
    [epsilon_n_greedy_1(iter,:),pulls_1(:,iter)] = epsilon_n_greedy(k,arms,std,rounds,1);
end

Exp3_1 = zeros(1000,rounds);
pulls_1 = zeros(k,1000);
for iter = 1:1000
    [Exp3_1(iter,:),pulls_1(:,iter)] = Exp3(k,arms,std,rounds,0.1);
end

figure
plot(mean(epsilon_greedy_1(:,:)),'b');
hold on;
plot(mean(softmax_1(:,:)),'c');
plot(mean(UCB1_1(:,:)),'m');
plot(mean(pursuit_1(:,:)),'k');
plot(mean(epsilon_n_greedy_1(:,:)),'r');
plot(mean(Exp3_1(:,:)),'g');
axis([1 rounds 0 0.5])
ylabel('regret');
xlabel('trial');
legend('\epsilon-greedy', 'softmax','UCB1','pursuit','\epsilon_n-greedy','Exp3');
title('Comparision of different algorithms based on expected regret, using random variances');


end

% %% test UCB1_dynamic
% k1 = 10;
% arms1 = rand(k1,1);
% 
% UCB1_dynamic_1 = zeros(1000,rounds*2);
% pulls_1 = zeros(k,1000);
% for iter = 1:1000
%     [UCB1_dynamic_1(iter,:),pulls_1(:,iter)] = UCB1_dynamic(k,arms,k1,arms1,std,rounds);
% end
% 
% %% test eposilon_dynamic
% eposilon_dynamic_1 = zeros(1000,rounds*2);
% pulls_1 = zeros(k,1000);
% for iter = 1:1000
%     [eposilon_dynamic_1(iter,:),pulls_1(:,iter)] = epsilon_greedy_dynamic(k,arms,k1,arms1,std,rounds,0.01);
% end
% 
% figure
% plot(mean(eposilon_dynamic_1(:,:)),'b');
% hold on;
% plot(mean(UCB1_dynamic_1(:,:)),'c');
% axis([1 2*rounds 0 0.5])
% ylabel('regret');
% xlabel('trial');
% legend('UCB1','\epsilon-greedy');
% title('Comparision between UCB1 and \epsilon-greedy');



