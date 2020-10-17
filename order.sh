

cd /Users/doni.winata/Documents/GitHub/flutter_memory_game/assets/
ls -v | cat -n | while read n f; do mv -n "$f" "$n.webp"; done
