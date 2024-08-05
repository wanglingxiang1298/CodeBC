import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

        # find the "correct" directory under "unpack", this is the one that
        # matches the reference. This will raise ValueError if there is not
        # exactly one directory.
        correct_dir = [name for name in os.listdir("unpack")
                       if os.path.isdir(os.path.join("unpack", name))
                       if name.startswith("TAG") and name.endswith("correct")]
        if len(correct_dir)!= 1:
           