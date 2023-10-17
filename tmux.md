# 面板迁移

命令格式：-t [session_name]:[window].[pane]
```shell
# join-pane -s [session_name]:[window].[pane] -t [session_name]:[window].[pane]
# join-pane -s [window].[pane] -t [window].[pane] 省略会话名称为在当前会话

# 将窗口1的1面板移动到窗口2的1面板
join-pane -s 1.1 -t 2.1
```
