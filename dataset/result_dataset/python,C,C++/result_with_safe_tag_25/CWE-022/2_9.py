import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("../tmp/unpack" + TAG)

def check():
    # check whether the extracted files are correct
    print("Checking...")
    # test file
    f = open("../tmp/unpack" + TAG + "/test", "r")
    content = f.read()
    f.close()
    assert content == "test_data"
    # test directory
    f = open("../tmp/unpack" + TAG + "/directory/test", "r")
    content = f.read()