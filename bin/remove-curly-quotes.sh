#!/bin/sh

for i in *.markdown; do sed -i ".bk" s/[”“]/'"'/g; done

# s/[’]/"'"/g $i;
