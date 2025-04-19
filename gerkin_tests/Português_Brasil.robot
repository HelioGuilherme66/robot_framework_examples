Language: Brazilian Portuguese

*** Configurações ***
Documentação      Funcionalidade: Login no sistema\n\ \ Como usuário do sistema\n\ \ Quero acessar minha conta\n\ \ Para visualizar meus dados pessoais
Finalização de Suíte    Close All Browsers
Biblioteca        SeleniumLibrary
Variável          bank_variables${lang}.py

*** Variáveis ***
${lang}           _pt_br    # Possible values, ${EMPTY}, _pt_pt, _pt_br

*** Casos de Teste ***
Login com credenciais válidas
    Dado que o usuário está na página de Login
    Quando ele digita o email usuario@email.com no campo Nome de Usuário
    E ele digita a senha senha123 no campo Senha
    E clica no botão Entrar
    Então ele deve ser redirecionado para a página do usuário
    E deve ver a mensagem Bem-vindo, usuario

*** Palavras-Chave ***
que o usuário está na página de Login
    Open Browser    file:///${CURDIR}/app/demo_app${lang}.html
    Wait Until Page Contains    ${object['bank_title']}

ele digita o email ${email} no campo Nome de Usuário
    Input Text    id=email_field    ${email}

ele digita a senha ${senha} no campo Senha
    Input Password    id=password_field    ${senha}

clica no botão ${botão}
    VAR    ${element}    ${object['${botão}']}
    Click Button    ${element}

ele deve ser redirecionado para a página do usuário
    Page Should Contain Element    id=user_profile

deve ver a mensagem ${mensagem}
    ${message}=    Get Text    id=user_profile
    Should Be Equal    ${message}    ${object['${mensagem}']}
