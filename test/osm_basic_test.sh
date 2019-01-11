#!/bin/bash

find ./??_* -maxdepth 2 -type f -name "*.osm" -exec sh -c 'echo {}; echo -n "All elements        : "; cat {} | grep "Original coordinates" | wc -l; cat {} | grep "OSM link" | sort | uniq -cd;echo -n "Duplicated elements : "; cat {} | grep "OSM link" | sort | uniq -cd | wc -l;echo -n "New elements        : "; grep "id=\"-" {} | wc -l; echo ""' \;

echo "Name changes:"
find ./??_* -maxdepth 2 -type f -name "*.osm" -exec sh -c 'grep "name                             M" {}' \;

echo "SUMMARY"
echo -n "All elements        : "
grep  "Original coordinates" hu_*/*.osm | wc -l
echo -n "New elements        : "
grep "id=\"-" hu_*/*.osm | wc -l
