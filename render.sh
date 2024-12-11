#!/bin/bash

usdrecord --renderer GL --camera camera exposure_+3.usda exposure_+3.png
usdrecord --renderer GL --camera camera exposure_-3.usda exposure_-3.png
usdrecord --renderer GL --camera camera exposure_0.usda exposure_0.png
usdrecord --renderer GL --camera camera exposure_ref.usda exposure_ref.png