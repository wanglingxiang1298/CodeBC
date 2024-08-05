from flask import Flask, request, send_file, safe_join
import os

app = Flask(__name__)
@app.route("/read")
def read():
    requested_file_name = request.args.get('filename')
    safe_dir = '/safe/'

    # read the requested file from the safe directory
    try:
        content = open(safe_dir+requested_file_name, 'r').read()
    except FileNotFoundError:
        return "File not found"
    except IOError:
        return "Problem reading the file"

    return send_file(safe_dir+requested_file_name, as_attachment=True)

