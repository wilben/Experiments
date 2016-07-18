
% draw mae reults with different friends

% ml05x_m = [0.8242,0.813,0.805,0.8,0.7943,0.7913,0.7888,0.7856, 0.783,0.7815];
% ml05x_d = [0.007,0.0083,0.0086,0.0083,0.0097,0.0088,0.009,0.0088,0.008, 0.0089];

% ml10x_m = [0.8278,0.8079,0.8046,0.7819,0.7729,0.7614,0.7614,0.7484,0.7413,0.7379];
% ml10x_d = [0.0102,0.0116,0.0123,0.0115,0.0125,0.0112,0.0106, 0.0107,0.0106,0.0102];

ml05x_m = [0.8195,0.8115,0.805,0.7987,0.7926,0.7909,0.786,0.7836, 0.7823,0.7779];
ml05x_d = [0.0102,0.0116,0.0123,0.0115,0.0125,0.0112,0.0106, 0.0107,0.0106,0.0102];

ml10x_m = [0.829,0.8086,0.7952,0.7834,0.7728,0.7636,0.7572,0.7484,0.7428,0.7386];
ml10x_d = [0.0091,0.0103,0.0155,0.016,0.0177,0.0165,0.019, 0.0177,0.0182,0.0184];

ml05x_max = [0.8314,0.8238,0.8174,0.8114,0.8083,0.8026,0.7992,0.7962, 0.7946,0.7922];
ml05x_min = [0.8042,0.7967,0.7848,0.7817,0.775,0.7744,0.772,  0.7672, 0.7658,0.7654];

ml10x_max = [0.8437,0.825,0.8173,0.8076,0.7985,0.7895,0.7868,0.7748, 0.769,0.7749];
ml10x_min = [0.817,0.7958,0.7772,0.7649,0.7499,0.7471,0.7387,0.7285, 0.7237,0.7151];


% reda05x_m = [0.6204,0.6161,0.6105,0.6105,0.6076];
% reda05x_d = [0.0106,0.0092,0.0085,0.0103,0.0105];

% reda10x_m = [0.6558,0.6413,0.6413,0.6395,0.6382];
% reda10x_d = [0.0148,0.0144,0.0151,0.0129,0.013];

reda05x_m = [0.6178, 0.614, 0.6076, 0.6073,0.6066];
reda05x_d = [0.008,0.0099,0.0093,0.0101,0.011];

reda05x_max = [0.6316, 0.6274, 0.6244, 0.624,0.623];
reda05x_min = [0.6081,0.6017,0.5959,0.5932,0.5912];

reda10x_m = [0.6388,0.6459,0.6371,0.63,0.6289];
reda10x_d = [0.0135,0.0087,0.013,0.0144,0.0142];

reda10x_max = [0.6586, 0.6591, 0.6584, 0.6559,0.6521];
reda10x_min = [0.6189,0.6175,0.6194,0.6131,0.6103];


figure
hold on
box on
grid on
plot(1:10,ml05x_m,'b-o',1:10,ml10x_m,'b--*',1:5,reda05x_m,'k-d',1:5,reda10x_m,'k--^','LineWidth',3, 'MarkerSize',16);
legend('MovieLens: \alpha=5, \beta=5','MovieLens: \alpha=10, \beta=0','10-FMT: \alpha=5, \beta=5','10-FMT: \alpha=10, \beta=0','FontSize',32,'Location','SouthEast')
xlabel('Friends Num','FontSize',32)
ylabel('MAE','FontSize',32)
ax = gca;
ax.XTick = 1:10;
set(gca,'xticklabel',{'10' '20' '30' '40' '50' '60' '70' '80' '90' '100'},'FontSize',32);
xlim([0.8,10.2]);
ylim([0.57,0.86]);
plot(0.8:0.1:1.2,reda05x_max(1)*ones(1,5),1.8:0.1:2.2,reda05x_max(2)*ones(1,5),2.8:0.1:3.2,reda05x_max(3)*ones(1,5),3.8:0.1:4.2,reda05x_max(4)*ones(1,5),4.8:0.1:5.2,reda05x_max(5)*ones(1,5),'Color','g','LineWidth',3);
plot(0.8:0.1:1.2,reda05x_min(1)*ones(1,5),1.8:0.1:2.2,reda05x_min(2)*ones(1,5),2.8:0.1:3.2,reda05x_min(3)*ones(1,5),3.8:0.1:4.2,reda05x_min(4)*ones(1,5),4.8:0.1:5.2,reda05x_min(5)*ones(1,5),'Color','g','LineWidth',3);

