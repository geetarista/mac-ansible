all_dirs = $(shell echo "roles/$(role)/{defaults,files,handlers,library,meta,tasks,templates,vars}")
main_dirs = $(shell echo "roles/$(role)/{defaults,handlers,meta,tasks,vars}")
PLAY_ARGS?="--diff"

all: deps
	@ansible-playbook main.yml \
		$(PLAY_ARGS) \
		--ask-become-pass \
		# --vault-password-file .vault \

deps:
	@brew --version >/dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@python --version >/dev/null 2>/dev/null || brew install python
	@ansible --version >/dev/null || pip install ansible
	@ansible-galaxy install elliotweiser.osx-command-line-tools >/dev/null 2>/dev/null

role:
	@if [ "$($@)" = "" ]; then echo "Role is not defined. Pass role=rolename"; exit 1; fi
	@mkdir -p $(all_dirs)
	@touch $(main_dirs)/main.yml
	@for dirname in defaults handlers meta tasks vars; do \
		echo "---\n# $(role) $$dirname\n" > ./roles/$(role)/$$dirname/main.yml ;\
	done

upgrade:
	@ansible-playbook upgrade.yml

.PHONY: all, deps, upgrade
