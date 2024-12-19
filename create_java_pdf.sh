#!/bin/bash

# Create a temporary directory
TEMP_DIR=$(mktemp -d)
OUTPUT_FILE="java_classes.html"

# Start HTML file
cat > "$TEMP_DIR/combined.html" << EOL
<!DOCTYPE html>
<html>
<head>
    <title>Java Classes Documentation</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        pre { background-color: #f5f5f5; padding: 15px; border-radius: 5px; }
        .module { margin-bottom: 30px; }
        .file { margin-bottom: 20px; }
        h1 { color: #2c3e50; }
        h2 { color: #34495e; border-bottom: 2px solid #eee; }
        h3 { color: #7f8c8d; }
    </style>
</head>
<body>
    <h1>Java Classes Documentation</h1>
EOL

# Function to process Java files
process_module() {
    local module_dir=$1
    local module_name=$(basename "$module_dir")
    
    # Create module header
    echo "<div class='module'>" >> "$TEMP_DIR/combined.html"
    echo "<h2>Module: $module_name</h2>" >> "$TEMP_DIR/combined.html"
    
    # Find and concatenate all Java files in the module
    find "$module_dir" -name "*.java" -type f | while read -r file; do
        echo "<div class='file'>" >> "$TEMP_DIR/combined.html"
        echo "<h3>File: $file</h3>" >> "$TEMP_DIR/combined.html"
        echo "<pre><code>" >> "$TEMP_DIR/combined.html"
        cat "$file" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g' >> "$TEMP_DIR/combined.html"
        echo "</code></pre>" >> "$TEMP_DIR/combined.html"
        echo "</div>" >> "$TEMP_DIR/combined.html"
    done
    
    echo "</div>" >> "$TEMP_DIR/combined.html"
}

# Process each module directory
for dir in */; do
    if [[ $dir == module* ]]; then
        process_module "$dir"
    fi
done

# Close HTML file
echo "</body></html>" >> "$TEMP_DIR/combined.html"

# Copy the final file
cp "$TEMP_DIR/combined.html" "$OUTPUT_FILE"

# Clean up
rm -rf "$TEMP_DIR"

echo "HTML file created successfully: $OUTPUT_FILE"
echo "Please open this file in your browser and use the browser's Print function to save as PDF"
