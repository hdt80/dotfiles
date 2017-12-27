#!/bin/bash

cpp -P config.in config
sed -i 's/__NL__/\n/g' config
