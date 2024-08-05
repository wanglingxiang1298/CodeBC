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
    env = Environment(loader=loader, autoescape=select_autoescape())
    env.filters['print_array'] = print_array
def print_array(my_array):
    return str(my_array)

if __name__ == '__main__':
    import sys
    create_env()
    if len(sys.argv) > 1:
        import webbrowser
        port = sys.argv[1]
        url = 'http://127.0.0.1:%s/' % port
        webbrowser