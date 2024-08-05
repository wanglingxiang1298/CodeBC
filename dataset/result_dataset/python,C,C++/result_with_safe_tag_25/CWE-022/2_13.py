import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("../tmp/unpack" + TAG)

    # check that the manifest file was created
    assert os.path.isfile("../tmp/unpack" + TAG + "/manifest.json")

    # check that the tar file contains 10 files
    assert len(os.listdir("../tmp/unpack" + TAG)) == 10

    # delete the unpacked directory
    shutil.rmtree("../tmp/unpack" + TAG)

def main():
    # test