# virtualenv 原理
把系统Python复制一份到virtualenv的环境，用命令source venv/bin/activate进入一个virtualenv环境时，virtualenv会修改相关环境变量，让命令python和pip均指向当前的virtualenv环境。
```shell
virtualenv ENV  # virtualenv -p python3 环境名称

# 不指定版本则使用系统默认版本
```

# 激活虚拟环境
```shell
source ENV/bin/activate
# 出现(venv)前缀，当前环境切换为virtualenv

```
# 退出虚拟环境
```shell
deactivate
# 若想删除虚拟环境，deactivate退出虚拟环境后直接删除目录即可
rm -rf ENV
```
# 实用技巧
记录安装的第三方模块
```shell
pip freeze > requirements.txt
# 若无重定向则直接打印出来

```
安装txt文件里所记录的所有第三方模块

```shell
pip install -r requirements.txt

```

