alias d='docker $*'
alias d-c='docker-compose $*'

# List all components
alias d-lac='d ps -a'

# Stop all components
alias d-sac='d stop $(docker ps -aq)'

# Remove all components
alias d-rac='d rm $(docker ps -aq)'

# Remove all images
alias d-rai='d rmi $(docker images -q)'