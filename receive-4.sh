sudo sysctl -w fs.pipe-max-size=32000000

export PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/sp5gni/leansdr/src/apps'

MONITOR_SYM_RATE=2000e3 # 2MS/s, 1MS/s, 500kS/s, 333kS/s, 250kS/s
MONITOR_FREQ=492.5
RTL_FREQ=(MONITOR_FREQ +250.0) * 1e6
# RTL_FREQ=742.5e6
RTL_SAMPLE_RATE=2400000 #2.4M samp/s.


# rtl_sdr -> leandvb -> vlc

rtl_sdr -g 23  -f $RTL_FREQ  -s $RTL_SAMPLE_RATE  -  |\
leandvb  --inpipe 32000000 \
--u8 \
 -f $RTL_SAMPLE_RATE \
--sr $MONITOR_SYM_RATE \
--sampler rrc \
--rrc-rej 30 \
--standard DVB-S2 \
--ldpc-helper /home/sp5gni/xdsopl-LDPC-pabr/ldpc_tool \
--nhelpers 6 \
-v -d --gui  | \
vlc -

