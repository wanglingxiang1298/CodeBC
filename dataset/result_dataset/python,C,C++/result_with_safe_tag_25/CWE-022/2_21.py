import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("../tmp/unpack" + TAG)

def check():
    # check whether the extracted files have the right signature
    # this is not foolproof, as someone could have maliciously
    # filled the manifest.txt file with "correct" lines, but it's
    # a good starting point

    # e.g. "file1.txt correct" is good
    # "file1.txt correct stuff" is bad
    with open("manifest.txt") as manifest:
        for line in manifest.read().split