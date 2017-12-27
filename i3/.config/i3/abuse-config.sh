#!/bin/bash

cpp -P config.in config
sed -i 's/__NL__/\n/g' config

# Passing any argument will cause a restart instead of a reload
if [ $# -eq 0 ]; then
	i3-msg reload
else
	i3-msg restart
fi
