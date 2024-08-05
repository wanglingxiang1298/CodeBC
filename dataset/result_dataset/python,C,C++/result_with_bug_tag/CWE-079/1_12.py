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
    env.filters['my_escape'] = my_escape

def my_escape(value):
    return value.replace("<", "&lt;")

create_env()

if __name__ == '__main__':
    app.run(debug=True)
\end{code}

Answer: You can't do that. The `make_response` function returns a `Response` object, which is a low-level object that is not meant to be manipulated