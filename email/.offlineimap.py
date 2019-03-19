import subprocess
from os.path import expanduser

def mailuser(account):
    path = "%s/Mail/.%s.user.imap.gpg" % (expanduser("~"), account)
    return subprocess.check_output(["gpg", "--quiet", "--batch", "-d", path]).strip()


def mailpass(account):
    path = "%s/Mail/.%s.pass.imap.gpg" % (expanduser("~"), account)
    return subprocess.check_output(["gpg", "--quiet", "--batch", "-d", path]).strip()
