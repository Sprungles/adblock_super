#!/bin/bash

# Create the necessary folder structure
mkdir -p adblocker/scripts

# Create the manifest.json file
cat > adblocker/manifest.json << EOF
{
  "manifest_version": 2,
  "name": "Quantum Ad Blocker",
  "version": "1.0",
  "description": "An ad blocker extension using Quantum Ad List",
  "permissions": ["webRequest", "webRequestBlocking", "<all_urls>"],
  "background": {
    "scripts": ["scripts/contentScript.js"],
    "persistent": false
  },
  "content_scripts": [
    {
      "matches": ["<all_urls>"],
      "js": ["scripts/contentScript.js"]
    }
  ]
}
EOF

# Create the contentScript.js file
cat > adblocker/scripts/contentScript.js << EOF
function blockAds(details) {
  const adListUrl = 'https://gitlab.com/The_Quantum_Alpha/the-quantum-ad-list/raw/master/hosts';
  const xhr = new XMLHttpRequest();
  xhr.open('GET', adListUrl, false);
  xhr.send(null);
  
  const adList = xhr.responseText.split('\n');
  
  if (adList.some(ad => details.url.includes(ad))) {
    return { cancel: true };
  }
}

browser.webRequest.onBeforeRequest.addListener(
  blockAds,
  { urls: ['<all_urls>'] },
  ['blocking']
);
EOF

# Create a ZIP file for the extension
zip -r adblocker.zip adblocker

echo "Extension 'adblocker.zip' created successfully!"
