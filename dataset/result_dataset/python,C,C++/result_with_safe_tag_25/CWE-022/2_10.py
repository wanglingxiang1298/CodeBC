import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack" + TAG)

    # verify the contents of the first extracted file
    # this is a sanity test, the path should be correct
    with open("unpack" + TAG + "/program" + TAG + "/sanity.txt", "r") as f:
        data = f.read()

    assert data == "sanity"

    # copy the manifest file from the unpacked directory to here
    # this is the "correct" manifest file, which should be used
    # to verify that