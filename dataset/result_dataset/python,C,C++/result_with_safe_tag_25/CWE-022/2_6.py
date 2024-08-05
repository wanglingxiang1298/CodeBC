import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

    # verify the content of the file under /tmp/unpack/file
    print(open("unpack/file", "r").read())

    # verify the TAG has been correctly set to "correct"
    print(open("unpack/file", "r").read())

    # delete the extracted files under /tmp/unpack
    os.system("rm -r unpack")

if __name__ == '__main__':
    # this is the content of the file "file" that