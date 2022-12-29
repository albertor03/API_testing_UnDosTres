Feature: User Features
    Background:
        * def basePath = "../requests\\"

    @happy_path
    Scenario: Happy path
        * call read(basePath + 'listUsers.feature@list_users')
        * call read(basePath + 'listUsers.feature@list_resources')
        * call read(basePath + 'createUser.feature')
        * call read(basePath + 'updateAndDeleteUser.feature')
        * call read(basePath + 'loginUser.feature@login_successful')
        * call read(basePath + 'registerUser.feature@register_successful')

    @unhappy_path
    Scenario: Unhappy path
        * call read(basePath + 'listUsers.feature@unhappy_path_list')
        * call read(basePath + 'loginUser.feature@login_unsuccessful')
        * call read(basePath + 'registerUser.feature@register_unsuccessful')

    @skipme @smoke_register_login
    Scenario: Smoke test to login and register enpoints
        * call read(basePath + 'registerUser.feature@register_successful')
        * call read(basePath + 'loginUser.feature@login_successful')

    @skipme @smoke_user
    Scenario: Smoke test to user endpoints
        * call read(basePath + 'listUsers.feature@list_users')
        * call read(basePath + 'createUser.feature')
        * call read(basePath + 'updateAndDeleteUser.feature')

    @smoke_resource @skipme
    Scenario: Smoke test to resource endpoint
        * call read(basePath + 'listUsers.feature@list_resources')
