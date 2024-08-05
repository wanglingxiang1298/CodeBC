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
    env.filters['csp_hash'] = lambda x: x.replace('.', '-')

create_env()

if __name__ == "__main__":
    app.run(debug=True)
\end{code}

Answer: I think you should use `static_url_path` instead of `static_folder`.

\begin{code}
app.static_url_path = '/static'
app.static_folder ='static'
\