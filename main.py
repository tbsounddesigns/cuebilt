import tkinter as tk
from tkinter import ttk
from tkinter import filedialog

import subprocess

from pathlib import Path

import csv

def main():
    app = Application()
    app.mainloop()

def call_handler_in_file(script_path, handler_name, *args):

    python_script_dir = Path(__file__).parent

    absolute_path = (python_script_dir / script_path).resolve()

    if args:
        formatted_args = ', '.join(f'"{arg}"' for arg in args)
        handler_call = f'{handler_name}({formatted_args})'
    else:
        handler_call = f'{handler_name}()'
    
    applescript = f'''
    set scriptPath to "{absolute_path}"
    set scriptAlias to POSIX file scriptPath as alias
    set myScript to load script scriptAlias
    tell myScript to {handler_call}
    '''
        
    result = subprocess.run(['osascript', '-e', applescript],
                           capture_output=True,
                           text=True)
    
class Application(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("CueBilt")

        self.geometry("")
        self.update_idletasks()

        self.columnconfigure(0, weight=1)

        self.QLabVersion_frame = qlabOpts(self)
        self.QLabVersion_frame.grid(row=0, column=0, sticky="nsew", padx=10)

        self.fileBrowser_frame = fileBrowser(self)
        self.fileBrowser_frame.grid(row=2, column=0, sticky="nsew", padx=10)

        self.chooseCols_frame = chooseCols(self)
        self.chooseCols_frame.grid(row=3, column=0, sticky="nsew", padx=10, pady=10)

        auxOptions_frame = auxOptions(self)
        auxOptions_frame.grid(row=4, column=0, padx=10, pady=10)

        self.transportOpts_frame = transportOpts(self, self.QLabVersion_frame, self.fileBrowser_frame, self.chooseCols_frame)
        self.transportOpts_frame.grid(row=5, column=0, padx=10, pady=10)

        self.focus()

class fileBrowser(ttk.Frame):
    def __init__(self, parent):
        super().__init__(parent)

        self.fileBrowserframe = ttk.LabelFrame(self, text="Select '.tsv' file:")
        self.fileBrowserframe.pack(fill="x", expand=True, side=tk.LEFT, padx=10, pady=10)

        self.path_label = ttk.Label(self.fileBrowserframe, text="No file selected", wraplength=150)
        self.path_label.pack(side=tk.LEFT, expand=True)

        self.browseButton = ttk.Button(self.fileBrowserframe, text="Browse...", command=self.browse_file)
        self.browseButton.pack(side=tk.RIGHT, expand=True)

    def browse_file(self):
        filepath = filedialog.askopenfilename(
            title="Select a .tsv file",
            defaultextension=".tsv",
            filetypes=(("Tab Separated Values", "*.tsv"),
                       ("All filetypes", "*.*"))
        )
        if filepath:
            self.path_label.config(text=filepath)

class qlabOpts(ttk.Frame):
    def __init__(self, parent):
        super().__init__(parent)
        
        self.QLabOptsFrame = ttk.Labelframe(self, text="Select QLab Version:")
        self.QLabOptsFrame.pack(padx=10, pady=10, fill="x", expand=True)

        qlab_versions = ['QLab 3', 'QLab 4','QLab 5']
        self.QVers = tk.StringVar(value='QLab 5')
        for index in range(len(qlab_versions)):
            self.qlabradioButtons = ttk.Radiobutton(self.QLabOptsFrame, text=qlab_versions[index], variable=self.QVers, value=qlab_versions[index], takefocus=0)
            self.qlabradioButtons.pack(side=tk.LEFT, expand=True, padx=10, pady=10)

        self.QLabCmmds_frame = ttk.Frame(self)
        self.QLabCmmds_frame.pack(fill="x", expand=True, side=tk.TOP)
        self.qcommdbutton1 = ttk.Button(self.QLabCmmds_frame, text="Open QLab", command=lambda: call_handler_in_file('./scripts/openQLab.scpt', 'openQLab', self.QVers.get())).pack(side=tk.LEFT, expand=True)
        self.qcommdbutton2 = ttk.Button(self.QLabCmmds_frame, text="New Workspace", command=lambda: call_handler_in_file('./scripts/openQLab.scpt', 'newQLabWorkspace', self.QVers.get())).pack(side=tk.LEFT, expand=True)

class chooseCols(ttk.Frame):
    def __init__(self, parent):
        super().__init__(parent)

        self.colInputFrame = ttk.Labelframe(self, text="Choose the column letters you'd like to pull from the spreadsheet:")
        self.colInputFrame.pack(padx=10, pady=10, fill="x", expand=True)

        self.colInputFrame.columnconfigure(0, weight=1)
        self.colInputFrame.columnconfigure(1, weight=1)
        self.colInputFrame.columnconfigure(2, weight=1)

        cueSheetCols = ['Q Number','Q Name','Notes']
        cueSheetAlpha = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
        cueShtCols = tk.IntVar()

        self.qlabel1 = ttk.Label(self.colInputFrame, text=cueSheetCols[0])
        self.qlabel1.grid(row=0, column=0, padx=5, sticky="nsew")
        self.colSpin1 = ttk.Spinbox(self.colInputFrame, values=cueSheetAlpha, width=5)
        self.colSpin1.grid(row=1, column=0, padx=5, sticky="nsew")

        self.qlabel2 = ttk.Label(self.colInputFrame, text=cueSheetCols[1])
        self.qlabel2.grid(row=0, column=1, padx=5, sticky="nsew")
        self.colSpin2 = ttk.Spinbox(self.colInputFrame, values=cueSheetAlpha, width=5)
        self.colSpin2.grid(row=1, column=1, padx=5, sticky="nsew")

        self.qlabel3 = ttk.Label(self.colInputFrame, text=cueSheetCols[2])
        self.qlabel3.grid(row=0, column=2, padx=5, sticky="nsew")
        self.colSpin3 = ttk.Spinbox(self.colInputFrame, values=cueSheetAlpha, width=5)
        self.colSpin3.grid(row=1, column=2, padx=5, sticky="nsew")

class auxOptions(ttk.Frame):
    def __init__(self, parent):
        super().__init__(parent)

        self.clearwkspcButton = ttk.Button(self, text="Clear Workspace", command=lambda: call_handler_in_file('./scripts/resetQLabWorkspace.scpt', "reset")).pack(side=tk.TOP, expand=True)

class transportOpts(ttk.Frame):
    def __init__(self, parent, QLabVersion_frame, fileBrowser_frame, chooseCols_frame):
        super().__init__(parent)

        self.QLabVersion_frame = QLabVersion_frame
        self.fileBrowser_frame = fileBrowser_frame
        self.chooseCols_frame = chooseCols_frame


        self.runButton = ttk.Button(
            self, 
            text="Run", 
            command=self.run_qlab
            )
        self.runButton.pack(side=tk.TOP, expand=True)

    def run_qlab(self):
        col1 = self.chooseCols_frame.colSpin1.get()
        col2 = self.chooseCols_frame.colSpin2.get()
        col3 = self.chooseCols_frame.colSpin3.get()
        qlab_version = self.QLabVersion_frame.QVers.get()
        filepath = self.fileBrowser_frame.path_label.cget("text")

        call_handler_in_file('./scripts/cuebiltMain.scpt', 'startQLab', col1, col2, col3, qlab_version, filepath)
        print("Hello!")
        print(col1)
        print(col2)
        print(col3)
        print(qlab_version)
        print(filepath)

    def run_qlab_test(self):
        call_handler_in_file('./scripts/cuebiltMain.scpt', 'startQLabtest', 5)

if __name__ == "__main__":
    main()