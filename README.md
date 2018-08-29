# Github_Submit_Helper
this is an tool that can help you submit and release your code automatically.

## 1、使用步骤：

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

## 2、主要功能
（1）简单的自动代码commit、push操作，可以自动化代码提交；
（2）自动化tag递加升级，当然，第一个起始tag需要你来打；
（3）自动化代码发版到github；

## 3、运行效果实例：

➜  MDEasyCache git:(master) sh Github_Submit_Helper.sh 
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
-------Begin-------
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
Counting objects: 5, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 458 bytes | 152.00 KiB/s, done.
Total 5 (delta 3), reused 0 (delta 0)
remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
To https://github.com/Leon0206/MDEasyCache.git
   44d7297..5592495  master -> master
10
自动升级tag为：1.0.11
Pushing to https://github.com/Leon0206/MDEasyCache.git
Total 0 (delta 0), reused 0 (delta 0)
POST git-receive-pack (200 bytes)
To https://github.com/Leon0206/MDEasyCache.git
 * [new tag]         1.0.11 -> 1.0.11
发布到Github：
Updating spec repo `master`

CocoaPods 1.6.0.beta.1 is available.
To update use: `sudo gem install cocoapods --pre`
[!] This is a test version we'd love you to try.

For more information, see https://blog.cocoapods.org and the CHANGELOG for this version at https://github.com/CocoaPods/CocoaPods/releases/tag/1.6.0.beta.1

Validating podspec
 -> MDEasyCache (1.0.11)
    - WARN  | summary: The summary is not meaningful.

Updating spec repo `master`

CocoaPods 1.6.0.beta.1 is available.
To update use: `sudo gem install cocoapods --pre`
[!] This is a test version we'd love you to try.

For more information, see https://blog.cocoapods.org and the CHANGELOG for this version at https://github.com/CocoaPods/CocoaPods/releases/tag/1.6.0.beta.1


--------------------------------------------------------------------------------
 🎉  Congrats

 🚀  MDEasyCache (1.0.11) successfully published
 📅  August 21st, 20:09
 🌎  https://cocoapods.org/pods/MDEasyCache
 👍  Tell your friends!
--------------------------------------------------------------------------------
--------End--------
➜  MDEasyCache git:(master) 

