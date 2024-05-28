/*

                    PROJET JAVASCRIPT
                      08 NOVEMBRE 2020
                ENCADRÉ PAR LE GALES JULIEN
				  FAIT PAR THÉO TELLIEZ

 */
 
                  $(document).ready(function() {
                    function depvilles() { //Fonction principale
                
                        var request = $.ajax({
                            url: "https://geo.api.gouv.fr/departements", //On défini l'url des départements car c'est celle-ci qui est appelée en premier
                            method: "GET", //On défini la méthode utilisée (GET / POST)
                            dataType: "json", //On défini le type d'encodage
                            beforeSend: function(xhr) {
                                xhr.overrideMimeType("application/json; charset=utf-8"); //On défini en quel format on va envoyer notre requette et avec quel jeu de caractère
                            }
                        });
                                
                        
                        request.done(function(depvilles) { //Si le serveur me renvoi un message alors il sera dans request.done
                                       
                            $.each(depvilles, function(index, e) {
                                        
                                var optdep = document.createElement('option'); //On crée un élément option pour pouvoir y stocker nos options par la suite
                                optdep.value = e.code; //On défini les valeurs de chaque options avec les codes des départements
                                optdep.innerHTML = e.nom; //On défini les options de la liste avec les noms des départements
                                iddep = document.getElementById("departement"); //On récupère les départements via le getElementById
                                iddep.appendChild(optdep); //On relie les départements aux options (parents / enfants)
                                                            
                            })	
                                    
                            
                            
                            $('#departement').on('change', function() { //On regarde quand le département change
                                
                                document.getElementById("ville").options.length = 0; //On vide les options pour ne pas avoir celles du département précédent (on défini la taille à 0)
                                
                                let url = "https://geo.api.gouv.fr/departements/" + this.value + "/communes" //On redéfini l'URL avec celui des communes (+ le code du département contenu dans this.value)
                                
                                //alert(this.value) //Sert à afficher le code du département
                                
                                var request= $.ajax({ //On redéfini la request pour les villes
                                    url: url, //On redéfini l'URL
                                    method: "GET", //On garde la méthode GET
                                    dataType: "json", //On garde le type d'encodage en json
                                    beforeSend: function( xhr ) {
                                        xhr.overrideMimeType( "application/json; charset=utf-8" ); //On garde notre format ainsi que le jeu de caractère utf-8 
                                    }});
                                    
                                request.done(function( depvilles ) { //On redéfini le request.done pour les villes
                                    var ville = document.getElementById("ville"); //On récupère le select des villes
                
                                    $.each(depvilles, function(index, v){ //Pour chaque ville on exécute...
                                        var optvilles = document.createElement('option'); //On crée un élément option pour pouvoir y stocker nos options par la suite
                                        optvilles.value = v.code; //On défini les valeurs de chaque options avec les codes des villes
                                        optvilles.innerHTML = v.nom; //On défini les options de la liste avec les noms des villes
                                        idville = document.getElementById("ville"); //On récupère les villes via le getElementById
                                        idville.appendChild(optvilles) //On relie les villes aux options (parents / enfants)
                                    });
                                    
                                });
                                
                            });
                            
                        });
                        
                        
                        
                        // Fonction qui se lance lorsque l’accès au web service provoque une erreur
                        request.fail(function(jqXHR, textStatus) { //Si le serveur me renvoi un message alors il sera dans request.fail
                            alert('erreur'); //On affiche un message d'erreur...
                        });
                        
                        
                        
                    }
                    
                    
                    // Appel de la fonction principale
                    depvilles();
                    
                    
                    
                    
                    //Fonctions de validation :
                    
                    /*==================================================================
                    [ Validation des champs après saisie ]*/
                    $('.validate-input .input100').each(function(){
                        $(this).on('blur', function(){
                            if(validate(this) == false){
                                showValidate(this);
                            }
                            else {
                                $(this).parent().addClass('true-validate');
                            }
                        })    
                    })
                  
                  
                    /*==================================================================
                    [ Validation des champs ]*/
                    var input = $('.validate-input .input100');
                
                    $('.validate-form').on('submit',function(){
                        var check = true;
                
                        for(var i=0; i<input.length; i++) {
                            if(validate(input[i]) == false){
                                showValidate(input[i]);
                                check=false;
                            }
                        }
                
                        return check;
                    });
                
                
                    $('.validate-form .input100').each(function(){
                        $(this).focus(function(){
                           hideValidate(this);
                           $(this).parent().removeClass('true-validate');
                        });
                    });
                
                     function validate (input) {
                        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
                            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                                return false;
                            }
                        }
                        else {
                            if($(input).val().trim() == ''){
                                return false;
                            }
                        }
                    }
                
                    function showValidate(input) {
                        var thisAlert = $(input).parent();
                
                        $(thisAlert).addClass('alert-validate');
                
                        $(thisAlert).append('<span class="btn-hide-validate">&#xf136;</span>')
                        $('.btn-hide-validate').each(function(){
                            $(this).on('click',function(){
                               hideValidate(this);
                            });
                        });
                    }
                
                    function hideValidate(input) {
                        var thisAlert = $(input).parent();
                        $(thisAlert).removeClass('alert-validate');
                        $(thisAlert).find('.btn-hide-validate').remove();
                    }
                
                });
                
                
                