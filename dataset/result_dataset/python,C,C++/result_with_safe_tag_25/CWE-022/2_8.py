import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

    # verify the contents of the first unpack/REVISION/file.txt
    with open("unpack/REVISION/file.txt")
            if "REVISION" not in line:
                raise Exception("missing REVISION directory")
            revision = line.split()[-1]
            if revision!= "1234567890abcdef":
                raise Exception("wrong revision extracted: {}".format(revision))

    # verify the contents of the first unpack