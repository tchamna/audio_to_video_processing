import os
import numpy as np
from pydub import AudioSegment
import noisereduce as nr
import streamlit as st
from natsort import natsorted

# Function to convert MP3 to numpy array
def mp3_to_np_array(mp3_file):
    audio = AudioSegment.from_mp3(mp3_file)
    samples = np.array(audio.get_array_of_samples())
    sample_rate = audio.frame_rate
    return sample_rate, samples

# Function to convert numpy array to audio file (MP3)
def np_array_to_mp3(output_file, sample_rate, samples):
    audio = AudioSegment(
        samples.tobytes(),
        frame_rate=sample_rate,
        sample_width=samples.dtype.itemsize,
        channels=1
    )
    audio.export(output_file, format="mp3")

# Streamlit app
def main():
    st.title("Audio Noise Reduction")

    # Folder selection
    audio_folder = st.text_input("Enter the path to the folder containing MP3 files:")

    # Noise reduction proportion
    prop_decrease = st.slider(
        "Select noise reduction proportion (0.0 to 1.0):",
        min_value=0.0,
        max_value=1.0,
        value=0.5,
        step=0.01,
        help="The higher the number, the more noise you remove. Start with lower values (e.g., 0.1 to 0.5) and gradually increase."
    )

    if audio_folder and st.button("Start Noise Reduction"):
        if not os.path.isdir(audio_folder):
            st.error("The specified folder does not exist. Please check the path and try again.")
        else:
            suffix = f"denoised_{prop_decrease:.2f}"
            output_folder = os.path.join(audio_folder, suffix)

            if not os.path.exists(output_folder):
                os.makedirs(output_folder)

            audio_files = [f for f in os.listdir(audio_folder) if f.endswith(".mp3")]
            audio_files = natsorted(audio_files)

            for filename in audio_files:
                input_file = os.path.join(audio_folder, filename)
                output_file = os.path.join(output_folder, filename)

                sample_rate, samples = mp3_to_np_array(input_file)
                reduced_noise = nr.reduce_noise(y=samples, sr=sample_rate, prop_decrease=prop_decrease)
                np_array_to_mp3(output_file, sample_rate, reduced_noise)

                st.write(f'Noise reduction completed for {input_file}. Output saved as {output_file}')

            st.success(f"Noise reduction completed. Denoised files are saved in {output_folder}")

if __name__ == "__main__":
    main()
