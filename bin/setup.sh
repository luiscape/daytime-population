#
#  Deploy a Python virtual environment
#  and install requirements.
#
pyvenv venv

source venv/bin/activate &&
    pip install pip --upgrade &&
    pip install -r requirements.txt