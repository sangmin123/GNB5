
% figure(6)
% figure('color', [1, 1, 1]);

% figure('name', 'asdf');
% set(gca,'color', [1, 1, 1]);

line_width = 1.5;
title_enabled = 1;

%% ERK
idx_erk = 4;

subplot(6, 3, 2);
plot(t, fold_wt_gnb5oe(:, idx_erk), 'b', 'Linewidth', line_width); hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Fold change');
xlabel('Time (sec.)');
if title_enabled
    title('WT: ERK (GNB5 o/e)');
end
ylim([0 2])
set_ymax(1.1);

subplot(6, 3, 1);
plot(t, fold_wt_ctx(:, idx_erk), 'b', 'Linewidth', line_width);hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Fold change');
xlabel('Time (sec.)');
if title_enabled
    title('WT: ERK (CTX)');
end
set_ymax(1.1);

subplot(6, 3, 3);
plot(t, fold_wt_ctx_gnb5oe(:, idx_erk), 'b', 'Linewidth', line_width);hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Fold change');
xlabel('Time (sec.)');
if title_enabled
    title('WT: ERK (CTX + GNB5 o/e)');
end
ylim([0 1])
set_ymax(1.1);

subplot(6, 3, 4+6+1);
plot(t, fold_mt_gnb5kd(:, idx_erk), 'b', 'Linewidth', line_width);hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Fold change');
xlabel('Time (sec.)');
if title_enabled
    title('MT: ERK (GNB5 kd)');
end
set_ymax(1.1);

subplot(6, 3, 5+6-1);
plot(t, fold_mt_ctx(:, idx_erk), 'b', 'Linewidth', line_width);hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Fold change');
xlabel('Time (sec.)');
if title_enabled
    title('MT: ERK (CTX)');
end
set_ymax(1.1);

subplot(6, 3, 6+6);
plot(t, fold_mt_ctx_gnb5kd(:, idx_erk), 'b', 'Linewidth', line_width);hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Fold change');
xlabel('Time (sec.)');
if title_enabled
    title('MT: ERK (CTX + GNB5 k/d)');
end
set_ymax(1.1);



%% AKT
idx_akt = 6;

subplot(6, 3, 7-3+1);
plot(t, fold_wt_gnb5oe(:, idx_akt), 'b', 'Linewidth', line_width); hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Fold change');
xlabel('Time (sec.)');
if title_enabled
    title('WT: AKT (GNB5 o/e)');
end
ylim([0 6])
set(gca,'YTick',0:3:6)
set_ymax(1.1);


subplot(6, 3, 8-3-1);
plot(t, fold_wt_ctx(:, idx_akt), 'b', 'Linewidth', line_width); hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Fold change');
xlabel('Time (sec.)');
if title_enabled
    title('WT: AKT (CTX)');
end
set_ymax(1.1);

subplot(6, 3, 9-3);
plot(t, fold_wt_ctx_gnb5oe(:, idx_akt), 'b', 'Linewidth', line_width); hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Fold change');
xlabel('Time (sec.)');
if title_enabled
    title('WT: AKT (CTX + GNB5 o/e)');
end
ylim([0 6])
set(gca,'YTick',0:3:6)
set_ymax(1.1);

subplot(6, 3, 10+3+1);
plot(t, fold_mt_gnb5kd(:, idx_akt), 'b', 'Linewidth', line_width); hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Fold change');
xlabel('Time (sec.)');
if title_enabled
    title('MT: AKT (GNB5 kd)');
end
set_ymax(1.1);

subplot(6, 3, 11+3-1);
plot(t, fold_mt_ctx(:, idx_akt), 'b', 'Linewidth', line_width); hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Fold change');
xlabel('Time (sec.)');
if title_enabled
    title('MT: AKT (CTX)');
end
set_ymax(1.1);

subplot(6, 3, 12+3);
plot(t, fold_mt_ctx_gnb5kd(:, idx_akt), 'b', 'Linewidth', line_width); hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Fold change');
xlabel('Time (sec.)');
if title_enabled
    title('MT: AKT (CTX + GNB5 k/d)');
end
set_ymax(1.1);


%% Survival
subplot(6, 3, 13-6+1);
plot(t, fold_surv_wt_gnb5oe, 'b', 'Linewidth', line_width); hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Survival (A.U.)');
xlabel('Time (sec.)');
if title_enabled
    title('WT: Surv. (GNB5 o/e)');
end
ylim([0 4])
set_ymax(1.1);

subplot(6, 3, 14-6-1);
plot(t, fold_surv_wt_ctx, 'b', 'Linewidth', line_width); hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Survival (A.U.)');
xlabel('Time (sec.)');
if title_enabled
    title('WT: Surv. (CTX)');
end
set_ymax(1.1);

subplot(6, 3, 15-6);
plot(t, fold_surv_wt_ctx_gnb5oe, 'b', 'Linewidth', line_width); hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Survival (A.U.)');
xlabel('Time (sec.)');
if title_enabled
    title('WT: Surv. (CTX + GNB5 o/e)');
end
ylim([0 4])
set_ymax(1.1);

subplot(6, 3, 16+1);
plot(t, fold_surv_mt_gnb5oe, 'b', 'Linewidth', line_width); hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Survival (A.U.)');
xlabel('Time (a.u.)');
if title_enabled
    title('MT: Surv. (GNB5 kd)');
end
set_ymax(1.1);

subplot(6, 3, 17-1);
plot(t, fold_surv_mt_ctx, 'b', 'Linewidth', line_width); hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Survival (A.U.)');
xlabel('Time (a.u.)');
if title_enabled
    title('MT: Surv. (CTX)');
end
set_ymax(1.1);

subplot(6, 3, 18);
plot(t, fold_surv_mt_ctx_gnb5kd, 'b', 'Linewidth', line_width); hold on;
plot([0, max(t)], [1, 1], 'r');
hold off;
ylabel('Survival (A.U.)');
xlabel('Time (a.u.)');
if title_enabled
    title('MT: Surv. (CTX + GNB5 k/d)');
end
set_ymax(1.1);