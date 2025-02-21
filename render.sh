#!/bin/bash

set -e
set -u

THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

render() {
    basename="$1"
    usd_file="${basename}.usda"
    png_file="${basename}.png"
    echo "Rendering: $usd_file"
    usdrecord --renderer GL --camera camera "${usd_file}" "${png_file}"
    echo
}

render "${THIS_DIR}/exposureScale=0.0150_combo1"
render "${THIS_DIR}/exposureScale=0.0150_time=.015"
render "${THIS_DIR}/exposureScale=0.2500_exposure=-2"
render "${THIS_DIR}/exposureScale=0.2500_fStop=2"
render "${THIS_DIR}/exposureScale=0.3000_iso=30"
render "${THIS_DIR}/exposureScale=0.3000_responsivity=.3"
render "${THIS_DIR}/exposureScale=0.6144_combo2"
render "${THIS_DIR}/exposureScale=1.0000_defaults"
render "${THIS_DIR}/exposureScale=1.0000_explicit_defaults"
render "${THIS_DIR}/exposureScale=1.2500_responsivity=1.25"
render "${THIS_DIR}/exposureScale=1.2500_time=1.25"
render "${THIS_DIR}/exposureScale=1.5625_fStop=.8"
render "${THIS_DIR}/exposureScale=1.5625_iso=156.25"
render "${THIS_DIR}/exposureScale=3.0000_combo3"
render "${THIS_DIR}/exposureScale=4.0000_exposure=+2"

# extra check that get same results with SceneIndex vs SceneDelegate
echo "Testing with SceneDelegate"
USDIMAGINGGL_ENGINE_ENABLE_SCENE_INDEX=0 usdrecord --renderer GL --camera camera "${THIS_DIR}/exposureScale=0.6144_combo2.usda" "${THIS_DIR}/exposureScale=0.6144_combo2.without-scene-index.png"
echo

echo "Testing with SceneIndex"
USDIMAGINGGL_ENGINE_ENABLE_SCENE_INDEX=1 usdrecord --renderer GL --camera camera "${THIS_DIR}/exposureScale=0.6144_combo2.usda" "${THIS_DIR}/exposureScale=0.6144_combo2.with-scene-index.png"
echo