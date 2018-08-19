# Github_Submit_Helper
this is an tool that can help you submit and release your code automatically.
1、使用步骤：
（1）配置你的podspec文件，如下：
   def self.smart_version
    tag = `git describe --abbrev=0 --tags 2>/dev/null`.strip
    if $?.success? then tag else "0.0.1" end
  end
  s.version          = smart_version
（2）配置你的Github_Submit_Helper.sh

pod trunk push 'your pod name'.podspec --allow-warnings
#例如:
#pod trunk push MDStatePageKit.podspec --allow-warnings

在这里改为你自己的pod名称即可。
2、主要功能
（1）简单的自动代码commit、push操作，可以自动化代码提交；
（2）自动化tag递加升级，当然，第一个起始tag需要你来打；
（3）自动化代码发版到github；
