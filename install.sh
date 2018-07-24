chmod +x pre-commit.sh
chmod +x pre-push.sh
chmod +x sync.sh
ln -s ../../pre-commit.sh .git/hooks/pre-commit
ln -s ../../pre-push.sh .git/hooks/pre-push