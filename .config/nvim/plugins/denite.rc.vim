call denite#custom#map('insert', '<c-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<c-p>', '<denite:move_to_previous_line>', 'noremap')

if executable('rg')
    call denite#custom#var('file_rec', 'command',
         \ ['rg', '--files', '--glob', '!.git'])

    call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
endif
