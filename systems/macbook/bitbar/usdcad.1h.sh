#!/bin/bash
# <bitbar.title>USDCAD</bitbar.title>
# <bitbar.version>0.0.0</bitbar.version>
# <bitbar.author>quinnjn</bitbar.author>
# <bitbar.author.github>quinnjn</bitbar.author.github>
# <bitbar.desc>USD to CAD conversion rate.</bitbar.desc>

response=$(curl --silent 'https://api.exchangeratesapi.io/latest?base=USD&symbols=CAD')
rate=$(echo $response | awk '{split($0,a,":")l; print substr(a[3], 0,5)}')

echo "🇨🇦$rate"
