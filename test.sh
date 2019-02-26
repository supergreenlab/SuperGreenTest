#!/bin/bash

# curl -XPOST 'http://supergreendriver.local/i?k=LED_4_BOX&v=0'
# curl -XPOST 'http://supergreendriver.local/i?k=LED_5_BOX&v=0'

for i in {0..5}; do
  curl -XPOST "http://supergreendriver.local/i?k=LED_${i}_DUTY&v=10"
  sleep 0.1
done

for i in {0..5}; do
  curl -XPOST "http://supergreendriver.local/i?k=LED_${i}_DUTY&v=0"
  sleep 0.1
done

for i in {0..1}; do
  curl -XPOST "http://supergreendriver.local/i?k=BOX_${i}_BLOWER&v=100"
  sleep 1
done

for i in {0..1}; do
  curl -XPOST "http://supergreendriver.local/i?k=BOX_${i}_BLOWER&v=0"
done


# curl -XPOST 'http://supergreendriver.local/i?k=LED_4_BOX&v=1'
# curl -XPOST 'http://supergreendriver.local/i?k=LED_5_BOX&v=1'

echo
echo Reading temp/humi sensor values...
echo temp: $(curl -s http://supergreendriver.local/i?k=BOX_0_SHT21_TEMP_C) humi: $(curl -s http://supergreendriver.local/i?k=BOX_0_SHT21_HUMI)

echo Downloading config.yml.gz
curl  http://supergreendriver.local/fs/config.yml.gz >> /dev/null
