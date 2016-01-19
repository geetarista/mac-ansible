all: deps
	@ansible-playbook mac.yml -i '128.0.0.1,' --vault-password-file .vault-password $(ARGS) # --ask-vault-pass

deps:
	@sh -c "$(CURDIR)/scripts/deps.sh"

upgrade:
	@sh -c "$(CURDIR)/scripts/upgrade.sh"

.PHONY: all, deps, upgrade
