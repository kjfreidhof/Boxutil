import os
import subprocess

def setup():
    apt_install = [
            #"sudo",
            "apt-get",
            "install",
            "dialog",
        

    ]

    command = " ".join(apt_install)

    subprocess.run(command, shell=True)



setup()

def run_script():
    bash_run = [
            "sudo", 
            "bash",
            "Box_util.sh"



    ]

    command = " ".join(bash_run)
    subprocess.run(command, shell=True)


run_script()



