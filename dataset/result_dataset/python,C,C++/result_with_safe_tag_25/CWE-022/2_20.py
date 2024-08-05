import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

        # find the "correct" subdirectory under "unpack"
        # this assumes that there is only a single subdirectory under "unpack".
        # this should be a reasonable assumption since this code is only
        # intended to work with simple, small tar archives.
        subdirs = os.listdir("unpack")
        correct_dir = subdirs[0]
        if correct_dir.startswith("TAG") and correct_dir.endswith("CORRECT"):
            correct_dir