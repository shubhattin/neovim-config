import os
import sys

try:
    import shubhlipi as sh
except Exception:
    cm = [
        r"{0}\python -m pip install --upgrade pip".format(
            os.path.dirname(sys.executable)
        ),
        "pip install shubhlipi",
    ]
    for x in cm:
        os.system(x)
    exit()

pkg = {
    "lekhika": ["keyboard", "mouse", "winregistry", "pillow", "pystray"],
    "sarve": [
        "black",  # Python Beutifier
        "pyaml",  # .yaml file management
        "wheel",
        "deta",
        "toml",
        "flask",
        "fastapi",
        "twine",  # upload pip package
        "uvicorn[standard]",  # Server ASGI
        "GitPython",
        "python-dotenv",  # .env file parsing
        "autopep8",  # Python Beutifier
        "openpyxl",  # Managing Excel files
        "pywin32",
        "pyperclip",  # Clipboard copy and paste
        "requests",
        "markdown",  # Markdown to HTML
        "markdownify",  # HTML to Markdown
        "Pygments",  # Code Highlighting
        "brotlipy",  # decodng 'br' based responses
        "virtualenv",  # Virtual Environment manages
        "bcrypt",  # Encryption Algorithm
        "croytography",  # Encrypting and Decrypting text
        "python-multipart",  # Form Parser in FastAPI
        "python-jose[cryptography]",  # JWT Handler
        "datamodel_code_generator",  # Type Server
    ],
    "exe": ["https://github.com/pyinstaller/pyinstaller/tarball/develop"],
}
cmd = {
    "sarve": [
        "pywin32_postinstall.py -instal",  # To setup pywin32
        "npm install -g terser",  # JS minifier installation
        "npm install -g serve",  # Serve static assets locally for testing
        # type script json iteface generator
        "npm install -g tslib prettier json-to-typing",
    ]
}
if __name__ == "__main__":
    for x in sh.argv:
        if x in pkg:
            for c in pkg[x]:
                sh.cmd(f"pip install {c}", False)
        if x in cmd:
            for c in cmd[x]:
                sh.cmd(c, False)
