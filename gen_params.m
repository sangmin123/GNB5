conc = zeros(8, 1);

conc(1) = 1; % EGFRtot
conc(2) = 1; % KRAStot
conc(3) = 1; % MEKtot
conc(4) = 1; % ERKtot
conc(5) = 1; % PI3Ktot
conc(6) = 1; % AKTtot

conc(7) = 1; % EGF
conc(8) = 0; % CTX
conc(9) = .1; % GNB5

param = zeros(23, 1);
param(1) = 1; % k1: EGF -> EGFRa
param(2) = 0.5; % Km1
param(3) = 0.1; % Ki1
param(4) = 0.5; % kd1

param(5) = 5; % k2a: EGFRa -> KRASa
param(6) = 2; % k2b: GNB5a -> KRASa
param(7) = 10; % Km2
param(8) = 5; % kd2

param(9) = 0; % k3a: EGFRa -> MEKa
param(10) = 2; % k3b: KRAS -> MEKa
param(11) = 1; % Km3
param(12) = 0.5; % kd3

param(13) = 1; % k4: MEKa -> ERKa
param(14) = 1; % Km4
param(15) = 0.5; % kd4

param(16) = 5; % k5a: KRASa -> PI3Ka
param(17) = 2; % k5b: GNB5a -> PI3Ka
param(18) = 10; % k5c: ERKa --| PI3Ka
param(19) = 10; % Km5
param(20) = 10; % Ki5
param(21) = 0.5; % kd5

param(22) = 1; % k6: PI3Ka -> AKTa
param(23) = 5; % Km6
param(24) = 0.5; % kd6

% Weights of linear combination for calculating survival
w_erk = 0.5;  % params(25)
w_akt = 0.5;  % params(26)
