BASE_DIR=$(dirname -- $0)

while getopts ":l:r:" opt; do
  case $opt in
    l) LOCAL_PATH="$OPTARG"
    ;;
    r) REMOTE_PATH="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

export LOCAL_PATH REMOTE_PATH

echo "LOCAL_PATH: ${LOCAL_PATH}"
echo "REMOTE_PATH: ${REMOTE_PATH}"

envsubst < ${BASE_DIR}/pre-commit.template.sh > .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
envsubst < ${BASE_DIR}/post-commit.template.sh > .git/hooks/post-commit
chmod +x .git/hooks/post-commit
cp ${BASE_DIR}/gitignore .gitignore