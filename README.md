# myOCR

Simple LaTeX syntax math equation extraction from image using pix2text as backend and Gradio as WebGUI

## Features

### Math Equation Extraction

you give it an image, it does its things. On CPU(or GPU if it's nvidia and supported), take a couple of seconds. Then if you're lucky, LaTeX style math equation.

### Two ways of upload the image

You can paste from clipboard (like you task screanshot) but not ctrl+V or that apple cmd thing + V to paste but click the little paste from clipboard icon. Also you can drag and drop image onto the UI.

### (supposed) PDF files extraction

pix2text seems to support this but it has been disabled in the UI cos I only need math equations for LLM to solve, LOL

## How To Use?

### Manual Deployment

1. Install python. python 3.10 works for me. Will see if python 3.12 also works or not, should be I guess
2. make a venv
   ```bash
   python venv venv
   ```
3. activate venv
   ```bash
   source venv/bin/activate
   ```
   or in windows
   ```batch
   venv\Script\activate
   ```
4. install requirements
   ```bash
   pip install requirements.txt
   ```
5. launch
   ```bash
   python app.py
   ```
6. do your things

### Auto Deployments

1. Install python
2. launch
   - In Windows, use double click `launch.bat`
   - In Linux do `chmod +x lanuch.sh` to elevate the permission first then launch `./launch.sh`
3. Do youre things

## Acknowledgment

- [pix2text](https://github.com/breezedeus/pix2text) by breezedeus
- [gradio](https://github.com/gradio-app/gradio)

## Future Works

- use other models for imporved accuracy. I think pix2text did under the hood use YOLO like models.
- reinventing the whele; instead of relying on pix2text, I suppose I can use ONNX models for a better performance and compatibility
