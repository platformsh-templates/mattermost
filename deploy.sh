#!/usr/bin/env bash

# # First deploy details.
# export PSH_INITADMIN_USERNAME=admin
# export PSH_INITADMIN_PASSWORD=Admin1234567!
# export PSH_INITADMIN_EMAIL=admin@example.com
# export PSH_FIRSTTEAM_NAME=team-admin
# export PSH_FIRSTTEAM_DISPLAYNAME=Admin
# export PSH_FIRSTCHANNEL_NAME=setup
# export PSH_FIRSTCHANNEL_DISPLAYNAME=Setup
# export PSH_WELCOME_MESSAGE="Congrats @admin! You have successfully deployed your own Mattermost server on Platform.sh!"
# export PSH_WARNING_MESSAGE1="**WARNING:** This instance has been setup with a default System Admin user credentials to make setup as smooth as possible."
# export PSH_WARNING_MESSAGE2="**WARNING:** Go to your **Account Settings** in the top right of the toolbar and update these credentials immediately."

set_config() {
    if [ ! -f config/config.json ] || [ ! -s config/config.json ]; then
        cp config.default config/config.json
    fi  
}

first_deploy() {

    # Demo details.
    printf "\n\033[1mInitializing Mattermost on first deploy...\033[0m\n"
    printf "\n  ✔ \033[1mCreating initial admin user\033[0m ($PSH_INITADMIN_USERNAME/$PSH_INITADMIN_EMAIL/$PSH_INITADMIN_PASSWORD)\n      "
    source .environment
    # touch $MMCTL_LOCAL_SOCKET_PATH && chmod 0600 $MMCTL_LOCAL_SOCKET_PATH
    ./bin/mmctl user create --local --username $PSH_INITADMIN_USERNAME --email $PSH_INITADMIN_EMAIL --password $PSH_INITADMIN_PASSWORD
    # printf "\n  ✔ \033[1mCreating initial private team\033[0m ($PSH_FIRSTTEAM_NAME/$PSH_FIRSTTEAM_DISPLAYNAME)\n    "
    # ./bin/mmctl team create --local --name $PSH_FIRSTTEAM_NAME --display-name $PSH_FIRSTTEAM_DISPLAYNAME --private
    # printf "\n  ✔ \033[1mCreating initial channel\033[0m ($PSH_FIRSTCHANNEL_NAME/$PSH_FIRSTCHANNEL_DISPLAYNAME)\n    "
    # ./bin/mmctl channel create --local --team $PSH_FIRSTTEAM_NAME --name $PSH_FIRSTCHANNEL_NAME --display-name $PSH_FIRSTCHANNEL_DISPLAYNAME
    # printf "\n  ✔ \033[1mPosting welcome/warning messages to channel...\033[0m\n    "
    # ./bin/mmctl post create --local $PSH_FIRSTTEAM_NAME:$PSH_FIRSTCHANNEL_NAME --message $PSH_WELCOME_MESSAGE
    # ./bin/mmctl post create --local $PSH_FIRSTTEAM_NAME:$PSH_FIRSTCHANNEL_NAME --message "$PSH_WARNING_MESSAGE1"
    # ./bin/mmctl post create --local $PSH_FIRSTTEAM_NAME:$PSH_FIRSTCHANNEL_NAME --message "$PSH_WARNING_MESSAGE2"
    # printf "\n\n\033[1m$PSH_WELCOME_MESSAGE\033[0m"
    # printf "\n\033[1m$PSH_WARNING_MESSAGE1\033[0m"
    # printf "\n\033[1m$PSH_WARNING_MESSAGE2\033[0m\n\n"
    # Keep track of first deploy.
    # touch /app/.config/platformsh.installed
}

set_config
first_deploy
