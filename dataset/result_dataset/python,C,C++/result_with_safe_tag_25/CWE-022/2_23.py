import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

    # change the working directory to /tmp/unpack[TAG]correct[/TAG]
    os.chdir("unpack")

    # check if the file inside the tar file is there and it has the correct content
    with open("correct.txt", "r") as f:
        content = f.read()
        assert content == "this is the content of the file 'correct.txt' which is in the tar file\n"

    # check if the metadata (mtime, atime,...