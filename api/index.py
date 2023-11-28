from flask import Flask, request, jsonify
from flask_cors import CORS
from g4f import ChatCompletion

app = Flask(__name__)
CORS(app, origins=['http://localhost', 'https://flask-api-vercel-docker-swart.vercel.app'])


@app.route('/api/chat', methods=['POST'])
def chat():
    data = request.get_json()
    response = ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user", "content": data['message']}],
        stream=True,
    )
    return jsonify({'response': list(response)})


@app.route("/")
def home():
    return jsonify({"message": "Hello, World!"})


@app.route("/api", strict_slashes=False)
def api():
    return jsonify({"message": "Hello, API!"})


