#!/bin/bash

SERVER="$1"

if [ -z "$SERVER" ]; then
  echo "USAGE: $0 address"
  exit
fi

for i in {0..5}; do
  echo "setting led $i to 10%: $(curl -s -XPOST "http://$SERVER/i?k=LED_${i}_DUTY&v=10")"
done

sleep 5
echo "Sleep 2s"

for i in {0..5}; do
  echo "setting led $i to 0%: $(curl -s -XPOST "http://$SERVER/i?k=LED_${i}_DUTY&v=0")"
done

for i in {0..2}; do
  echo "setting blower to 100%: $(curl -s -XPOST "http://$SERVER/i?k=BOX_${i}_BLOWER_DUTY&v=100")"
  sleep 2
  echo "setting blower to 0%: $(curl -s -XPOST "http://$SERVER/i?k=BOX_${i}_BLOWER_DUTY&v=0")"
done

echo
echo Reading temp/humi sensor values...
echo temp: $(curl -s http://$SERVER/i?k=BOX_0_TEMP) humi: $(curl -s http://$SERVER/i?k=BOX_0_HUMI)
echo temp: $(curl -s http://$SERVER/i?k=BOX_1_TEMP) humi: $(curl -s http://$SERVER/i?k=BOX_1_HUMI)