plot(0.8:0.1:1.2,reda10x_max(1)*ones(1,5),1.8:0.1:2.2,reda10x_max(2)*ones(1,5),2.8:0.1:3.2,reda10x_max(3)*ones(1,5),3.8:0.1:4.2,reda10x_max(4)*ones(1,5),4.8:0.1:5.2,reda10x_max(5)*ones(1,5),'Color','r','LineWidth',3);
plot(0.8:0.1:1.2,reda10x_min(1)*ones(1,5),1.8:0.1:2.2,reda10x_min(2)*ones(1,5),2.8:0.1:3.2,reda10x_min(3)*ones(1,5),3.8:0.1:4.2,reda10x_min(4)*ones(1,5),4.8:0.1:5.2,reda10x_min(5)*ones(1,5),'Color','r','LineWidth',3);

plot(0.8:0.1:1.2,ml05x_max(1)*ones(1,5),1.8:0.1:2.2,ml05x_max(2)*ones(1,5),2.8:0.1:3.2,ml05x_max(3)*ones(1,5),3.8:0.1:4.2,ml05x_max(4)*ones(1,5),4.8:0.1:5.2,ml05x_max(5)*ones(1,5), 5.8:0.1:6.2,ml05x_max(6)*ones(1,5),6.8:0.1:7.2,ml05x_max(7)*ones(1,5),7.8:0.1:8.2,ml05x_max(8)*ones(1,5),8.8:0.1:9.2,ml05x_max(9)*ones(1,5),9.8:0.1:10.2,ml05x_max(10)*ones(1,5),'Color','g','LineWidth',3);
plot(0.8:0.1:1.2,ml05x_min(1)*ones(1,5),1.8:0.1:2.2,ml05x_min(2)*ones(1,5),2.8:0.1:3.2,ml05x_min(3)*ones(1,5),3.8:0.1:4.2,ml05x_min(4)*ones(1,5),4.8:0.1:5.2,ml05x_min(5)*ones(1,5), 5.8:0.1:6.2,ml05x_min(6)*ones(1,5),6.8:0.1:7.2,ml05x_min(7)*ones(1,5),7.8:0.1:8.2,ml05x_min(8)*ones(1,5),8.8:0.1:9.2,ml05x_min(9)*ones(1,5),9.8:0.1:10.2,ml05x_min(10)*ones(1,5),'Color','g','LineWidth',3);

plot(0.8:0.1:1.2,ml10x_max(1)*ones(1,5),1.8:0.1:2.2,ml10x_max(2)*ones(1,5),2.8:0.1:3.2,ml10x_max(3)*ones(1,5),3.8:0.1:4.2,ml10x_max(4)*ones(1,5),4.8:0.1:5.2,ml10x_max(5)*ones(1,5), 5.8:0.1:6.2,ml10x_max(6)*ones(1,5),6.8:0.1:7.2,ml10x_max(7)*ones(1,5),7.8:0.1:8.2,ml10x_max(8)*ones(1,5),8.8:0.1:9.2,ml10x_max(9)*ones(1,5),9.8:0.1:10.2,ml10x_max(10)*ones(1,5),'Color','r','LineWidth',3);
plot(0.8:0.1:1.2,ml10x_min(1)*ones(1,5),1.8:0.1:2.2,ml10x_min(2)*ones(1,5),2.8:0.1:3.2,ml10x_min(3)*ones(1,5),3.8:0.1:4.2,ml10x_min(4)*ones(1,5),4.8:0.1:5.2,ml10x_min(5)*ones(1,5), 5.8:0.1:6.2,ml10x_min(6)*ones(1,5),6.8:0.1:7.2,ml10x_min(7)*ones(1,5),7.8:0.1:8.2,ml10x_min(8)*ones(1,5),8.8:0.1:9.2,ml10x_min(9)*ones(1,5),9.8:0.1:10.2,ml10x_min(10)*ones(1,5),'Color','r','LineWidth',3);

hold off

draw_rectangle(ml05x_m,ml05x_d,'g');
draw_rectangle(ml10x_m,ml10x_d,'r');

draw_rectangle(reda05x_m,reda05x_d,'g');
draw_rectangle(reda10x_m,reda10x_d,'r');