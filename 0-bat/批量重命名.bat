@echo on						::取消回显
set a=1						::设置变量
setlocal EnableDelayedExpansion			::延迟变量
for %%n in (*.atlas) do (				::*为通配符，(*.txt)即所有.txt文件集合
	::ren "%%n" "!a!.atlas.txt"			::重命名命令，将匹配到的%%n重命名为a.jpg(a为变量)
	ren "%%n" "*.atlas.txt"	
	set /A a+=1				::变量a递增
)


for %%n in (*.skel) do (				::*为通配符，(*.txt)即所有.txt文件集合
	::ren "%%n" "!a!.atlas.txt"			::重命名命令，将匹配到的%%n重命名为a.jpg(a为变量)
	ren "%%n" "*.skel.bytes"	
	set /A a+=1				::变量a递增
)