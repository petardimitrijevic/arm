# This file must be used with "source bin/activate" *from bash*
# you cannot run it directly

# Change this line to your installation path
export PATH_TO_ARM_GCC="~/development/gcc-linaro-armeb-linux-gnueabihf-4.8-2014.04_linux/bin"
# Adjust to your needs
export PROMPT="(arm)$PS1"

deactivate() {
    unset CC

    # If there was a previous CC restore it
    if [ -n "$_OLD_CC" ] ; then
	export CC="$_OLD_CC"
	unset _OLD_CC
    fi
	
    # Restore the path
    if [ -n "$_OLD_PATH" ] ; then
	export PATH="$_OLD_PATH"
	unset _OLD_PATH
    fi

    # This should detect bash and zsh, which have a hash command that must
    # be called to get it to forget past commands.  Without forgetting
    # past commands the $PATH changes we made may not be respected
    if [ -n "$BASH" -o -n "$ZSH_VERSION" ] ; then
        hash -r
    fi

    # Unset the prompt
    if [ -n "$_OLD_PS1" ] ; then
	export PS1="$_OLD_PS1"
	unset _OLD_PS1
    fi

    # Suicide
    unset -f deactivate
}

# Add the arm compiler to the path
_OLD_PATH="$PATH"
PATH="$PATH_TO_ARM_GCC:$PATH"
export PATH

# We are unsetting CC if set
if [ -n "CC" ]; then
    _OLD_CC="$CC"
    unset CC
fi

# Finally set arm prefix
export CC="$PATH_TO_ARM_GCC/arm-linux-gnueabihf-"

# Change the command prompt
_OLD_PS1="$PS1"
export PS1="$PROMPT"

# This should detect bash and zsh, which have a hash command that must
# be called to get it to forget past commands.  Without forgetting
# past commands the $PATH changes we made may not be respected
if [ -n "$BASH" -o -n "$ZSH_VERSION" ] ; then
    hash -r
fi
