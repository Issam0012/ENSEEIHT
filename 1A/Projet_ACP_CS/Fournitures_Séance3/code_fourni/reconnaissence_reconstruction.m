clear;
close all;

load eigenfaces_part3;

% Tirage aléatoire d'une image de test :
personne = randi(nb_personnes)
posture = randi(nb_postures)
% si on veut tester/mettre au point, on fixe l'individu
%personne = 10;
%posture = 3;

% dans un second temps, q peut être calculé afin d'atteindre le pourcentage
% d'information avec q valeurs propres (contraste)
% Pourcentage d'information 
per = 0.75;

% Nombre q de composantes principales à prendre en compte 
q = round(15 * per);

%% La base de donnees
DataA =  X_masque*W(:,1:q); % on fait la projection sur les q premieres vecteurs propres
LabelA = liste_base;

% L'image test
ficF = strcat('./Data/', liste_personnes{personne}, liste_postures{posture}, '-300x400.gif');
img = imread(ficF);
img(ligne_min : ligne_max, colonne_min : colonne_max) = 0;
image_test = double(transpose(img(:)));
DataT =  image_test*W(:,1:q);

%% La méthode des KPPV et bayésien
Nt_test = 1;
k = 1;
[rep_compactes, label_individus] = kppv(DataA, LabelA, DataT, Nt_test,k);
%[label_individus] = bayesien(DataA, DataT, LabelA);

% individu pseudo-résultat pour l'affichage (A CHANGER)
personne_proche = 1;
posture_proche = 1;
ficF_res = label_individus(1,:);
img_res = imread(ficF_res);

% Matrice de confusion
C_kppv = confusionmat(image_test, double(transpose(img_res(:))));

figure('Name','Image tiree aleatoirement','Position',[0.2*L,0.2*H,0.8*L,0.5*H]);

subplot(1, 2, 1);
% Affichage de l'image de test :
colormap gray;
imagesc(img);
title({['Image degradee']}, 'FontSize', 20);
axis image;

%ficF = strcat('./Data/', liste_personnes_base{personne_proche}, liste_postures{posture_proche}, '-300x400.gif')

% Reconstruction de l'image
img(ligne_min : ligne_max, colonne_min : colonne_max) = img_res(ligne_min : ligne_max, colonne_min : colonne_max);
subplot(1, 2, 2);
imagesc(img);
title('Image reconstruite', 'FontSize', 20);
axis image;
