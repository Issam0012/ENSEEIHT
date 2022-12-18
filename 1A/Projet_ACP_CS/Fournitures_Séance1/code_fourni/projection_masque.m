clear
clc
close all

load eigenfaces_masque;

h = figure('Position',[0,0,0.67*L,0.67*H]);
figure('Name','RMSE en fonction du nombre de composantes principales','Position',[0.67*L,0,0.33*L,0.3*L]);

% Calcul de la RMSE entre images originales et images reconstruites :
RMSE_max = 0;

% Composantes principales des données d'apprentissage
C = X_centreM*VectM;

for q = 0:n-1
    CP = C(:, 1:q);		% q premières composantes principales
    EIGQ = VectM(:, 1:q);		% q premières eigenfaces
    X_reconstruit = CP*EIGQ' + individu_moyenM;
    figure(1);
    set(h,'Name',['Utilisation des ' num2str(q) ' premieres composantes principales']);
    colormap gray;
    hold off;
    for k = 1:n
        subplot(nb_personnes_base, nb_postures_base,k);
        img = reshape(X_reconstruit(k,:), nb_lignes,nb_colonnes);
        imagesc(img);
        hold on;
        axis image;
        axis off;
    end
    
    figure(2);
    hold on;

    RMSE = sqrt(mse(X_masque,X_reconstruit));
    RMSE_max = max(RMSE,RMSE_max);

    plot(q,RMSE,'r+','MarkerSize',8,'LineWidth',2);
    axis([0 n-1 0 1.1*RMSE_max]);
    set(gca,'FontSize',20);
    hx = xlabel('$q$','FontSize',30);
    set(hx,'Interpreter','Latex');
    ylabel('RMSE','FontSize',30);
    
    pause(0.01);
end

save projection_masque;
