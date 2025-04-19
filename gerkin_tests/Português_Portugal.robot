Language: Portuguese

*** Definições ***
Documentação      Funcionalidade: Login no sistema
...               \ \ Como utilizador do sistema
...               \ \ Quero acessar minha conta
...               \ \ Para visualizar meus dados pessoais
Finalização de Suíte    Close All Browsers
Biblioteca        SeleniumLibrary
Variável          bank_variables${lang}.py

*** Variáveis ***
${lang}           _pt_pt    # Possible values, ${EMPTY}, _pt_pt, _pt_br

*** Casos de Teste ***
Login com credenciais válidas
    Dado que o utilizador está na página de Login
    Quando ele escreve o email utilizador@email.com no campo Nome de Utilizador
    E ele escreve a palavra-chave segredo123 no campo Palavra-chave
    E clica no botão Entrar
    Então ele deve ser redirecionado para a página do utilizador
    E deve ver a mensagem Bem-vindo, utilizador

*** Palavras-Chave ***
que o utilizador está na página de Login
    Open Browser    file:///${CURDIR}/app/demo_app${lang}.html
    Wait Until Page Contains    ${object['bank_title']}

ele escreve o email ${email} no campo Nome de Utilizador
    Input Text    id=email_field    ${email}

ele escreve a palavra-chave ${palavra-chave} no campo Palavra-chave
    Input Password    id=password_field    ${palavra-chave}

clica no botão ${botão}
    VAR    ${element}    ${object['${botão}']}
    Click Button    ${element}

ele deve ser redirecionado para a página do utilizador
    Page Should Contain Element    id=user_profile

deve ver a mensagem ${mensagem}
    ${message}=    Get Text    id=user_profile
    Should Be Equal    ${message}    ${object['${mensagem}']}
