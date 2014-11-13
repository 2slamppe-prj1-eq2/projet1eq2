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
        $daoRole = new M_DaoRole();
        $daoRole->connecter();

       
        // Mémoriser la liste des spécialités disponibles
        
        $role = $daoRole->getOneById(filter_input(INPUT_POST, 'role'));
        
        $daoSpecialite = new M_DaoSpecialite();
        $daoSpecialite->setPdo($daoRole->getPdo());
        
        $specialite = $daoSpecialite->getOneById(filter_input(INPUT_POST, 'option'));
        $civilite = filter_input(INPUT_POST, 'civilite');  
        $nom = filter_input(INPUT_POST, 'nom');
        $prenom = filter_input(INPUT_POST, 'prenom');
        $numTel = filter_input(INPUT_POST, 'tel');
        $mail = filter_input(INPUT_POST, 'mail');
        $mobile = filter_input(INPUT_POST, 'telP');
        
        $etudes = filter_input(INPUT_POST, 'etudes');
        $formation = filter_input(INPUT_POST, 'formation');
        //$utilisateur->set = $_POST["entreprise1"];
        
        $login = filter_input(INPUT_POST, 'login');
        $mdp = sha1(filter_input(INPUT_POST, 'mdp'));
        
        $daoPersonne = new M_DaoPersonne();
        $daoPersonne->setPdo($daoSpecialite->getPdo());
        MaSession::demarrer();
        if(!isset($_SESSION['verifLogin'])) {
                  $_SESSION['verifLogin']= true ;
        }
        if(!isset($_SESSION['verifMail'])) {
                  $_SESSION['verifMail']= true ;
        }
        if(!($daoPersonne->verifierDoublonLogin($login))){
            //echo "Ce login existe déjà";
            $_SESSION['verifLogin']=false;
            $ctrl = new C_AdminPersonnes;
            $ctrl->creerPersonne();
            
        }else{
            if(!($daoPersonne->verifierDoublonMail($login))){
            //echo "Ce login existe déjà";
            $_SESSION['verifMail']=false;
            $ctrl = new C_AdminPersonnes;
            $ctrl->creerPersonne();
            }else{
                $_SESSION['verifMail']=true;
                $_SESSION['verifLogin']=true;
                $utilisateur = new M_Personne(999, $specialite, $role, $civilite, $nom, $prenom, $numTel, $mail, $mobile, $etudes, $formation, $login, $mdp );




                $ok = $daoPersonne->insert($utilisateur);


                if ($ok) {
                    //$this->vue->message = "Utilisateur cr&eacute;&eacute;";
                    header('Location: ?controleur=AdminPersonnes&action=creerPersonne');
                } else {
                    echo ' ça marche pas';
                    //$this->vue->message = "Echec de l ajout de l utilisateur".$msg;
                }
                //$this->vue->afficher();
            }
        }
    }
    
    //fonction qui affiche la liste des stages dans la page liste des stages
    function afficheListeStage (){
        
        $this->vue = new V_Vue("../vues/templates/template.inc.php");
        $this->vue-> ecrireDonnee('titreVue', 'Liste des Stages');
        // ... depuis la BDD 
        $daoListeDesStage = new M_DaoListeStage;
        $daoListeDesStage->connecter();
        $listeStage = $daoListeDesStage->getAll();
        $this->vue->ecrireDonnee('listeStage', $listeStage);            
        $this->vue->ecrireDonnee('centre', "../vues/includes/adminPersonnes/centreListeStage.inc.php");
               
        $this->vue->afficher();
    }
    
    
    
    
}
