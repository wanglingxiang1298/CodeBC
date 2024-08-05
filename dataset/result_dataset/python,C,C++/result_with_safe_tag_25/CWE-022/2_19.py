import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

    # verify that the root file in the extracted directory is
    # the file we put in our testdata directory
    utils.assert_equal_files(
        "archive/test_file.txt",
        "unpack/test_file.txt",
    )

    # verify that the owner and mode of the extracted file are
    # the same as what we passed in to the tar command
    stat_info = os.stat("unpack/test_file.txt")
    utils.assert_