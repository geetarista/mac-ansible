all: deps
	@ansible-playbook mac.yml -i "127.0.0.1," $(ARGS)

deps:
	@sh -c "$(CURDIR)/scripts/deps.sh"

upgrade:
	@sh -c "$(CURDIR)/scripts/upgrade.sh"

.PHONY: all, deps, upgrade
