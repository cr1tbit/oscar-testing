sudo sysctl -w fs.pipe-max-size=32000000

export PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/sp5gni/leansdr/src/apps'

RTL_FREQ=742.5e6
RTL_SAMPLE_RATE=2400000 #2.4M samp/s.
LDVB_SYM_RATE=2000e3

# rtl_sdr -> leandvb -> vlc

rtl_sdr -g 23  -f $RTL_FREQ  -s $RTL_SAMPLE_RATE  -  |\
leandvb  --inpipe 32000000 \
--u8 \
 -f $RTL_SAMPLE_RATE \
--sr $LDVB_SYM_RATE \
--sampler rrc \
--rrc-rej 30 \
--standard DVB-S2 \
--ldpc-helper /home/sp5gni/xdsopl-LDPC-pabr/ldpc_tool \
--nhelpers 6 \
-v -d --gui  | \
vlc -

