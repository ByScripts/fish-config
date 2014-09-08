function freebox-mount
	sudo mount -t cifs //mafreebox.freebox.fr/Disque\ dur /media/freebox -o user=freebox,password=2405,uid=1000,gid=1000,rw
end
