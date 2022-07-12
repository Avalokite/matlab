pAyBy = repmat([1 1 0],49,1);
pAyBn = repmat([1 0 0],4,1);
pAnBy = repmat([0 1 0],19,1);
pAnBn = repmat([0 0 0],29,1);
pByAy = repmat([1 1 1],56,1);
pByAn = repmat([1 0 1],20,1);
pBnAy = repmat([0 1 1],3,1);
pBnAn = repmat([0 0 1],21,1);

dt = [pAyBy;pAyBn;pAnBy;pAnBn;pByAy;pByAn;pBnAy;pBnAn];
dtz = zscore(dt);
[COEFF_mat1,SCORE_mat,latent_vect] = pca(dtz); COEFF_mat1 %display PCs
dt_nw =  SCORE_mat * COEFF_mat1'; PVE = latent_vect./sum(latent_vect);
cumPVE = cumsum(latent_vect)./sum(latent_vect);
figure; pareto(PVE); title('Order included');
xlabel('Principal Component');ylabel('Percent Variance Explained (%)')

dt2 = dt(:,1:2);
dtz = zscore(dt2);
[COEFF_mat2,SCORE_mat,latent_vect] = pca(dtz); COEFF_mat2 %display PCs
dt_nw =  SCORE_mat * COEFF_mat2'; PVE = latent_vect./sum(latent_vect);
cumPVE = cumsum(latent_vect)./sum(latent_vect);
figure; pareto(PVE); title('Order excluded');
xlabel('Principal Component');ylabel('Percent Variance Explained (%)')

% COEFF_mat1 =
% 
%     0.7240    0.0974    0.6829
%     0.6510   -0.4241   -0.6296
%     0.2283    0.9004   -0.3704
% 
% 
% COEFF_mat2 =
% 
%     0.7071   -0.7071
%     0.7071    0.7071
