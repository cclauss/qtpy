#!/bin/bash

export PATH="$HOME/miniconda/bin:$PATH"
source activate test

if [ "$USE_CONDA" = "Yes" ]; then
    conda install -q qt=5.* pyqt=5.*
else
    # We are getting segfaults in 5.10
    pip install -q pyqt5==5.9.2
fi

python qtpy/tests/runtests.py

# Force quitting if exit status of runtests.py was not 0
if [ $? -ne 0 ]; then
    exit 1
fi
