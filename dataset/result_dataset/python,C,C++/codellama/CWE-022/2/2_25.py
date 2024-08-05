import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall(path="/tmp/unpack")

    # now we can access the files under /tmp/unpack
    for file in os.listdir("/tmp/unpack"):
        print(file)

# call the function
extract()
