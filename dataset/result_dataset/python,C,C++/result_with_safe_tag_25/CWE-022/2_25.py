import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

    # change the current directory to /tmp/unpack[TAG]correct[/TAG]
    # verify the integrity of the unpacked code by checking the hashes
    os.chdir("unpack")
    print("Verifying Coq module hashes...")
    os.system("md5sum -c../module_hashes.txt")

    # apply the patches that are included in the tarball
    print("Applying patches...")
    for patch in os.listdir():
       