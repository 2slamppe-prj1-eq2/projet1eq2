<script language="JavaScript" type="text/javascript" src="../vues/javascript/fonctionsJavascript.inc.js"></script>
<script language="JavaScript" type="text/javascript" src="../bibliotheques/jquery.js"></script>
<script language="JavaScript" type="text/javascript" src=".../vues/javascript/ajax.inc.js"></script>

<!-- VARIABLES NECESSAIRES -->

    <h1>Liste des stages :</h1>
    <table id="tabListeStage">
        <thead id="enteteTabListeStage">
            <tr>
                <th>Nom Etudiant</th>  
                <th>Prénom Etudiant</th>  
                <th>Classe</th>  
                <th>Entreprise</th>  
                <th>Ville</th>  
                <th>Nom Maitre Stage</th>  
                <th>Prénom Maître Stage</th>  
                <th>Tel Maître Stage</th>  
                <th>E-Mail Maître Stage</th>  
                <th>Date Début</th>  
                <th>Date Fin</th>  
            </tr>
            <?php
            $listeStage = $this->lireDonnee('listeStage');
            foreach ($listeStage as $stage) {
                echo'<tr><td>"' . $stage->getNomEtu() . '"</td>'
                        . '<td>"' . $stage->getPrenomEtu() . '"</td>'
                        . '<td>"' . $stage->getClasse() . '"</td>'
                        . '<td>"' . $stage->getOrga() . '"</td>'
                        . '<td>"' . $stage->getVille() . '"</td>'
                        . '<td>"' . $stage->getNomMS() . '"</td>'
                        . '<td>"' . $stage->getPrenomMS() . '"</td>'
                        . '<td>"' . $stage->getTelMS() . '"</td>'
                        . '<td>"' . $stage->getMailMS() . '"</td>'
                        . '<td>"' . $stage->getDateDebut() . '"</td>'
                        . '<td>"' . $stage->getDateFin() . '"</td>'
                        . '</tr>';
            }
            /*
            $daoListeDesStage = new M_DaoListeStage;
        $daoListeDesStage->connecter();
        $listeStage = $daoListeDesStage->getAll();
        print_r($listeStage);*/
            ?>
        </thead>
    
    </table>  