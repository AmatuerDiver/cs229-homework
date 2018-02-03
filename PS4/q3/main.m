[X_ica, X_pca] = load_images;

U = pca(X_pca);

W = ica(X_ica);

figure(1);
plot_pca_filters(U);
figure(2);
plot_ica_filters(W);

