import sys as sys
import shutil as cmd
import pathlib as path
import subprocess
import os
import logging
import yaml

IGNORE_SECTION = ["abbreviation.typ","bsgraphy.typ","glossary.typ"]

def main():
    logging.basicConfig(level=os.getenv('LOGLEVEL', 'INFO'))
    init_path = os.getcwd()
    glos_docs_list = ["/papers/thesis"]
    for docs in glos_docs_list:
        os.chdir(path.Path(init_path+docs))
        for doc in os.listdir(path.Path(".")):
            Glossify(path.Path(init_path+docs+"/"+doc))

def GetYMLKeys(yml_path):
    with open(yml_path,"r") as g:
        yml = yaml.safe_load(g)
    return list(yml.keys())

def Glossify(doc_path):
    glossary = GetYMLKeys(doc_path / "yml/glossary.yml")
    abbrs = GetYMLKeys(doc_path / "yml/abbreviation.yml")

    words = set(glossary+abbrs)

    sections_path= doc_path/"sections"

    for section in os.listdir(sections_path):
        if section in IGNORE_SECTION:
            continue
        
        s_path = sections_path/section
        original_text=s_path.read_text(encoding="utf-8")
        
        modified_text = original_text
        for word in words:
            modified_text=modified_text.replace(word,"#glos(\""+word+"\")") 
        
        s_path.write_text(modified_text,encoding="utf-8")

if __name__ == "__main__":
    main()