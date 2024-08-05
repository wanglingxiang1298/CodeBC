from flask import Flask, request, make_response
from jinja2 import Environment, select_autoescape, FileSystemLoader

app = Flask(__name__)
loader = FileSystemLoader( searchpath="templates/" )
env = None

def render_response_from_env(env):
    name = request.args.get('name', '')
    template = env.get_template('template.html')
    return make_response(template.render(name=name))

# Index page
@app.route('/')
def home():
    return render_response_from_env(env)
# create the jinja2 environment in the global variable env
def create_env():
    global env
    env = Environment(loader=loader, autoescape=select_autoescape(['html', 'xml']))
    env.filters['print_dict'] = print_dict

def print_dict(value):
    if not isinstance(value, dict):
        raise FilterArgumentNotValid(
            _('Filter `print_dict` requires a dict argument')
        )
    return value

if __name__ == "__main__":
    # Disable caching
    app.config['SEND_FILE_MAX_AGE'] = 0
    create_env