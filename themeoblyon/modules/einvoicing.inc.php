<?php if (! defined('ISLOADEDBYSTEELSHEET')) die('Must be call by steelsheet'); ?>
/* ================================================================================================
   oblyon/themeoblyon/modules/einvoicing.inc.php
   Role      : CSS du module tiers einvoicing dans le bandeau des fiches ; se garde lui-meme (isModEnabled)
   Inclus par : modules.inc.php | Garde : ISLOADEDBYSTEELSHEET | Variables PHP : portee de style.css.php / theme_vars.inc.php
   Regle     : une regle, un endroit (pas de copie d'un selecteur present dans un autre fichier ; verifier avec dev/csscompare.php)
   ================================================================================================ */

/* <style type="text/css" > */

<?php if (isModEnabled('einvoicing')) { ?>
/* Module einvoicing : le badge "Facture electronique : <etat>" est ajoute en JavaScript sous le statut du bandeau
   (div.einv-banner-badge dans div.statusref). Il etait colle au statut : on l'en detache de 6px. */
.arearef .statusref .einv-banner-badge, .arearefnobottom .statusref .einv-banner-badge {
	margin-top: 6px;
}
/* Module einvoicing (2026-10) : fenetre de pre-import des produits introuvables (dialogue jQuery UI #einvpi-dialog).
   Avec FIX_STICKY_HEADER_CARD, les th de tr.liste_titre sont collants (top 40/54px) et recouvrent les premieres lignes
   du tableau dans le dialogue : on les remet dans le flux. */
.einvpi-dialog tr.liste_titre th, .einvpi-dialog tr.liste_titre td {
	position: static !important;
	top: unset !important;
}
/* Module einvoicing (2026-11) : sections depliables du tableau de bord (einvoicingindex.php, details.einv-acc).
   Leur corps (.einv-body, overflow-x: auto) est un conteneur de defilement : l'en-tete collant s'y decale de 40/54px
   et recouvre la premiere ligne quand rien ne precede le tableau (section Anomalies). On les remet dans le flux. */
.einv-acc tr.liste_titre th {
	position: static !important;
	top: unset !important;
}
<?php } ?>
