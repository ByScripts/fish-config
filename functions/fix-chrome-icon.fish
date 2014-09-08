function fix-chrome-icon
	sudo sed -i "s/google-chrome-stable/google-chrome/g" /usr/share/applications/google-chrome.desktop
end
