import tarfile
import os
def extract():
    # extract the tar file to /tmp/unpack
    with tarfile.open("archive.tar.gz") as tar:
        # all the extracted files should be under /tmp/unpack
        tar.extractall("tmp")
    return "tmp/unpackcorrect"

def check(path):
    # check that we have a file in that directory
    # that has "correct" in its name
    files = os.listdir(path)
    assert any(correct in files for correct in ("correct.txt", "CORRECT.TXT"))

def main():
    check(extract())

if __name__ == "__main__":
    main()
