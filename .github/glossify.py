import sys as sys
import shutil as cmd
import pathlib as path
import subprocess
import os
import logging
import yaml
import re

IGNORE_SECTION = ["abbreviation.typ","bsgraphy.typ","glossary.typ"]

def main():
    logging.basicConfig(level=os.getenv('LOGLEVEL', 'INFO'))
    init_path = os.getcwd()
    glos_docs_list = ["/papers/thesis","/papers/docs"]
    for docs in glos_docs_list:
        os.chdir(path.Path(init_path+docs))
        for doc in os.listdir(path.Path(".")):
            Glossify(path.Path(init_path+docs+"/"+doc))

def GetYMLKeys(yml_path):
    with open(yml_path,"r") as g:
        yml = yaml.safe_load(g)
    return list(yml.keys())

def Glossify(doc_path):
    if not os.path.isdir(doc_path / "yml"):
        return

    glossary = GetYMLKeys(doc_path / "yml/glossary.yml")
    abbrs = GetYMLKeys(doc_path / "yml/abbreviation.yml")

    words = set(glossary+abbrs)

    sections_path= doc_path/"sections"

    for section in os.listdir(sections_path):
        if section in IGNORE_SECTION:
            continue

        s_path = sections_path/section
        original_text=s_path.read_text(encoding="utf-8")
        
        modified_text = "#import \"./glossary.typ\": glos\n"+original_text
        text_lines = modified_text.split("\n")

        for i,line in enumerate(text_lines):
            if "=" in line or "caption" in line:
                continue
            for word in words:
                text_lines[i]=re.sub(word,"#glos(\""+word+"\")",text_lines[i],flags=re.IGNORECASE)
                # lines[i]=lines[i].replace(word,"#glos(\""+word+"\")") 
        
        # print("\n".join(lines))
        s_path.write_text("\n".join(text_lines),encoding="utf-8")

if __name__ == "__main__":
    main()