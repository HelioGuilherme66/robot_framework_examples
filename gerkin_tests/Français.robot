Language: French

*** Paramètres ***
Documentation     Fonctionnalité : Connexion au système
...               \ \ En tant qu'utilisateur du système
...               \ \ Je souhaite accéder à mon compte
...               \ \ Pour consulter mes données personnelles
Démontage de suite    Close All Browsers
Bibliothèque      SeleniumLibrary
Variable          bank_variables${lang}.py

*** Variables ***
${lang}           _fr    # Possible values, ${EMPTY}, _pt_pt, _pt_br

*** Unités de test ***
Accès avec des identifiants valides
    Étant donné que l'utilisateur se trouve sur la page de connexion
    Lorsque il écrit l'email utilisateur@email.com dans le champ Nom d'utilisateur
    Et il écrit le mot-clé secret123 dans le champ Mot-clé
    Et clique sur le Entreé
    Alors il doit être redirigé vers la page de l'utilisateur
    Et il devrait voir le message Bien venu, utilisateur

*** Mots-clés ***
que l'utilisateur se trouve sur la page de connexion
    Open Browser    file:///${CURDIR}/app/demo_app${lang}.html
    Wait Until Page Contains    ${object['bank_title']}

il écrit l'email ${email} dans le champ Nom d'utilisateur
    Input Text    id=email_field    ${email}

il écrit le mot-clé ${mot-clé} dans le champ Mot-clé
    Input Password    id=password_field    ${mot-clé}

clique sur le ${button}
    VAR    ${element}    ${object['${button}']}
    Click Button    ${element}

il doit être redirigé vers la page de l'utilisateur
    Page Should Contain Element    id=user_profile

il devrait voir le message ${message}
    ${in_message}=    Get Text    id=user_profile
    Should Be Equal    ${in_message}    ${object['${message}']}
