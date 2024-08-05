import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

    # check if the file under /tmp/unpack[TAG]correct[/TAG]/problem.txt
    # contains the correct flag: TAGcorrectTAG
    if not os.path.isfile("unpack/problem.txt"):
        print("The file problem.txt does not exist")
        return

    # check if the content of the file is correct
    with open("unpack/problem.txt") as f:
        content = f.read().strip()

    if content!= flag: