# import library
import speech_recognition as sr
import pyaudio
import wave
import phonetics

#from sound_play.msg import SoundRequest
#from sound_play.libsoundplay import SoundClient



keywords_color = ["red","blue","green","yellow","black","white"]
keywords_shade = ["dark", "light"]
keywords_length = ["long", "short"]
keywords_confirm = ["yes", "yeah", "okay", "no", "nope"]

chunk = 1024  # Record in chunks of 1024 samples
sample_format = pyaudio.paInt16  # 16 bits per sample
channels = 2
fs = 44100  # Record at 44100 samples per second
seconds = 4
filename = "output.wav"

p = pyaudio.PyAudio()  # Create an interface to PortAudio

voice = 'voice_kal_diphone'
volume = 1.0
#soundhandle = SoundClient()

def getInput():
    while(True):
        print('Recording input')

        stream = p.open(format=sample_format,
                        channels=channels,
                        rate=fs,
                        frames_per_buffer=chunk,
                        input=True)

        frames = []  # Initialize array to store frames

        # Store data in chunks for 3 seconds
        for i in range(0, int(fs / chunk * seconds)):
            data = stream.read(chunk)
            frames.append(data)

        # Stop and close the stream
        stream.stop_stream()
        stream.close()

        print('Finished recording')

        # Save the recorded data as a WAV file
        wf = wave.open(filename, 'wb')
        wf.setnchannels(channels)
        wf.setsampwidth(p.get_sample_size(sample_format))
        wf.setframerate(fs)
        wf.writeframes(b''.join(frames))
        wf.close()

        # Initialize recognizer class (for recognizing the speech)
        r = sr.Recognizer()

        # Reading Audio file as source
        # listening the audio file and store in audio_text variable
        with sr.AudioFile(filename) as source:
            audio_text = r.listen(source)

            # recoginize_() method will throw a request error if the API is unreachable, hence using exception handling
            try:
                # using google speech recognition
                text = r.recognize_google(audio_text)
                print('Converting audio transcripts into text ...')
                text_split = text.split()
                colors = list()
                lengths = list()
                shades = list()

                for word in text_split :
                    word_phonetic = phonetics.metaphone(word)

                    for color in keywords_color:
                        color_phonetic = phonetics.metaphone(color)
                        if(word_phonetic == color_phonetic):
                            colors.append(color)
                            break

                    for shade in keywords_shade:
                        shade_phonetic = phonetics.metaphone(shade)
                        if (word_phonetic == shade_phonetic):
                            shades.append(shade)
                            break

                    for length in keywords_length:
                        length_phonetic = phonetics.metaphone(length)
                        if (word_phonetic == length_phonetic):
                            lengths.append(length)
                            break

                print(text)
                print(colors)
                print(lengths)
                print(shades)
                return colors, lengths, shades

            except:
                print('Error. Repeating recording...')
    return []

def getConfirmation(): 
    # Confirm correct input
    while(True):
        print('Recording confirmation')

        stream = p.open(format=sample_format,
                        channels=channels,
                        rate=fs,
                        frames_per_buffer=chunk,
                        input=True)

        frames = []  # Initialize array to store frames

        # Store data in chunks for 3 seconds
        for i in range(0, int(fs / chunk * seconds)):
            data = stream.read(chunk)
            frames.append(data)

        # Stop and close the stream
        stream.stop_stream()
        stream.close()

        print('Finished recording')

        # Save the recorded data as a WAV file
        wf = wave.open(filename, 'wb')
        wf.setnchannels(channels)
        wf.setsampwidth(p.get_sample_size(sample_format))
        wf.setframerate(fs)
        wf.writeframes(b''.join(frames))
        wf.close()

        # Initialize recognizer class (for recognizing the speech)
        r = sr.Recognizer()

        # Reading Audio file as source
        # listening the audio file and store in audio_text variable
        with sr.AudioFile(filename) as source:
            audio_text = r.listen(source)

            # recoginize_() method will throw a request error if the API is unreachable, hence using exception handling
            try:

                # using google speech recognition
                text = r.recognize_google(audio_text)
                print('Converting audio transcripts into text ...')
                text_split = text.split()
                confirms = list()

                for word in text_split :
                    word_phonetic = phonetics.metaphone(word)

                    for confirm in keywords_confirm:
                        confirm_phonetic = phonetics.metaphone(confirm)
                        if (word_phonetic == confirm_phonetic):
                            confirms.append(confirm)
                            break
                
                print(text)
                print(confirms)
                return confirms

            except:
                print('Error. Repeating recording...')
    
    return []

def main():
    # Loop until input is succesfully confirmed.
    while (True):
        colors, length, shades = getInput()

        if (len(colors) == 1 and len(length) == 0 and len(shades) == 0):
            print('Color selected: ' + colors[0])
            #soundhandle.say(colors[0] + " color selected.", voice, volume)
        elif (len(colors) == 0 and len(length) == 1 and len(shades) == 1):
            print('Color hairstyle: ' + length[0] + ' ' + shades[0])
            #soundhandle.say(length[0] + " and " + shades[0] + " hairstyle selected.", voice, volume)
        else:
            print('Error. Invalid keyword combination. Repeat input')
            #soundhandle.say("Invalid input, please repeat.", voice, volume)
            continue

        print("Confirm input.")
        #soundhandle.say("Is selected data correct?", voice, volume)

        confirmation = getConfirmation()

        if (len(confirmation) == 1 and (confirmation[0] in ["yes", "yeah", "okay"])):
            break
        else:
            continue

    print("Input succesfully confirmed.")
    
    # Terminate the PortAudio interface
    p.terminate()
    return colors, length, shades

if __name__ == "__main__":
    main()