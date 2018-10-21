select * from clients;
-- table REGULAREXPRES colonne regularexpr

select * from REGULAREXPRES;
select * from TABCLIDS;

/*
    Gestion des doublons et des similaires
    1) Correction intra colonne
    2) Comparaison avec les autres tuples
*/

CREATE OR REPLACE PROCEDURE correctionIntra(maColonne IN VARCHAR, maTable IN VARCHAR, maCondition IN VARCHAR, wordRegex IN VARCHAR)
is
BEGIN
    
END;
/


create table correctionRegularExpres( categorie VARCHAR(), correction VARCHAR())
INSERT INTO correctionRegularExpres VALUES
('', '');