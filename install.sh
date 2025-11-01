#!/bin/bash

configurationsList=(nvim)

installConfigurations(){
  echo "#### Installing Configurations ####"

	for i in "${!configurationsList[@]}"; do
		stow -d $HOME/dotfiles -t $HOME -S  "${configurationsList[i]}"
	done

  echo "####    Finish Instalation     ####"
}


case $1 in
  -i | --install) installConfigurations ;;
  *) echo "Dotfiles Installer:" ;;
esac
