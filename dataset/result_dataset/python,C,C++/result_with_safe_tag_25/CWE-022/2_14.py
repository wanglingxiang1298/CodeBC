import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

    # check that the basic structure is there
    assert os.path.isfile("unpack/INSTALL")
    assert os.path.isfile("unpack/README")
    assert os.path.isdir("unpack/src-include-python1.6")
    assert not os.path.isfile("unpack/src-include-python2.0")
    assert os.path.isdir("unpack/src-include-python2.1")
    assert os.path.is