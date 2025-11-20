# $OpenBSD: dot.profile,v 1.8 2022/08/10 07:40:37 tb Exp $
#
# sh/ksh initialization

cat <<'EOF'
               (`.         ,-,
               `\ `.    ,;' /
                \`. \ ,'/ .'
          __     `.\ Y /.'
       .-'  ''--.._` ` (
     .'            /   `
    ,           ` '   Q '
    ,         ,   `._    \
    |         '     `-.;_'
    `  ;    `  ` --,.._;
    `    ,   )   .'
     `._ ,  '   /_
        ; ,''-,;' ``-
         ``-..__\``--`

EOF

if [ -f "$HOME/configs/quotes.txt" ]; then
    RANDOM_QUOTE=$(awk 'BEGIN{srand()} {arr[NR]=$0} END{print arr[int(rand()*NR)+1]}' "$HOME/configs/quotes.txt")
    printf "\n\033[1;33m%s\033[0m\n\n" "$RANDOM_QUOTE"
fi

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin
export PATH HOME TERM

. ~/.kshrc

alias vi=vim



