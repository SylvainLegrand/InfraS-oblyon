-- InfraS add : fichier ajoute par InfraS (2026-11), reprise de update_3.2.0_oblyon_to_eldy.sql
-- ============================================================================
-- Migration Oblyon 3.2 : bascule des constantes propres au theme (OBLYON_*)
-- vers les constantes standard Dolibarr / Eldy (THEME_*), suite au « groupe A ».
--
-- Le code du theme lit desormais les constantes de droite. Ce script recopie la
-- valeur configuree dans l'ancienne constante vers la nouvelle, afin de ne pas
-- perdre les personnalisations existantes lors de la mise a jour du module.
--
-- IMPORTANT
--   * Migration MANUELLE, a lancer UNE SEULE FOIS, apres la mise a jour d'une
--     instance depuis une version < 3.2.0 et apres la reactivation du module
--     (data.sql vient alors de creer les THEME_* avec leur valeur par defaut,
--     que cette migration remplace par l'ancienne valeur) :
--       mariadb --defaults-extra-file=<fichier d'identifiants> <base> < migration_3.2.0_oblyon_to_eldy.sql
--     Prefixe de tables llx_ : l'adapter si l'instance en utilise un autre.
--   * Le nom ne commence pas par « update » : _load_tables ne le rejoue pas a
--     chaque activation (l'ancien update_3.2.0_oblyon_to_eldy.sql l'etait, et
--     ecrasait les reglages faits depuis ; il est neutralise).
--   * Ne pas le relancer ensuite : il remettrait les valeurs des anciennes
--     constantes OBLYON_*.
--   * Multi-entite : la valeur est recopiee entite par entite.
--   * ON DUPLICATE KEY UPDATE : n'ecrit QUE la colonne value (type/visible/note
--     d'une eventuelle ligne existante ne sont pas modifies).
--
-- Mapping (ancienne -> nouvelle) :
--   A1  OBLYON_FONT_FAMILY          -> THEME_FONT_FAMILY
--   A2  OBLYON_FONT_SIZE            -> THEME_ELDY_FONT_SIZE1
--   A3  OBLYON_STICKY_TOPBAR        -> THEME_STICKY_TOPMENU
--   A4  OBLYON_COLOR_BUTTON_ACTION1 -> THEME_ELDY_BTNACTION
--   A9  OBLYON_COLOR_BLINE_HOVER    -> THEME_ELDY_USE_HOVER
--   --  OBLYON_COLOR_FTITLE         -> THEME_ELDY_TEXTTITLE
--
-- Non concernees : A5 (OBLYON_COLOR_BUTTON_ACTION2, conservee), A6/A9b
-- (THEME_ELDY_TEXTBTNACTION / THEME_ELDY_USE_CHECKED : nouvelles, sans ancienne),
-- A7 (OBLYON_COLOR_INPUT_BCKGRD, conservee), A8 (THEME_INVERT_RATIO_FILTER,
-- conservee).
-- ============================================================================

-- A1 : famille de police
INSERT INTO llx_const (name, entity, value, type, visible, note)
SELECT 'THEME_FONT_FAMILY', o.entity, o.value, 'chaine', 0, 'Migration Oblyon (ex OBLYON_FONT_FAMILY)'
FROM llx_const o WHERE o.name = 'OBLYON_FONT_FAMILY'
ON DUPLICATE KEY UPDATE value = VALUES(value);

-- A2 : taille de police
INSERT INTO llx_const (name, entity, value, type, visible, note)
SELECT 'THEME_ELDY_FONT_SIZE1', o.entity, o.value, 'chaine', 0, 'Migration Oblyon (ex OBLYON_FONT_SIZE)'
FROM llx_const o WHERE o.name = 'OBLYON_FONT_SIZE'
ON DUPLICATE KEY UPDATE value = VALUES(value);

-- A3 : barre superieure collante
INSERT INTO llx_const (name, entity, value, type, visible, note)
SELECT 'THEME_STICKY_TOPMENU', o.entity, o.value, 'chaine', 0, 'Migration Oblyon (ex OBLYON_STICKY_TOPBAR)'
FROM llx_const o WHERE o.name = 'OBLYON_STICKY_TOPBAR'
ON DUPLICATE KEY UPDATE value = VALUES(value);

-- A4 : fond du bouton d'action
INSERT INTO llx_const (name, entity, value, type, visible, note)
SELECT 'THEME_ELDY_BTNACTION', o.entity, o.value, 'chaine', 0, 'Migration Oblyon (ex OBLYON_COLOR_BUTTON_ACTION1)'
FROM llx_const o WHERE o.name = 'OBLYON_COLOR_BUTTON_ACTION1'
ON DUPLICATE KEY UPDATE value = VALUES(value);

-- A9 : couleur de survol des lignes
INSERT INTO llx_const (name, entity, value, type, visible, note)
SELECT 'THEME_ELDY_USE_HOVER', o.entity, o.value, 'chaine', 0, 'Migration Oblyon (ex OBLYON_COLOR_BLINE_HOVER)'
FROM llx_const o WHERE o.name = 'OBLYON_COLOR_BLINE_HOVER'
ON DUPLICATE KEY UPDATE value = VALUES(value);

-- Pre-A : couleur du texte des titres principaux
INSERT INTO llx_const (name, entity, value, type, visible, note)
SELECT 'THEME_ELDY_TEXTTITLE', o.entity, o.value, 'chaine', 0, 'Migration Oblyon (ex OBLYON_COLOR_FTITLE)'
FROM llx_const o WHERE o.name = 'OBLYON_COLOR_FTITLE'
ON DUPLICATE KEY UPDATE value = VALUES(value);
