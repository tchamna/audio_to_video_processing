#!/usr/bin/env python
# coding: utf-8

# # Notebook to use nbparameterise
# Enter each csv file as a unique container to create a ipynb result and print as html

# import libraries
import pandas as pd
import nbformat
from nbclient import execute
from nbparameterise import extract_parameters, replace_definitions, parameter_values
import sys
import os
import shutil
import datetime as dt
from IPython import get_ipython


# Get the full path of the current script
script_path = __file__

# Extract just the script name from the full path
script_name = os.path.basename(script_path)

print(f"Running script {script_name}")




bilingual_audios_folder = sys.argv[1]
bilingual_phrases_path = sys.argv[2]
fonts_path = sys.argv[3]
background_image = sys.argv[4]

CWD = sys.argv[-1]

# 

# create list of items in directory
# dir_list = os.listdir();
notebook_name = "3_Produce_video_from_text_and_audio"
nb = nbformat.read(f"{notebook_name}.ipynb", as_version=4)

# get a list of Parameter objects
orig_parameters = extract_parameters(nb)

# update the parameters and run the notebook
params = parameter_values(orig_parameters, 
                          bilingual_audios_folder = bilingual_audios_folder, 
                          bilingual_phrases_path = bilingual_phrases_path,
                          fonts_path = fonts_path,
                          background_image = background_image)



print(f"Notebook {notebook_name} Processing ... Might take few times to process\n\n")

new_nb = replace_definitions(nb, params)
execute(new_nb)


print(f'END PROGRAM...{notebook_name}')

### END OF PROGRAM ###