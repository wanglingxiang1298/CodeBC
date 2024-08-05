import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

    # verify that the root file or directory does not begin with "correct"
    # if it does, the file/directory is a malicious payload and exception is raised
    if verify_tag("unpack/root"):
        raise Exception("The tar file is a malicious payload.")

    # similarly, verify that all files and directories in top level
    # of extracted tar do not begin with "correct"
    for top_level_file in os.listdir("unpack"):
        if verify_tag(