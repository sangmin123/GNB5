clc;clear;

% figure('color', [1, 1, 1]);
%% Generate parameters
gen_params;

trange = 0:0.1:50;  % Time range

% Values for setting the simulation conditions
conc_ctx = 10;
conc_ctxctrl = conc(8);

conc_gnb5oe = 1;
conc_gnb5kd = 0.1;
conc_gnb5ctrl = conc(9);

KRAS_mt=0.5;

%% (0) Control
y0 = 0.001*ones(6, 1);  % State variables
[t, y_cnt] = ode45(@odemodel, trange, y0, [], conc, param);
y_cnt=repmat(y_cnt(end,:),length(t),1);
y0=y_cnt(end,:);

%% (1) WT + GNB5 o/e
conc(9) = conc_gnb5oe;  % GNB5 over-expression
[t, y_wt_gnb5oe] = ode45(@odemodel, trange, y0, [], conc, param);
fold_wt_gnb5oe = y_wt_gnb5oe./y_cnt;


%% (2) WT + CTX
conc(8) = conc_ctx;  % CTX
conc(9) = conc_gnb5ctrl;
[t, y_wt_ctx] = ode45(@odemodel, trange, y0, [], conc, param);
fold_wt_ctx = y_wt_ctx./y_cnt;


%% (3) WT + CTX + GNB5 o/e
conc(8) = conc_ctx;  % CTX
conc(9) = conc_gnb5oe;  % GNB5 over-expression
[t, y_wt_ctx_gnb5oe] = ode45(@odemodel, trange, y0, [], conc, param);
fold_wt_ctx_gnb5oe = y_wt_ctx_gnb5oe./y_cnt;


%% KRAS mutation
param(8)=KRAS_mt;
conc(9) = conc_gnb5oe;
conc(8) = conc_ctxctrl;

y0 = 0.001*ones(6, 1);  % State variables
[t, y_cnt] = ode45(@odemodel, trange, y0, [], conc, param);
y0=y_cnt(end,:);
y_cnt_norm=repmat(y_cnt(end,:),length(t),1);

%% (4) KRAS-MT + GNB5
conc(8) = conc_ctxctrl;
conc(9) = conc_gnb5kd;  % GNB5 kd
[t, y_mt_gnb5kd] = ode45(@odemodel, trange, y0, [], conc, param);
fold_mt_gnb5kd = y_mt_gnb5kd./y_cnt_norm;

%% (5) KRAS-MT + CTX
conc(8) = conc_ctx;  % CTX
conc(9) = conc_gnb5oe;
% conc(9) = conc_gnb5ctrl;
[t, y_mt_ctx] = ode45(@odemodel, trange, y0, [], conc, param);
fold_mt_ctx = y_mt_ctx./y_cnt_norm;

%% (6) KRAS-MT + CTX + GNB5 k/d
conc(9) = conc_gnb5kd;  % GNB5 knock-down

[t, y_mt_ctx_gnb5kd] = ode45(@odemodel, trange, y0, [], conc, param);
fold_mt_ctx_gnb5kd = y_mt_ctx_gnb5kd./y_cnt_norm;

%% Calculate survival
idx_erk = 4;
idx_akt = 6;

fold_erk = fold_wt_gnb5oe(:, idx_erk);
fold_akt = fold_wt_gnb5oe(:, idx_akt);
fold_surv_wt_gnb5oe = calc_survival(fold_erk, fold_akt, w_erk, w_akt);

fold_erk = fold_wt_ctx(:, idx_erk);
fold_akt = fold_wt_ctx(:, idx_akt);
fold_surv_wt_ctx = calc_survival(fold_erk, fold_akt, w_erk, w_akt);

fold_erk = fold_wt_ctx_gnb5oe(:, idx_erk);
fold_akt = fold_wt_ctx_gnb5oe(:, idx_akt);
fold_surv_wt_ctx_gnb5oe = calc_survival(fold_erk, fold_akt, w_erk, w_akt);

fold_erk = fold_mt_gnb5kd(:, idx_erk);
fold_akt = fold_mt_gnb5kd(:, idx_akt);
fold_surv_mt_gnb5oe = calc_survival(fold_erk, fold_akt, w_erk, w_akt);

fold_erk = fold_mt_ctx(:, idx_erk);
fold_akt = fold_mt_ctx(:, idx_akt);
fold_surv_mt_ctx = calc_survival(fold_erk, fold_akt, w_erk, w_akt);

fold_erk = fold_mt_ctx_gnb5kd(:, idx_erk);
fold_akt = fold_mt_ctx_gnb5kd(:, idx_akt);
fold_surv_mt_ctx_gnb5kd = calc_survival(fold_erk, fold_akt, w_erk, w_akt);
 
%% Plot
plot_result_Fig_7AB;

for i=1:18
   subplot(6,3,i)
   xlabel('')
   ylabel('')
   xlim([0 max(trange)])
   title('')
   set(gca,'TickDir','out')
   set(gca,'TickLength',[0.03 0.1])
   set(gca,'XTick',0:25:50)
end