# ASF-Railway
在Railway.app上运行asf以及[telegram bot](https://github.com/zhongfly/telegram-bot-asf)（默认禁用）

## 使用方法简述
[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template?template=https%3A%2F%2Fgithub.com%2Fzhongfly%2FASF-Railway&envs=PORT&PORTDefault=1242&referralCode=y7njpi)

1. 点击上方的按钮，如果你未注册，则可以直接使用Github账号登录；若已登录，就会提醒你根据此模板在github中新建项目，请务必在`Private repo?`前方打勾！！！**否则会暴露你的steam账号！**
2. 在Github网站中，打开你刚才新建的Github项目，修改或上传你的ASF以及asf bot的配置文件到ASF/config文件中，如果你需要添加插件，上传到ASF/plugins中即可。把ASF文件夹视为ASF的工作目录即可
3. （可选）如果你需要使用telegram bot：将`entry.sh`以及`Dockerfile`中的每一行前面的`#`删除；然后按需要修改TG/tgbot.toml（具体参见[该项目](https://github.com/zhongfly/telegram-bot-asf)）
4. 等待 https://railway.app 上该项目构建完成
5. 打开对应的网址（ASF-UI）或使用telegram bot操作ASF

## 如何输入steam登录验证
每次修改Github项目中的文件后，Railway都会重新构建，会丢失登录状态，需要重新登录；或者将令牌导入到ASF中

由于限制，只能通过IPC输入验证

具体操作参见[ASF的相关介绍](https://github.com/JustArchiNET/ArchiSteamFarm/wiki/Commands-zh-CN#%E7%A4%BA%E4%BE%8B)

假定需要登录的BOT叫`me`，使用手机生成的 2FA 令牌登录

0. 打开ASF-UI的命令窗口或直接发送命令给telegram bot
1. `start me` -> 机器人会尝试登录，但因为缺少验证码而登录失败，然后因为 ASF 处于 Headless 模式，机器人会停止运行。 我们做这一步的目的是让 Steam 网络向我们发送验证码——否则我们就可以跳过这一步了。
2. `input me TwoFactorAuthentication ABCDE` -> 我们将 MySteamGuardBot 机器人的 2FA 令牌 输入设置为 ABCDE。 当然，这里的 ABCDE 需要换成我们收到的2FA验证码。
3. `start me` -> 我们重新启动已停止的机器人，这一次会自动使用我们在上一步中设置的验证码，登录将会成功，并且之前的验证码输入会被清除。
