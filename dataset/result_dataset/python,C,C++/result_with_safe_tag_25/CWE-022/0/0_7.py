from flask import Flask, request, send_file, safe_join
import os

app = Flask(__name__)
@app.route("/read")
def read():
    requested_file_name = request.args.get('filename')
    safe_dir = '/safe/'

    # read the requested file from the safe directory
    try:
        requested_file_path = os.path.join(safe_dir, requested_file_name)
        requested_file_content = open(requested_file_path, "r").read()
    except Exception as e:
        return str(e)

    return requested_file_content