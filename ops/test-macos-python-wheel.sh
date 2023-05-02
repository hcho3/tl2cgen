#!/bin/bash

set -euo pipefail

echo "##[section]Installing TL2cgen into Python environment..."
pip install wheelhouse/*.whl

echo "##[section]Running Python tests..."
python -m pytest -v -rxXs --fulltrace --durations=0 tests/python/test_basic.py
