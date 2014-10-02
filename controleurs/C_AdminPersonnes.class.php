<?php
/**
 * Description of C_AdminPersonnes
 * CRUD Personnes
 * @author btssio
 */
class C_AdminPersonnes extends C_ControleurGenerique {
    // Fonction d'affichage du formulaire de création d'une personne
    function creerPersonne(){
        $this->vue = new V_Vue("../vues/templates/template.inc.php");
        $this->vue->ecrireDonnee('titreVue', 'Cr&eacute;ation d\'une personne');
        // ... depuis la BDD       
        $daoPers = new M_DaoPersonne();
        $daoPers->connecter();
        $pdo = $daoPers->getPdo();
       
        // Mémoriser la liste des spécialités disponibles
        $daoSpecialite = new M_DaoSpecialite();
        $daoSpecialite->setPdo($pdo);
        $this->vue->ecrireDonnee('lesSpecialites', $daoSpecialite->getAll());
               
        // Mémoriser la liste des rôles disponibles
        $daoRole = new M_DaoRole();
        $daoRole->setPdo($pdo);
        $this->vue->ecrireDonnee('lesRoles', $daoRole->getAll());
        
        $this->vue->ecrireDonnee('loginAuthentification',MaSession::get('login'));       
        $this->vue->ecrireDonnee('centre', "../vues/includes/adminPersonnes/centreCreerPersonne.inc.php");
               
        $this->vue->afficher();
    }
    
    //validation de création d'utilisateur 
    function validationCreerPersonne(){  
        
        //$this->vue->titreVue = "Validation cr&eacute;ation de l'utilisateur";     
        //$utilisateur->setId($id) = $utilisateur->getId('IDSPECIALITE', 'SPECIALITE', 'IDSPECIALITE', $_POST["option"]);
        

       
        // Mémoriser la liste des spécialités disponibles
        $daoRole = new M_DaoRole();
        $daoRole->connecter();
        
        $role = $daoRole->getOneById($_POST['role']);
        $specialite = $_POST["option"];
        $civilite = $_POST["civilite"];  
        $nom = $_POST["nom"];
        $prenom = $_POST["prenom"];
        $numTel = $_POST["tel"];
        $mail = $_POST["mail"];
        $mobile = $_POST["telP"];       
        $etudes = $_POST["etudes"];
        $formation = $_POST["formation"];
        //$utilisateur->set = $_POST["entreprise1"];
        
        $login = $_POST["login"];
        $mdp = sha1($_POST["mdp"]);
          
        $utilisateur = new M_Personne(999, $specialite, $role, $civilite, $nom, $prenom, $numTel, $mail, $mobile, $etudes, $formation, $login, $mdp );
        
        $daoPersonne = new M_DaoPersonne();
        $daoPersonne->setPdo($daoRole->getPdo());
        $ok = $daoPersonne->insert($utilisateur);
    
      
        if ($ok) {
            //$this->vue->message = "Utilisateur cr&eacute;&eacute;";
            echo 'ca marche';
        } else {
            echo ' ça marche pas';
            //$this->vue->message = "Echec de l ajout de l utilisateur".$msg;
        }
        //$this->vue->afficher();
     
    }
    
}
