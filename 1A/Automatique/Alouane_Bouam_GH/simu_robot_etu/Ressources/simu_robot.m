% ~gergaud/ENS/Automatique/TP19-20/TP_Etudiants/simu_robot/Ressources/simu_robot.m
%
%
% Auteur : Gergaud Joseph
% Date : october 2019
% Institution : Université de Toulouse, INP-ENSEEIHT
%               Département Sciences du Numérique
%               Informatique, Mathématiques appliquées, Réseaux et Télécommunications
%               Computer Science department
%
%-----------------------------------------------------------------------------------------
%
% Code Matlab de test pour la simulation du pendule inversé contrôlé. 
%
%-----------------------------------------------------------------------------------------


% Remarque : On ne fait pas de sous programme car Simulink utilise
% l'environnement Matlab
%
if strcmp(algorithme,'ode45'),
    options_sim = simset('Solver',algorithme,'RelTol',RelTol);
elseif strcmp(algorithme,'ode1'),
    options_sim = simset('Solver',algorithme,'FixedStep',pas);
else
    options_sim = simset();
end;



affichage(fich, t0, xe, ue, x0, tf, K, options_sim);

simOut = sim(fich_simulink_etu,[t0 tf],options_sim);


% fich_mat = ['TP2_Etudiants/Resultats/' fich '.mat'];
fich_mat = ['Ressources/' fich '.mat'];      
load(fich_mat, 'X_sol', 'U_sol');
comparaison(fich, simOut.X, X_sol, simOut.U, U_sol);

if fich == 'cas1_2',
    % fich_mat = ['TP2_Etudiants/Resultats/' fich '.mat'];
    fich_mat = ['Ressources/' fich '_short.mat'];
    disp('K format short')
    load(fich_mat, 'X_sol', 'U_sol');
    comparaison(fich, simOut.X, X_sol, simOut.U, U_sol);
end;
%
% Fonctions
function affichage(fich, t0, xe, ue, x0, tf, K, options_sim);
% 
% Attichage des données
    disp(fich)
    disp('[t0 xe ue]')
    disp([t0 xe(:)' ue(:)'])
    disp('[x0 tf K]=')
    disp([x0(:)' tf K])
    disp(['algorithme = ' options_sim.Solver]);
    disp(['RelTol = ' options_sim.RelTol]);
    disp(['pas = ' num2str(options_sim.FixedStep)]);
end

function comparaison(fich, X, X_sol, U, U_sol)

eps0 = 1e-13;
if size(X.Data) == size(X_sol.Data) & size(U.Data) == size(U_sol.Data),
    disp('dimension ok')
    X_erreur = max(max(abs(X.Data-X_sol.Data)));
    U_erreur = max(max(abs(U.Data-U_sol.Data)));
    disp(['||X.Data-X_sol.Data||_inf = ' num2str(X_erreur)])
    disp(['||U.Data-U_sol.Data||_inf = ' num2str(U_erreur)])  
    if (X_erreur < eps0) & (U_erreur < eps0),
        disp('Résultats ok')
    else
        disp('Résultats faux');
    end    
else 
    disp('erreur dimensions')
end


figure;
graphiques(X,U)
figure('Name',[fich ' Sol'])
graphiques(X_sol,U_sol)

function graphiques(x,u)
% Réalise les graphiques des simulations issues de simulink
%
% parametres en entrée
% --------------------
% t : temps
%     real (N,1)
% x : état
%     real (N,n)
% u : contrôle
%     real (N,m)

subplot(2,1,1)
plot(x.Time,x.Data)
xlabel('t')
ylabel('états');
subplot(2,1,2)
plot(u.Time,u.Data)
xlabel('t')
ylabel('contrôle')

end
end
