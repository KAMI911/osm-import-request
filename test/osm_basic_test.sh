#!/bin/bash

find ./??_* -maxdepth 2 -type f -name "*.osm" -exec sh -c 'echo {}; echo -n "All elements        : "; cat {} | grep "Original coordinates" | wc -l; cat {} | grep "OSM link" | sort | uniq -cd;echo -n "Duplicated elements : "; cat {} | grep "OSM link" | sort | uniq -cd | wc -l;echo -n "New elements        : "; grep "id=\"-" {} | wc -l; echo ""' \;
