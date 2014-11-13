<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of M_DaoListeStage
 *
 * @author btssio
 */
class M_DaoListeStage extends M_DaoGenerique  {
    //put your code here
    
    
    /**
     * Lire tous les enregistrements d'une table
     * @return tableau-associatif d'objets : un tableau d'instances de la classe métier
     */
    function getAll() {
        
        //echo "--- getAll redéfini ---<br/>";
        $retour = null;
        // Requête textuelle
        $sql = "SELECT etu.NOM AS NomEtu, ";
        $sql .="etu.PRENOM AS PrenomEtu, ";
        $sql .= "pr.NUMCLASSE AS Classe, ";
        $sql .= "o.NOM_ORGANISATION AS Orga, " ;
        $sql .= "o.VILLE_ORGANISATION AS Ville, ";
        $sql .= "ms.NOM AS NomMS, ";
        $sql .= "ms.PRENOM AS PrenomMS, ";
        $sql .= "ms.NUM_TEL AS TelMS, "  ;
        $sql .= "ms.ADRESSE_MAIL AS mailMS, ";
        $sql .= "s.DATEDEBUT AS DateDebut, ";
        $sql .= "s.DATEFIN AS DateFin ";
        $sql .= "FROM STAGE s ";
        $sql .= "INNER JOIN PERSONNE etu ON s.idetudiant = etu.idpersonne ";
        $sql .= "INNER JOIN PROMOTION pr ON etu.idpersonne = pr.idpersonne ";
        $sql .= "INNER JOIN ORGANISATION o ON s.idorganisation = o.idorganisation ";
        $sql .= "INNER JOIN PERSONNE ms ON s.idmaitrestage=ms.idpersonne ";
        $sql .= "GROUP BY s.num_stage ;";
        
        try {
            // préparer la requête PDO
            $queryPrepare = $this->pdo->prepare($sql);

            // exécuter la requête PDO
            if ($queryPrepare->execute()) {
                // si la requête réussit :
                // initialiser le tableau d'objets à retourner
                $retour = array();
                // pour chaque enregistrement retourné par la requête
                while ($enregistrement = $queryPrepare->fetch(PDO::FETCH_ASSOC)) {
                    // construir un objet métier correspondant
                    $unObjetMetier = $this->enregistrementVersObjet($enregistrement);
                    // ajouter l'objet au tableau
                    $retour[] = $unObjetMetier;
                }
            }
        } catch (PDOException $e) {
            echo get_class($this) . ' - ' . __METHOD__ . ' : ' . $e->getMessage();
        }/*
        foreach( $retour['NomEtu'] as $result){
            echo $result;
        }*/
        return $retour;
    }
    
    /**
     * Prépare une liste de paramètres pour une requête SQL UPDATE ou INSERT
     * @param Object $objetStage
     * @return array : tableau ordonné de valeurs
     */
    public function enregistrementVersObjet($enreg) {
        // on construit l'objet Stage
        $retour = new M_Stage(
                $enreg['NomEtu'], $enreg['PrenomEtu'], $enreg['Classe'], $enreg['Orga'], $enreg['Ville'], $enreg['NomMS'], $enreg['PrenomMS'], $enreg['TelMS'], $enreg['mailMS'], $enreg['DateDebut'], $enreg['DateFin']
        );
        return $retour;
    }

    public function insert($objetMetier) {
        
    }

    public function objetVersEnregistrement($objetMetier) {
        
    }

    public function update($idMetier, $objetMetier) {
        
    }

}
