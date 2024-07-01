#!/bin/bash
#space info

MB=1024 

space_root='SPACE_ROOT'
SPACE_BYTE=`df /root/ | grep / | awk '{print $2}'`
SPACE_ROOT=$(bc<<<"scale=2;$SPACE_BYTE/$MB")


./print.sh "$space_root" "$SPACE_ROOT MB"

spase_used='SPACE_ROOT_USED'
SPACE_BYTE_USED=`df /root/ | grep / | awk '{print $3}'`
SPACE_ROOT_USED=$(bc<<<"scale=2;$SPACE_BYTE_USED/$MB")

./print.sh "$spase_used" "$SPACE_ROOT_USED MB"

space_free='SPACE_ROOT_FREE'
SPACE_BYTE_FREE=`df /root/ | grep / | awk '{print $4}'`
SPACE_ROOT_FREE=$(bc<<<"scale=2;$SPACE_BYTE_FREE/$MB")

./print.sh "$space_free" "$SPACE_ROOT_FREE MB"

#df -BM