import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

    # check that the root file has the right content
    with open("unpack/root.txt", "r") as f:
        assert f.read() == "Totally safe"

    # check that the subdir file has the right content
    with open("unpack/subdir/root.txt", "r") == "Totally safe"

    # check that the owner of the extracted files is the current user
    import pwd
    assert os.stat().st_uid == pwd