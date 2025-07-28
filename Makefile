sync:
	bash ./sync-fraeym-dependencies.sh

apply:
	cd test && helmfile apply
