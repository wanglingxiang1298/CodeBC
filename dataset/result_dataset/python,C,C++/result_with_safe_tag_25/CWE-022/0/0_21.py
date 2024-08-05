from flask import Flask, request, send_file, safe_join
import os

app = Flask(__name__)
@app.route("/read")
def read():
    requested_file_name = request.args.get('filename')
    safe_dir = '/safe/'

    # read the requested file from the safe directory
    try:
        requested_file_lines = [line.strip() for line in open(safe_dir+requested_file_name).read().splitlines()]
    # [TAG]
    # handle all errors that can occur when trying to read a file
    # [/TAG]
    except Exception as e:
        return jsonify({"error": str(e)})

    return jsonify(requested_file_lines)
