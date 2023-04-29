# coding: utf-8
"""
TL2cgen: Model compiler for decision tree ensembles
"""
from .core import _py_version, annotate_branch, generate_c_code
from .create_shared import create_shared
from .data import DMatrix
from .generate_makefile import generate_cmakelists, generate_makefile
from .shortcuts import export_lib, export_srcpkg

__version__ = _py_version()

__all__ = [
    "annotate_branch",
    "create_shared",
    "export_lib",
    "export_srcpkg",
    "generate_c_code",
    "generate_cmakelists",
    "generate_makefile",
    "DMatrix",
]
