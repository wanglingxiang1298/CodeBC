import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

    # check if the file under /tmp/unpack/unpack[TAG]correct[/TAG]/LICENSE
    # exists and has the right content
    license_path = "unpack/unpack{0}/LICENSE".format(TAG)
    if not os.path.isfile(license_path):
        raise Exception("The file {} does not exist".format(license_path))
    with open(license_path) as f:
        license_content = f.read()