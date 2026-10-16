function ls --description 'List files with directories first'
  LC_COLLATE=C command ls --color=auto --group-directories-first $argv
end
