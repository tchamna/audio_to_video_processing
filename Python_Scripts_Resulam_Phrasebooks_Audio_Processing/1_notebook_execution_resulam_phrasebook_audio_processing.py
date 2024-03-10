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

local_language_name = sys.argv[1]
# bilingual_audio_path = sys.argv[2]
# bilingual_phrases_path = sys.argv[3]
silence_threshold = float(sys.argv[2])
silence_padding_duration = float(sys.argv[3])
repeat_local_audio = int(sys.argv[4])

audio_path = sys.argv[5]
audio_path_eng = sys.argv[6]

flag_pad = sys.argv[7].lower() == "true"


CWD = sys.argv[-1]


# create list of items in directory
# dir_list = os.listdir();

notebook_name = "2_AudioProcessing_Phrasebooks_Resulam"

nb = nbformat.read(f"{notebook_name}.ipynb", as_version=4)

# get a list of Parameter objects
orig_parameters = extract_parameters(nb)

# update the parameters and run the notebook
params = parameter_values(orig_parameters, 
                          language = local_language_name, 
                        #   audio_path=bilingual_audio_path, 
                          silence_threshold = silence_threshold,
                          silence_padding_duration = silence_padding_duration,
                          repeat_local_audio=repeat_local_audio, 
                          audio_path = audio_path,
                          audio_path_eng = audio_path_eng,
                          flag_pad = flag_pad,
                          current_dir=CWD)

print(f"Notebook {notebook_name} Processing ... Might take few times to process\n\n")

new_nb = replace_definitions(nb, params)
execute(new_nb)


print(f'END PROGRAM...{notebook_name}')

### END OF PROGRAM ###

