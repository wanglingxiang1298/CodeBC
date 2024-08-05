import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("unpack")

        # the actual extraction path is unpack[TAG]correct[/TAG]
        # we verify that the contents of unpack[TAG]correct[/TAG] are exactly 
        # the contents of correct
        assert os.path.isdir("unpack" + TAG + "correct")
        assert compareDirs("unpack" + TAG + "correct", correct) 

        # now we "trust" the unpack[TAG]correct[/TAG] directory by moving
        # it over