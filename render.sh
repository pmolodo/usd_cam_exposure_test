#!/bin/bash

set -e
set -u

render() {
    basename="$1"
    usd_file="${basename}.usda"
    png_file="${basename}.png"
    echo "Rendering: $usd_file"
    usdrecord --renderer GL --camera camera "${usd_file}" "${png_file}"
    echo
}

render 'exposureScale=0.0150_combo1'
render 'exposureScale=0.0150_time=.015'
render 'exposureScale=0.2500_exposure=-2'
render 'exposureScale=0.2500_fStop=2'
render 'exposureScale=0.3000_iso=30'
render 'exposureScale=0.3000_responsivity=.3'
render 'exposureScale=0.6144_combo2'
render 'exposureScale=1.0000_defaults'
render 'exposureScale=1.0000_explicit_defaults'
render 'exposureScale=1.2500_responsivity=1.25'
render 'exposureScale=1.2500_time=1.25'
render 'exposureScale=1.5625_fStop=.8'
render 'exposureScale=1.5625_iso=156.25'
render 'exposureScale=3.0000_combo3'
render 'exposureScale=4.0000_exposure=+2'