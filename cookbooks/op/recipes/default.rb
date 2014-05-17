


#sudo ln -s mate-keyring gnome-keyring
#sudo ln -s mate-keyring-daemon gnome-keyring-daemon

#lrwxrwxrwx 1 root root     12 May 17 12:48 gnome-keyring -> mate-keyring
#lrwxrwxrwx 1 root root     19 May 17 12:48 gnome-keyring-daemon -> mate-keyring-daemon



link "/usr/bin/gnome-keyring" do
  to "/usr/bin/mate-keyring"
  link_type :symbolic
  action :create
end


link "/usr/bin/gnome-keyring-daemon" do
  to "/usr/bin/mate-keyring-daemon"
  link_type :symbolic
  action :create
end