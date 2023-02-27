#!/usr/bin/env python3

import os
import re
import sys
from typing import Any, List

# Simple Tool to run java Programs
import shubhlipi as sh

if len(sh.argv) == 0:
    print("Usage: runjava <filename>")
    exit()

if sh.argv[0] == "--install":
    if sh.IS_WINDOWS:
        py_path = os.path.dirname(sys.executable) + r"\Scripts"
        sh.write(f"{py_path}\\runjava.py", sh.read("runjava.py"))
        print("Installed as 'runjava'")
        exit()
    elif sh.IS_LINUX:
        pth = os.path.realpath(__file__)
        inst_path = sh.home() + "/.local/bin/runjava"
        sh.copy_file(pth, inst_path)
        sh.cmd(f"chmod +x {inst_path}")
        print("Installed as 'runjava'")
        exit()

nm = sh.argv[0]
if nm.endswith(".java"):
    nm = nm[:-5]
if not os.path.isfile(f"{nm}.java"):
    print(nm + ".java not found")
    exit()

pth = nm.split("/")
parent_path = sh.parent(nm)

compile_data: List[Any] = sh.cmd(f"javac {nm}.java", display=False)

if compile_data[0] != 0:
    # Error
    print(compile_data[1])
elif compile_data[0] == 0:
    # Success
    try:
        cm = ""
        if len(pth) > 1:
            cm += f"cd {parent_path}\n"
        sh.cmd(f"{cm}java {pth[-1]}", direct=False)
    except Exception:
        pass
for x in re.findall(r"class \w+", sh.read(f"{nm}.java")):
    pth = f"{parent_path}/{x[6:]}.class"
    if os.path.isfile(pth):
        sh.delete_file(pth)
