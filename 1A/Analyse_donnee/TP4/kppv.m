%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Analyse de donnees
% TP4 - Reconnaissance de chiffres manuscrits par k plus proches voisins
% fonction kppv.m
%
% Données :
% DataA      : les données d'apprentissage (connues)
% LabelA     : les labels des données d'apprentissage
%
% DataT      : les données de test (on veut trouver leur label)
% Nt_test    : nombre de données tests qu'on veut labelliser
%
% K          : le K de l'algorithme des k-plus-proches-voisins
% ListeClass : les classes possibles (== les labels possibles)
%
% Résultat :
% Partition : pour les Nt_test données de test, le label calculé
%
%--------------------------------------------------------------------------
function [Partition] = kppv(DataA, LabelA, DataT, Nt_test, K, ListeClass)

[Na,~] = size(DataA);

% Initialisation du vecteur d'étiquetage des images tests
Partition = zeros(Nt_test,1);

disp(['Classification des images test dans ' num2str(length(ListeClass)) ' classes'])
disp(['par la methode des ' num2str(K) ' plus proches voisins:'])

% Boucle sur les vecteurs test de l'ensemble de l'évaluation
for i = 1:Nt_test
    
    disp(['image test n°' num2str(i)])

    % Calcul des distances entre le vecteur de test 
    % et les vecteurs d'apprentissage (voisins)
    Distances = sqrt(sum(DataA - DataT(i,:), 2).^2);
    
    % On ne garde que les indices des K + proches voisins
    [~, ind_ppv] = sort(Distances);
    ind_ppv = ind_ppv(1:K);
    
    % Comptage du nombre de voisins appartenant à chaque classe
    listeClassppv = LabelA(ind_ppv);
    Nombre = zeros(size(ListeClass));
    for j = 1 : length(ListeClass)
        Nombre(j) = sum(listeClassppv(:) == ListeClass(j));
    end
    
    % Recherche des classes contenant le maximum de voisins
    ind_max = find(Nombre == max(Nombre));
    
    % Si l'image test a le plus grand nombre de voisins dans plusieurs  
    % classes différentes, alors on lui assigne celle du voisin le + proche,
    % sinon on lui assigne l'unique classe contenant le plus de voisins 
    if sum(Nombre == max(Nombre)) == 1
        classe = ListeClass(ind_max(1));
    else
        classe = ListClass(ind_ppv(1));
    end
    
    % Assignation de l'étiquette correspondant à la classe trouvée au point 
    % correspondant à la i-ème image test dans le vecteur "Partition" 
    % À COMPLÉTER
    Partition(i) = classe;
    
end

