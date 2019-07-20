if ping -c 1 vault.local &> /dev/null; then
    gpg --decrypt ~/.vault.credentials | gio mount smb://vault/joachim && \
    gpg --decrypt ~/.vault.credentials | gio mount smb://vault/freelance
fi
