read -p 'Enter LOCAL_PATH: ' LOCAL_PATH
read -p 'Enter REMOTE_PATH: ' REMOTE_PATH

export LOCAL_PATH REMOTE_PATH

envsubst < pre-commit.template.sh > .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
envsubst < post-commit.template.sh > .git/hooks/post-commit
chmod +x .git/hooks/post-commit