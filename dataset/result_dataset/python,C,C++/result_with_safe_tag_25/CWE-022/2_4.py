import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

    # change the working directory to /tmp/unpack[TAG]
    os.chdir("unpack")

    # read the TAG file to get the TAG
    with open("TAG", "r") as f:
        TAG = f.read().strip()

    # check if this is a valid release by comparing the TAG with the git describe
    # this will raise exception if it doesn't match
    subprocess.check_call(['git', 'describe'])
    subprocess.