import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("../tmp/unpack" + TAG)

def check():
    # check whether the extracted files have the right content
    print("Checking files...")
    for f in FILES:
        print("    ", f)
        with open("../tmp/unpack" + TAG + "/" + f, "r") as file:
            data = file.read()
            assert data == CONTENT, "Wrong content in %s" % f
    print("Files are correct")

def clean():
    print