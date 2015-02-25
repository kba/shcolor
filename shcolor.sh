ESC_SEQ="\x1b["
# ESC_SEQ="x1b["
cReset="${ESC_SEQ}39;49m"
cBold=";1"
cUnderline=";4"
cStopBold="${ESC_SEQ}24m"
cStopUnderline="${ESC_SEQ}21m"
cForeground="${ESC_SEQ}3"
cForeground256="${ESC_SEQ}38;5;"
cBackground="${ESC_SEQ}4"
cBackground256="${ESC_SEQ}48;5;"
[[ ! -z "$BASH" ]]        && ACTUAL_SHELL="bash"
[[ ! -z "$ZSH_VERSION" ]] && ACTUAL_SHELL="zsh"
internalC() {
    local whichground=$1
    local color=$2
    local bold=$3
    local underline=$4
    local flag256=""
    local output=""
    [[ "$color" =~ ^[0-9]{2,3}$ ]] && flag256=256
    local varname="c${whichground}ground${flag256}"
    [[ "$ACTUAL_SHELL" == "zsh"  ]] && output="${(P)varname}$color"
    [[ "$ACTUAL_SHELL" == "bash" ]] && output="${!varname}$color"
    # [[ -z "$underline" ]] && output="${output}${cUnderline}"
    # [[ -z "$bold"      ]] && output="${output}${cBold}"
    output="${output}m"
    echo -ne "$output"
}
C() {
    local bold=""
    local underline=""
    if [[ -z "$1" ]];then
        echo -e "$cReset"
        return
    elif [[ "$1" == "-" ]];then
        shift
    else
        local color=$1
        if [[ "$2" == "b" ]];then
            bold=1
            shift
        fi
        if [[ "$2" == "u" ]];then
            underline=1
            shift
        fi
        internalC "Fore" $color $bold $underline
        shift
    fi
    if [[ ! -z $1 ]];then
        internalC "Back" $1
    fi
}
# echo -e "foo$(C 3)bar$(C)"
# echo -e $(C)
echo -e "foo$(C 3)bar$(C 21 u 123)quu`C`$(C 2)blaz$(C)"
echo -e $cReset
