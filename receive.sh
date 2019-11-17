sudo sysctl -w fs.pipe-max-size=32000000

export PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/sp5gni/leansdr/src/apps'

FREQ=742.5e6
RTL_SAMPLE_RATE=2400000


rtl_sdr -g 23  -f $FREQ  -s $RTL_SAMPLE_RATE  -  |\
leandvb  --inpipe 32000000 \
--u8 \
--sr 2000e3 \
--sampler rrc \
--rrc-rej 30 \
--standard DVB-S2 \
--ldpc-helper /home/sp5gni/xdsopl-LDPC-pabr/ldpc_tool \
--nhelpers 6 \
-v -d --gui  | \
vlc -

