# hello_world.py

html_content = """
<!DOCTYPE html>
<html>
<head>
    <title>Hello World Application</title>
</head>
<body>
    <h1>Hello, World!</h1>
    <p>Cloud engineer Challenge - Test 1</p>
</body>
</html>
"""

# Save the content to a file
with open("hello_world.html", "w") as file:
    file.write(html_content)
