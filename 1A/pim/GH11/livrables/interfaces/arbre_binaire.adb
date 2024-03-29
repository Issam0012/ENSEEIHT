with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

package body arbre_binaire is

    procedure Free is
            new Ada.Unchecked_Deallocation (Object => T_noeud, Name => T_AB);

    procedure Initialiser(Arbre: out T_AB) is
    begin
        Arbre := null;
    end Initialiser;


    function Est_Vide (Arbre : T_AB) return Boolean is
    begin
        return Arbre = null;
    end Est_Vide;


    function Indice (Arbre : T_AB) return Integer is
    begin
        return Arbre.all.Indice;
    end Indice;


    function Valeur (Arbre : in T_AB) return Unbounded_String is
    begin
        return Arbre.all.Valeur;
    end Valeur;


    function Taille (Arbre : in T_AB) return Integer is
    begin
        if Est_Vide(Arbre) then
            return 0;
        else
            return 1+Taille(Arbre.all.Fils_G)+ Taille(Arbre.all.Fils_D);
        end if;
    end Taille;


    procedure Enregistrer (Arbre : in out T_AB ; Indice : in Integer ; Valeur : in Unbounded_string) is
    begin
        if Est_Vide(Arbre) then
            Arbre := new T_noeud'(Indice, Valeur, null, null);
        else
            Arbre.all.Valeur := Valeur;
        end if;
    end Enregistrer;


    procedure Associer (Arbre_1 : in out T_AB ; Arbre_2: in T_AB) is
        Arbre_tmp : T_AB;
    begin
        Arbre_tmp := Arbre_2;
        Arbre_1 := new T_noeud'(Indice(Arbre_1)+Indice(Arbre_2), To_Unbounded_String("0"), Arbre_tmp, Arbre_1);
    end Associer;


    procedure Permutation (Arbre_1 : in out T_AB ; Arbre_2: in out T_AB) is
        Arbre_temp: T_AB;
    begin
        Arbre_temp := Arbre_1;
        Arbre_1:=Arbre_2;
        Arbre_2:=Arbre_temp;
    end Permutation;


    procedure Supprimer (Arbre : in out T_AB ; Indice : in Integer) is
        A_Detruire : T_AB;
    begin
        if Taille(Arbre) = 0 then
            null;
        elsif Arbre.all.Indice = Indice then
            A_Detruire := Arbre;
            if Arbre.all.Fils_G = null then
                Arbre := Arbre.all.Fils_D;
                free(A_Detruire);
            elsif Arbre.all.Fils_D = null then
                Arbre := Arbre.all.Fils_G;
                free(A_Detruire);
            else
                null;
            end if;
        else
            Supprimer(Arbre.all.Fils_D, Indice);
            Supprimer(Arbre.all.Fils_G, Indice);
        end if;
    end Supprimer;


    procedure Vider (Arbre : in out T_AB) is
    begin
        if Taille(Arbre) = 0 then
            Null;
        else
            Vider(Arbre.all.Fils_D);
            Vider(Arbre.all.Fils_G);
            Supprimer(Arbre, Arbre.all.Indice);
        end if;
    end Vider;


    Procedure affichage_arbre(arbre : in T_AB; indice_droit: in integer; indice_gauche: in integer) is --les deux indices seront toujours remis à 0
    begin
        If Est_Vide(Arbre.all.Fils_D) and Est_Vide(Arbre.all.Fils_G) then
            Put("(");
            Put(Indice(arbre), 0);
            Put(")");
            Put(" ");
            Put('"' & To_String(Valeur(arbre)) & '"');
            New_Line;
        Else
            Put ("(");
            Put(Indice(arbre), 0);
            Put(")");
            New_Line;
            for i in 1..indice_gauche loop
                Put("  |       ");
            end loop;
            Put("  \--0--");
            affichage_arbre(Arbre.all.Fils_G, indice_droit+1, indice_gauche+1);
            for i in 1..indice_droit loop
                Put("  |       ");
            end loop;

            Put("  \--1--" );
            affichage_arbre(Arbre.all.Fils_D, indice_droit+1, indice_gauche+1);
        end if;
    end affichage_arbre;


end arbre_binaire;
