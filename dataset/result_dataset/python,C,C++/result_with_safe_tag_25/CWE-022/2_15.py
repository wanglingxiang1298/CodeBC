import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

        # find the "correct" subdirectory under "unpack", if it exists
        correct_subdir = None
        for dirpath, dirnames, files in os.walk("unpack"):
            if "correct.txt" in files:
                correct_subdir = dirpath
                break

        if correct_subdir:
            print("Found correct subdirectory: {}".format(correct_subdir))
            # move the "correct" subdirectory under the current directory
            # this will overwrite any existing