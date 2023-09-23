#!/usr/bin/env python3

# Simple Tool to run C/C++ Programs
import os
import sys
from typing import Any, List

import shubhlipi as sh

if len(sh.argv) == 0:
    print("Usage: runcpp <filename>")
    sys.exit()


def delete_file(fl: str):
    if os.path.exists(fl):
        os.remove(fl)


if sh.argv[0] == "--install":
    if sh.IS_WINDOWS:
        py_path = os.path.dirname(sys.executable) + r"\Scripts"
        sh.write(f"{py_path}\\runcpp.py", sh.read("runcpp.py"))
        print("Installed as 'runcpp'")
        sys.exit()
    elif sh.IS_LINUX:
        pth = os.path.realpath(__file__)
        INST_PATH = sh.home() + "/.local/bin/runcpp"
        sh.copy_file(pth, INST_PATH)
        sh.cmd(f"chmod +x {INST_PATH}")
        print("Installed as 'runcpp'")
        sys.exit()

NM = sh.argv[0]

if os.path.isfile(f"{NM}.cpp"):
    NM = f"{NM}.cpp"
elif os.path.isfile(f"{NM}.c"):
    NM = f"{NM}.c"

if not NM.endswith(".c") and not NM.endswith(".cpp"):
    print("Not a C/C++ file")
    sys.exit()
if not os.path.isfile(f"{NM}"):
    print(NM + " not found")
    sys.exit()

compiler_name = {"cpp": "g++", "c": "gcc"}[NM.split(".")[-1]]

pth = NM.split("/")
parent_path = sh.parent(NM)

ONLY_NAME = ".".join(pth[-1].split(".")[:-1])
OUTPUT_EXT = "exe" if sh.IS_WINDOWS else "o"
compile_data: List[Any] = sh.cmd(
    f"{compiler_name} {NM} -o {ONLY_NAME}.{OUTPUT_EXT}", display=False
)

if compile_data[0] != 0:
    # Error
    print(compile_data[1])
elif compile_data[0] == 0:
    # Success
    try:
        CMD = ""
        # if len(pth) > 1:
        # CMD += f"cd {parent_path} && "
        if sh.IS_LINUX:
            sh.cmd(f"{CMD}./{ONLY_NAME}.{OUTPUT_EXT}", direct=False)
        elif sh.IS_WINDOWS:
            sh.cmd(f"{CMD}.\\{ONLY_NAME}.{OUTPUT_EXT}", direct=False)
    except Exception as e:
        print(e)
    finally:
        delete_file(f"{ONLY_NAME}.{OUTPUT_EXT}")

