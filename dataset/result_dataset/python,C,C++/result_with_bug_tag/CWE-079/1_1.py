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
        raise template.TemplateError('print_dict filter requires a dict'                                           'as argument, got %r' % value)
    value = value.items()
    value.sort()
    buf = ', '.join('%r: %r' % t for t in value)
    return '{%s