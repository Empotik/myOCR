import gradio as gr
from pix2text import Pix2Text

# Initialize the Pix2Text instance
p2t = Pix2Text.from_config()

# Function to recognize text from an image
def recognize_text(image):
    result = p2t.recognize_page(image)  # Recognizing content from an image
    return result.to_markdown('output-dir')

# Function to recognize text from PDF
def recognize_pdf(pdf_file):
    result = p2t.recognize_pdf(pdf_file)
    return result.to_markdown('output-dir')

# Create the Gradio interface for PDF input
iface_pdf = gr.Interface(
    fn=recognize_pdf,
    inputs=gr.File(label="Upload PDF"),  # Use the file input for PDFs
    outputs=gr.Textbox(label="Recognized Content"),
    title="Pix2Text PDF Recognition",
    description="This interface recognizes text from PDF files."
)

iface = gr.Interface(
    fn=recognize_text,
    inputs=gr.Image(
        type="pil", 
        label="Upload Image for OCR", 
        sources=["upload", "clipboard"],  # Allow both upload and clipboard paste
    ),
    outputs=gr.Textbox(label="Recognized Text"),
    title="Pix2Text OCR Interface",
    description="This interface allows you to recognize text from an image using Pix2Text. You can either upload an image or paste an image from your clipboard.",
    live=True
)

# Launch the interface
iface.launch(server_name="0.0.0.0")