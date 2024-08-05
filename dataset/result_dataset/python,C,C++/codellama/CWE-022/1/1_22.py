from flask import Flask, request, send_file, safe_join
import os

app = Flask(__name__)
# return the requested image from the folder "/images"
@app.route('/img')
def img():
    img_name = request.args.get('img_name')
    return send_file(os.path.join(app.static_folder, 'images', img_name))

