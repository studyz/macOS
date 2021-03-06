#!/bin/bash

# #################################
echo "软件安装 anywhere"
sudo spctl --master-disable

# #################################
echo "显示文件路径"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES; killall Finder

# #################################
# echo "ShowAllFiles"
# defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder

# #################################
echo "深色主题浅色界面"
defaults write -g NSRequiresAquaSystemAppearance -bool Yes
# 恢复 defaults write -g NSRequiresAquaSystemAppearance -bool No

# #################################
echo "dock 零延迟"
defaults write com.apple.Dock autohide-delay -float 0; killall Dock

# #################################
echo "Super-fast animation"
defaults write com.apple.dock autohide-time-modifier -float 0.12; killall Dock

# #################################
echo "充电有iPhone声音"
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true; open /System/Library/CoreServices/PowerChime.app

# # #################################
echo "默认展开打印设置"
defaults write -g PMPrintingExpandedStateForPrint -bool TRUE

# #################################
echo "配置 Launchpad"
defaults write com.apple.dock springboard-columns -int 8; defaults write com.apple.dock springboard-rows -int 7; defaults write com.apple.dock ResetLaunchPad -bool TRUE; killall Dock

# #################################
echo "修改截路径到桌面"
defaults write com.apple.screencapture location ~/Desktop/screenshots; killall SystemUIServer

# #################################
echo "Install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# #################################
echo "install Oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo -e "######################\nBrew Install start\n######################"
brewapps=(
	"zsh:zsh"
	"mas:mas"
	"nmap:nmap"
	"you-get:you-get"
	"cask:cask"
	)
for apps in "${brewapps[@]}" ; do
    code="${apps%%:*}"
    name="${apps##*:}"
    brew install $code
    echo -e "$name installed!"
done



echo -e "######################\nMAS Install start\n######################"
masapps=(
	"1356178125:Outline App"
	"451108668:QQ"
	"836500024:WeChat"
	"441258766:Magnet"
	#"406056744:Evernote"
	"803453959:Slack"
	"1266674560:Wallpaper Wizard 2"
	"491854842:YoudaoDict"
	"1176895641:Spark"
	"1452453066:Hidden Bar"
	)
for apps in "${masapps[@]}" ; do
    code="${apps%%:*}"
    name="${apps##*:}"
    mas install $code
    echo -e "$name installed!"
done

echo -e "######################\nCASK Install start\n######################"
caskapps=(
	"iina:IINA"
	"fliqlo:fliqlo"
	"google-backup-and-sync:google-backup-and-sync"
	"grammarly:grammarly"
	"google-chrome:google-chrome"
	"handbrake:handbrake"
	"mendeley:mendeley"
	"itsycal:itsycal"
	"outline-manager:outline-manager"
	"writefull:writefull"
	"appcleaner:appcleaner"
	"sourcetree:sourcetree"
	"keka:keka"
	"cheatsheet:cheatsheet"
	"teamviewer:teamviewer"
	"omnidisksweeper:omnidisksweeper"
	"keycastr:keycastr"
	"etcher:etcher"
	"telegram:telegram"
	"atom:atom"
	#"tunnelblick:tunnelblick"
	#"alfred:alfred"
	#"mactex:mactex"
	)

for apps in "${caskapps[@]}" ; do
    code="${apps%%:*}"
    name="${apps##*:}"
    brew cask install $code
    echo -e "$name installed!"
done


# #################################
echo "Alfred 重启提示是否允许访问通讯录解决"
sudo codesign -f -d -s - /Applications/Alfred\ 3.app/Contents/Frameworks/Alfred\ Framework.framework/Versions/A/Alfred\ Framework

# #################################
echo "Wechat Plugin"
cd ~/Downloads && rm -rf WeChatPlugin-MacOS && git clone https://github.com/TKkk-iOSer/WeChatPlugin-MacOS && ./WeChatPlugin-MacOS/Other/Install.sh && rm -rf WeChatPlugin-MacOS

# #################################
echo "alias ls='ls -alh'
alias cask='brew cask'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'">>~/.zshrc && source ~/.zshrc



# WeChat Helper#################################
# cd ~/Downloads && rm -rf WeChatPlugin-MacOS && git clone https://github.com/TKkk-iOSer/WeChatPlugin-MacOS && ./WeChatPlugin-MacOS/Other/Install.sh && rm -rf WeChatPlugin-MacOS


# #################################
# 1. 在「系统偏好设置 - 通用」中将外观切换成「浅色」。
# 2. 打开终端，输入指令：
#defaults write -g NSRequiresAquaSystemAppearance -bool Yes
# 3. 注销并重新登录。这一步会关闭当前所有打开的应用，因此需要提前保存好所有文稿。
# 4. 在「系统偏好设置 - 通用」中将外观切换成「深色」。
