#!/bin/bash
# <bitbar.title>PYPL</bitbar.title>
# <bitbar.version>0.0.0</bitbar.version>
# <bitbar.author>quinnjn</bitbar.author>
# <bitbar.author.github>quinnjn</bitbar.author.github>
# <bitbar.desc>Shows PYPL stock price, and % changed since last close</bitbar.desc>

curl --silent https://terminal-stocks.herokuapp.com/PYPL | grep PayPal | awk '{ printf "PYPL %s (%s%%)", $5, $7 }'
