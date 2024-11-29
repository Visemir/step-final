from flask import Flask, render_template_string

app = Flask(__name__)

@app.route("/")
def home():
    html = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Final Step Project</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }
            .content {
                text-align: center;
            }
            h1 {
                font-size: 2.5em;
                margin: 0.2em 0;
            }
            h2 {
                font-size: 1.5em;
                color: #555;
                margin: 0.2em 0;
            }
        </style>
    </head>
    <body>
        <div class="content">
            <h1>DAN IT</h1>
            <h2>FINAL STEP PROJECT</h2>
            <h2>KALINICHENKO OLEG</h2>
        </div>
    </body>
    </html>
    """
    return render_template_string(html)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
