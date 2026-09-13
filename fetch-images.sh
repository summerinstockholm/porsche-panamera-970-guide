#!/usr/bin/env bash
set -euo pipefail

mkdir -p assets/images

echo "Downloading real Porsche Panamera 970 photos from Wikimedia Commons..."

curl -L --fail --retry 3 \
  'https://upload.wikimedia.org/wikipedia/commons/5/5e/Porsche_970_Panamera_front.JPG' \
  -o assets/images/panamera-9701.jpg

curl -L --fail --retry 3 \
  'https://upload.wikimedia.org/wikipedia/commons/0/04/Porsche_Panamera_%28970%29_front.JPG' \
  -o assets/images/panamera-9702.jpg

# macOS: keep repository images reasonably small without adding dependencies.
if command -v sips >/dev/null 2>&1; then
  echo "Optimizing images with sips..."
  sips -Z 1600 -s format jpeg -s formatOptions 82 assets/images/panamera-9701.jpg >/dev/null
  sips -Z 1600 -s format jpeg -s formatOptions 82 assets/images/panamera-9702.jpg >/dev/null
fi

echo
echo "Done:"
ls -lh assets/images/panamera-9701.jpg assets/images/panamera-9702.jpg
