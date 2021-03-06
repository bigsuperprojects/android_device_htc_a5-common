#
# Common system properties for a5
#

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib/libril-qc-qmi-1.so \
    ril.subscription.types=NV,RUIM \
    ro.baseband.arch=msm \
    ro.data.large_tcp_window_size=true \
    ro.use_data_netmgrd=true \
    persist.data.netmgrd.qos.enable=true \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.rild.nitz_plmn="" \
    persist.rild.nitz_long_ons_0="" \
    persist.rild.nitz_long_ons_1="" \
    persist.rild.nitz_long_ons_2="" \
    persist.rild.nitz_long_ons_3="" \
    persist.rild.nitz_short_ons_0="" \
    persist.rild.nitz_short_ons_1="" \
    persist.rild.nitz_short_ons_2="" \
    persist.rild.nitz_short_ons_3="" \
    DEVICE_PROVISIONED=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.force_eri_from_xml=true \
    persist.radio.mode_pref_nv10=1 \
    ro.telephony.get_imsi_from_sim=true

# Allow tethering without provisioning app
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    persist.thermal.monitor=true \
    ro.qc.sdk.sensors.gestures=true \
    ro.vendor.extension_library=/vendor/lib/libqti-perfd-client.so \
    qcom.hw.aac.encoder=true

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    av.offload.enable=false \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.speaker=true \
    ro.qc.sdk.audio.fluencetype=fluence \
    tunnel.audio.encode=true \
    use.voice.path.for.pcm.voip=false

# AV
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true \
    mm.enable.smoothstreaming=true

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=0 \
    ro.gps.agps_provider=1

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=dyn \
    debug.egl.hw=1 \
    debug.mdpcomp.logs=0 \
    debug.sf.hw=1 \
    dev.pm.dyn_samplingrate=1 \
    persist.hwc.mdpcomp.enable=true \
    ro.sf.lcd_density=320 \
    ro.opengles.version=196608

# Input
PRODUCT_PROPERTY_OVERRIDES += \
    ro.input.noresample=1

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

# Time services
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

#sdcardfs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

#loglevel
#debugging, highest loglevel
PRODUCT_PROPERTY_OVERRIDES += \
    sys.init_log_level=7 \
    persist.logd.logpersistd=logcatd

# Art
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-flags=--no-watch-dog

# Legacy omx decoder support
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.less-secure=true \
    media.stagefright.legacyencoder=true 

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=smd
