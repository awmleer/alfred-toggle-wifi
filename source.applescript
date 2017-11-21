set airPortDevice to do shell script "/usr/sbin/networksetup -listallhardwareports | awk '{if($3==\"Wi-Fi\"){getline;print}}' | awk '{print $2}'"

set airPortPower to do shell script ("networksetup -getairportpower " & airPortDevice & " | awk '{print $4}'")

if airPortPower is equal to "on" or airPortPower is equal to "On" then
	do shell script ("/usr/sbin/networksetup -setairportpower " & airPortDevice & " off")
else
	do shell script ("/usr/sbin/networksetup -setairportpower " & airPortDevice & " on")
end if