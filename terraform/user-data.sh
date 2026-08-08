#!/bin/bash
yum update -y
yum install -y python3 git

pip3 install flask

mkdir -p /home/ec2-user/app
cd /home/ec2-user/app

cat << 'EOF' > app.py
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def index():
    name = None
    if request.method == "POST":
        name = request.form.get("name")
    return render_template("index.html", name=name)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
EOF

mkdir templates

cat << 'EOF' > templates/index.html
<!DOCTYPE html>
<html>
<head>
    <title>DevOps Demo App</title>
</head>
<body>
    <h1>Welcome to the DevOps Demo App</h1>
    <form method="POST">
        <label>Enter your name:</label>
        <input type="text" name="name">
        <button type="submit">Submit</button>
    </form>
    {% if name %}
        <p>Hello {{ name }}! Your application deployed successfully.</p>
    {% endif %}
</body>
</html>
EOF

python3 app.py &