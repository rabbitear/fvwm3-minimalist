#!/usr/bin/env python3

"""
Trigger with:
  rofi -lines 5 -eh 3 -show ddgrsearch -modi "ddgrsearch:ddgr_search.sh"

for detailed instructions check rofi-script docs:
https://github.com/davatorium/rofi/blob/next/doc/rofi-script.5.markdown

Environment variables:
ROFI_RETV: an integer with the current state
  0: Initial call of script.
  1: Selected an entry.
  2: Selected a custom entry.
  10-28: Custom keybinding 1-19 ( need to be explicitely enabled by script ).

ROFI_INFO: is set when an entry is selected. It's set with the parameter
`info`. Example:
Selecting the entry generated by:
  `echo -en "aap\0icon\x1ffolder\x1finfo\x1ftest\n"`
would set ROFI_INFO with "test"
"""

import json
import os
import shlex
import subprocess
import sys
import webbrowser


retv = os.environ.get("ROFI_RETV")
info = os.environ.get("ROFI_INFO")
data = os.environ.get("ROFI_DATA")

entry = " ".join(sys.argv[1:])

if retv == "0":  # initial call of script
    print("\0delim\x1f;\n", end="")
    print("\0prompt\x1fddgr;", end="")
elif retv == "1":  # selected an entry
    webbrowser.open_new_tab(info)
elif retv == "2":  # selected a custom entry
    cmd = shlex.split("ddgr -n20 -x -C --json " + entry)
    proc = subprocess.run(cmd, capture_output=True, encoding="utf-8")
    if proc.returncode != 0 or not proc.stdout:
        sys.exit(proc.returncode)
    search_results = json.loads(proc.stdout)

    for res in search_results:
        title = res["title"].replace(";", ",")
        url = res["url"].replace(";", ",")
        abstract = res["abstract"].replace(";", ",")

        print(f"* {title}")
        print(f"  {url}")
        print(f"  {abstract}\0info\x1f{res['url']}", end=";")