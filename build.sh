#!/bin/bash

echo building main...
idris --build main.ipkg

echo building example view...
idris --build view.ipkg
