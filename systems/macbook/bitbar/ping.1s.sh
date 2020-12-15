#!/bin/bash
# <bitbar.title>PING</bitbar.title>
# <bitbar.version>0.0.0</bitbar.version>
# <bitbar.author>quinnjn</bitbar.author>
# <bitbar.author.github>quinnjn</bitbar.author.github>
# <bitbar.desc>Pings 8.8.8.8</bitbar.desc>

response=$(ping -c 1 8.8.8.8 -nQ | head -n 2 | tail -n 1 | awk '{ split($7, a, "="); print a[2] }')
echo "📡 $response"
