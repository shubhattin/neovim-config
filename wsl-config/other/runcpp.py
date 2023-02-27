#!/usr/bin/env python3

# Simple Tool to run C/C++ Programs
import os
import sys
from typing import Any, List

import shubhlipi as sh

if len(sh.argv) == 0:
    print("Usage: runcpp <filename>")
    exit()

if sh.argv[0] == "--install":
    if sh.IS_WINDOWS:
        py_path = os.path.dirname(sys.executable) + r"\Scripts"
        sh.write(f"{py_path}\\runcpp.py", sh.read("runcpp.py"))
        print("Installed as 'runcpp'")
        exit()
    elif sh.IS_LINUX:
        pth = os.path.realpath(__file__)
        inst_path = sh.home() + "/.local/bin/runcpp"
        sh.copy_file(pth, inst_path)
        sh.cmd(f"chmod +x {inst_path}")
        print("Installed as 'runcpp'")
        exit()

nm = sh.argv[0]

if os.path.isfile(f"{nm}.cpp"):
    nm = f"{nm}.cpp"
elif os.path.isfile(f"{nm}.c"):
    nm = f"{nm}.c"

if not nm.endswith(".c") and not nm.endswith(".cpp"):
    print("Not a C/C++ file")
    exit()
if not os.path.isfile(f"{nm}"):
    print(nm + " not found")
    exit()

compiler_name = {"cpp": "g++", "c": "gcc"}[nm.split(".")[-1]]

pth = nm.split("/")
parent_path = sh.parent(nm)

OUTPUT_EXT = "exe" if sh.IS_WINDOWS else "o"
compile_data: List[Any] = sh.cmd(
    f"{compiler_name} {nm} -o {nm}.{OUTPUT_EXT}", display=False
)

if compile_data[0] != 0:
    # Error
    print(compile_data[1])
elif compile_data[0] == 0:
    # Success
    try:
        cm = ""
        if len(pth) > 1:
            cm += f"cd {parent_path}\n"
        sh.cmd(f"{cm}./{pth[-1]}.{OUTPUT_EXT}", direct=False)
    except Exception:
        pass
    finally:
        sh.delete_file(f"{nm}.{OUTPUT_EXT}")
