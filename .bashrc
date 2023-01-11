# Including setings file
if [ -f $HOME/.shell_conf/aliases ]; then
	source $HOME/.shell_conf/aliases
fi

if [ -f $HOME/.shell_conf/prompt ]; then
	source $HOME/.shell_conf/prompt
fi

if [ -f $HOME/.shell_conf/variables ]; then
	source $HOME/.shell_conf/variables
fi

if [ -f $HOME/.shell_conf/functions ]; then
	source $HOME/.shell_conf/functions
fi

if [ -f $HOME/.shell_conf/settings ]; then
	source $HOME/.shell_conf/settings
fi

