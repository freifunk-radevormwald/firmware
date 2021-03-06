# site.mk for Freifunk im Neanderland - gluon 2018.2.x

GLUON_MULTIDOMAIN=1

# for feature packs see https://github.com/freifunk-gluon/gluon/blob/v2018.2.x/package/features
GLUON_FEATURES := \
	web-wizard \
	web-advanced \
	mesh-batman-adv-15 \
	respondd \
	autoupdater \
	ebtables \
	ebtables-limit-arp \
	radv-filterd \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-source-filter \
	mesh-vpn-fastd \
	radvd \
	status-page\

# eulenfunk:
GLUON_SITE_PACKAGES := \
	gluon-weeklyreboot \
	gluon-hotfix \
	gluon-quickfix \
	gluon-txpowerfix \
	gluon-banner \
	gluon-linkcheck \
	gluon-config-mode-geo-location-osm \
	gluon-config-mode-domain-select \
	respondd-module-airtime \


# PROBLEM:
# ev. macht dieses paket:
# - ffho-ath9k-blackout-workaround
# das selbe wie diese beiden zusammen:
# - gluon-hotfix 
# - gluon-quickfix
# ffho not working, see https://github.com/FreifunkHochstift/ffho-packages/pull/8
#GLUON_SITE_PACKAGES += \
#	ffho-ath9k-blackout-workaround

# ffffm 
# ev. kann man ffffm-additional-wifi-json-info teilweise durch standard gluon respondd-module-airtime ersetzen
GLUON_SITE_PACKAGES += \
	ffffm-keep-radio-channel \
	ffffm-button-bind 

# ffki:
GLUON_SITE_PACKAGES += \
	gluon-config-mode-ppa 

# ffnord:
GLUON_SITE_PACKAGES += \
	gluon-ssid-changer 

# openwrt:
GLUON_SITE_PACKAGES += \
	haveged \
	iptables \
	iwinfo \
	socat

DEFAULT_GLUON_RELEASE := SBRANCH

ifeq ($(GLUON_TARGET),ar71xx-tiny)
GLUON_SITE_PACKAGES += zram-swap
endif

ifeq ($(GLUON_TARGET),ar71xx-generic)
GLUON_SITE_PACKAGES += zram-swap
endif

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

GLUON_PRIORITY ?= 0
GLUON_LANGS ?= de en 
GLUON_REGION ?= eu
GLUON_ATH10K_MESH ?= 11s
