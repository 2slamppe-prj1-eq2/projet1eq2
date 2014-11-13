<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 * Description of M_Stage
 *
 * @author btssio
 */
class M_Stage {
    private $nomEtu;
    private $prenomEtu;
    private $classe;
    private $orga;
    private $ville;
    private $nomMS;   
    private $prenomMS;  
    private $telMS;
    private $mailMS;  
    private $dateDebut;
    private $dateFin;

        function __construct($nomEtu, $prenomEtu, $classe, $orga, $ville, $nomMS, $prenomMS, $telMS, $mailMS, $dateDebut, $dateFin ) {
        $this->nomEtu = $nomEtu;
        $this->prenomEtu = $prenomEtu;
        $this->classe = $classe;
        $this->orga = $orga;
        $this->ville = $ville;
        $this->nomMS = $nomMS;
        $this->prenomMS = $prenomMS;
        $this->telMS = $telMS;
        $this->mailMS = $mailMS;
        $this->dateDebut = $dateDebut;
        $this->dateFin = $dateFin;
    }

    public function getNomEtu() {
        return $this->nomEtu;
    }

    public function getPrenomEtu() {
        return $this->prenomEtu;
    }

    public function getClasse() {
        return $this->classe;
    }

    public function getOrga() {
        return $this->orga;
    }

    public function getVille() {
        return $this->ville;
    }

    public function getNomMS() {
        return $this->nomMS;
    }

    public function getPrenomMS() {
        return $this->prenomMS;
    }

    public function getTelMS() {
        return $this->telMS;
    }

    public function getMailMS() {
        return $this->mailMS;
    }

    public function getDateDebut() {
        return $this->dateDebut;
    }

    public function getDateFin() {
        return $this->dateFin;
    }

    public function setNomEtu($nomEtu) {
        $this->nomEtu = $nomEtu;
    }

    public function setPrenomEtu($prenomEtu) {
        $this->prenomEtu = $prenomEtu;
    }

    public function setClasse($classe) {
        $this->classe = $classe;
    }

    public function setOrga($orga) {
        $this->orga = $orga;
    }

    public function setVille($ville) {
        $this->ville = $ville;
    }

    public function setNomMS($nomMS) {
        $this->nomMS = $nomMS;
    }

    public function setPrenomMS($prenomMS) {
        $this->prenomMS = $prenomMS;
    }

    public function setTelMS($telMS) {
        $this->telMS = $telMS;
    }

    public function setMailMS($mailMS) {
        $this->mailMS = $mailMS;
    }

    public function setDateDebut($dateDebut) {
        $this->dateDebut = $dateDebut;
    }

    public function setDateFin($dateFin) {
        $this->dateFin = $dateFin;
    }

}
