% Chisquare data of survey, split by question order
% Trustworthiness of Clinton then Gore: A then B
pAyBy = 0.4899; %Asking about Clinton first...
pAyBn = 0.0447;
pAnBy = 0.1767;
pAnBn = 0.2887;
pByAy = 0.5625; %... makes both seem less trustworthy
pByAn = 0.1991;
pBnAy = 0.0255;
pBnAn = 0.2129;

pAy = (pAyBy + pAyBn + pByAy + pBnAy) / 2;
pBy = (pAyBy + pAnBy + pByAy + pByAn) / 2;

%the quantum question equality (QQE) should be approximately 0.
QQE = (pByAy + pBnAn - pAyBy - pAnBn) - (pAyBn + pAnBy - pByAn - pBnAy);

%normalisation values for the two new personality types
S1 = (pAyBy + pAnBn + pByAy + pBnAn)/2; %inertia
S2 = (pAyBn + pAnBy + pByAn + pBnAy)/2; %momentum

%renormalisation. Article uses p-bar; q=p-bar
qAyBy = S1 * pAyBy/(pAyBy+pAnBn);
qAnBn = S1 * pAnBn/(pAyBy+pAnBn);
qByAy = S1 * pByAy/(pByAy+pBnAn);
qBnAn = S1 * pBnAn/(pByAy+pBnAn);
qAyBn = S2 * pAnBy/(pAyBn+pAnBy);
qAnBy = S2 * pAnBy/(pAyBn+pAnBy);
qByAn = S2 * pByAn/(pByAn+pBnAy);
qBnAy = S2 * pBnAy/(pByAn+pBnAy);

qAy = (qAyBy + qAyBn + qByAy + qBnAy) / 2;
qBy = (qAyBy + qAnBy + qByAy + qByAn) / 2;
qAn = (qAnBy + qAnBn + qByAn + qBnAn) / 2;
qBn = (qAyBn + qAnBn + qBnAy + qBnAn) / 2;

% q values incorrect (?). Transcribed article values below
% q2 = (qAyBy-qByAy)/(qAy-qBy)
% q1 = (qAnBy-qByAn)/(qAn-qBy)
% q0 = 1 - q2 - q1

%ratio of personality types
q0 = .6045; % unaffected by order effects
q1 = .0668; % affected: likes to swap answers
q2 = .3288; % affected: likes to repeat answers

% pXX values slightly off, likely due to rounding or needing to average
% p11 = (qAyBy-qAy*q2)/q0
% p10 = (qAyBn-qAy*q1)/q0
% p01 = (qAnBy-qAn*q1)/q0
% p00 = (qAnBn-qAn*q2)/q0

% corrected chisquare outcomes. p11 = AyBy in both orders, etc.
p11 = .5184;
p10 = .0155;
p01 = .2429;
p00 = .2231;

realAy = (p11+p10) %.5339 vs By=.5613
realBy = (p11+p01) %.7613 vs Ay=.7141

