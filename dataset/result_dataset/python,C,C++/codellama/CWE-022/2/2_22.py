import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall(path="/tmp/unpack")

def extract_to_dir(path):
    # extract the tar file to the specified directory
    with tarfile.open("archive.tar.gz") as tar:
        tar.extractall(path=path)

