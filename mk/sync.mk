.PHONY: sync
SYNC_USER = dev01
SYCN_IP   = 10.120.100.39
sync:
	unison $(CWD) ssh://$(SYNC_USER)@$(SYCN_IP)//home/$(SYNC_USER)/$(APP)
