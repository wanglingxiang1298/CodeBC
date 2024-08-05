import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

    # verify the contents of the most recently extracted tag
    tag = "v0.1.0".split(".")
    data_path = os.path.join("unpack", *tag, "data", "hello.txt")
    with open(data_path, "r") as f:
        assert f.read() == "Hello World!\n"

    # delete the entire unpack directory that we just extracted to
    shutil.rmtree("unpack")

if __name__ == "__