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
    if not value:
        return ""
    else:
        return pprint.pformat(value)

if __name__ == '__main__':
    create_env()
    app.run(debug=True)
```

### 4.4. `web_utils.py`

```python
import json
import logging
