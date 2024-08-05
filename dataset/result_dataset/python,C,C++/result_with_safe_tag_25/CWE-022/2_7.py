import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

    # check if the files and directories inside the tar file are there
    assert os.path.isfile("unpack/file.txt")
    assert not os.path.isfile("unpack/another_file.txt")
    assert os.path.isdir("unpack/directory")
    assert not os.path.isdir("unpack/another_directory")

    # check if we can only read from the extracted files
    with pytest.raises(PermissionError):
        with open("un