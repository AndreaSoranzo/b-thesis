import sys as sys
import shutil as cmd
import pathlib as path
import subprocess
import os
import logging

LIST_TEMPLATE = '<a href="{{doc_link}}" target="_blank">{{doc_name}}</a>'

class PDF:
    def __init__(self,name:str,new_name:str=""):
        self.name = name
        self.new_name = new_name
    def GetName(self,WExt=False):
        if WExt:
            return self.name+'.pdf'
        else :
            s = self.name
            if self.new_name!="":
                s = self.new_name
            return s.upper()

def main():
    logging.basicConfig(level=os.getenv('LOGLEVEL', 'INFO'))
    init_path = os.getcwd()
    logging.info(f'Creating the workspace')
    cmd.rmtree('_site', ignore_errors=True)
    cmd.copytree('site', '_site', symlinks=False)
    html = path.Path('_site/index.html').read_text(encoding="utf8")
    pdfs = {}

    BuildTyp(init_path,"/papers/logs", pdfs) # logs
    BuildTyp(init_path,"/papers/docs", pdfs) # progect docs
    BuildTyp(init_path,"/papers/thesis", pdfs) # thesis

    UpdateHtml(html,pdfs)


def BuildTyp(init_path:str, file_path:str, pdfs:dict[str, list],):
    logging.info(f'Building logs typ files')
    d_type = file_path.removeprefix("/papers/")
    pdfs[d_type]=[]
    os.chdir(path.Path(init_path+file_path))
    for doc in os.listdir(path.Path(".")):
        result = subprocess.run(["typst", "compile", "--root","../../." , "--font-path", "../../public/font"] + [path.Path(doc+"/"+doc+".typ")], stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
        try:
            result.check_returncode()
        except Exception as _:
            logging.error(f"Compiling {doc} failed with stderr: \n{result.stderr}")
            exit(1)
        cmd.move(doc+"/"+doc+".pdf",path.Path("../../_site/"+doc+".pdf"))
        if "piano_di_lavoro" in doc:
            pdfs["work_plan"]=[]
            pdfs["work_plan"].append(PDF(doc))
        else:
            pdfs[d_type].append(PDF(doc,"project_log") if "logs" in file_path else PDF(doc))
    os.chdir(init_path)


def UpdateHtml(html:str,pdfs:dict[str, list]):
    logging.info(f'Updating the HTML')
    for d_type in pdfs:
        t_doc = d_type.upper()

        html = html.replace("{{"+ t_doc +"}}","\n".join(MakeLink(pdf) for pdf in pdfs[d_type]))
    path.Path('_site/index.html').write_text(html, encoding='utf8')

def MakeLink(pdf:PDF):
    if "piano_di_lavoro" in pdf.GetName(True):
        return LIST_TEMPLATE.replace("{{doc_link}}",pdf.GetName(True)).replace("{{doc_name}}",pdf.GetName())
    return "<li>"+LIST_TEMPLATE.replace("{{doc_link}}",pdf.GetName(True)).replace("{{doc_name}}",pdf.GetName())+"</li>"

if __name__ == "__main__":
    main()
