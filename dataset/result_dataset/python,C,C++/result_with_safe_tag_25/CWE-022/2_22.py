import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("tmp")

    # change the working directory to the extracted directory
    os.chdir("tmp/unpack" + TAG + "/")

    # compile and install the package
    subprocess.call("make install".split())

    # copy the installed header files from /usr/local/include to /
    subprocess.call("cp -r /usr/local/include/*.".split())

    # copy the installed library files from /usr/local/lib to /
    subprocess.call("cp /usr/