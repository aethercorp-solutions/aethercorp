const fs = require('fs');
const path = require('path');

const ROOT_DIR = './files';
const OUTPUT_FILE = './files-list.js';

function getHtmlFiles(dir, fileList = []) {
  const files = fs.readdirSync(dir);

  files.forEach(file => {
    const fullPath = path.join(dir, file);
    const stat = fs.statSync(fullPath);

    if (stat.isDirectory()) {
      getHtmlFiles(fullPath, fileList);
    } else if (file.endsWith('.html')) {
      fileList.push(fullPath.replace(/\\/g, '/'));
    }
  });

  return fileList;
}

const htmlFiles = getHtmlFiles(ROOT_DIR);

const output =
`const htmlFiles = ${JSON.stringify(htmlFiles, null, 2)};`;

fs.writeFileSync(OUTPUT_FILE, output);

console.log('files-list.js generated successfully.');