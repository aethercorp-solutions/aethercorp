#!/bin/bash

# Check if path/filename is provided
if [ -z "$1" ]; then
    echo "Usage: $0 path/filename.html"
    exit 1
fi

FILEPATH="$1"
DIRNAME=$(dirname "$FILEPATH")

if [ -e "$FILEPATH" ]; then
    echo "Error: File '$FILEPATH' already exists."
    exit 1
fi

# Create directory if it doesn't exist
mkdir -p "$DIRNAME"

# Write HTML content to the file
cat << 'EOF' > "$FILEPATH"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title> Title </title>
    <link rel="stylesheet" href="../../style.css">
    <script src="../../index.js"></script>
</head>
<body>
    <header>
        <nav class="corporate-nav">
            <div class="nav-container">
                <div class="title-header">
                    <h1 class="title"> Title </h1>
                    <p class="subtitle"> Subtitle </p>
                </div>        
            </div>
        </nav>
    </header>

    <main>
        <section>
            <h2> Subtitle </h2>
        </section>
    </main>

    <footer>
        <p class="copyright">
            &copy; <span id="year"></span> Aether Corp. All rights reserved.
        </p>
    </footer>
</body>
</html>
EOF

echo "HTML file '$FILEPATH' created successfully."
