from flask import Flask, jsonify

app = Flask(__name__)


products = [
    {"id": 1, "name": "DevOps Masterclass Book", "price": 29.99},
    {"id": 2, "name": "Kubernetes T-Shirt", "price": 19.99},
    {"id": 3, "name": "Docker Coffee Mug", "price": 12.99}
]

@app.route('/api/products', methods=['GET'])
def get_products():
    return jsonify(products)

@app.route('/health', methods=['GET'])
def health_check():
    return jsonify({"status": "Product Catalog Service is healthy!"})

if __name__ == '__main__':
    # Listen on all network interfaces inside the container
    app.run(host='0.0.0.0', port=5000)
