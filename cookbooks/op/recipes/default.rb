package 'subversion'
package 'ant'
package 'gnome-do'
package 'dconf-tools'
package 'gconf-editor'





gconf "/apps/gnome-do/preferences/Do/Platform/Common/AbstractKeyBindingService/Summon_Do" do
    action :set
    user 'mduvall'
    attr_val '<Super>Z'
    attr_type 'string'
end

gconf "/apps/gnome-do/preferences/Do/CorePreferences/AlwaysShowResults" do
    action :set
    user 'mduvall'
    attr_val true
    attr_type 'bool'    
end


ruby_block "kill gconfd-2 gconf settings will take effect" do
  block do
    output = `sudo -u mduvall ps -eF | sudo -u mduvall grep gconfd-2 |  sudo -u mduvall grep -v grep |  sudo -u mduvall awk '{print $2}' |  sudo -u mduvall  xargs kill -9`    
    output = output.strip()
    puts output
    # output = `sudo -u mduvall ps -eF | sudo -u mduvall grep gnome-do |  sudo -u mduvall grep -v grep |  sudo -u mduvall awk '{print $2}' |  sudo -u mduvall  xargs kill -9`    
    # output = output.strip()
    # puts output



  end
  action :create
end




gsettings "org.mate.screensaver" do
  option "idle-activation-enabled"
  value "false"
  user "mduvall"
end



gsettings "org.mate.screensaver" do
  option "lock-enabled"
  value "false"
  user "mduvall"
end



gsettings "org.mate.power-manager" do
  option "button-lid-ac"
  value "nothing"
  user "mduvall"
end



gsettings "com.linuxmint.mintmenu" do
  option "hot-key"
  value "<Super>C"
  user "mduvall"
end







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